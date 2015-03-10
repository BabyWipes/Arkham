//
//  Monster.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/26/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Monster.h"
#import "Game.h"
#import "Location.h"
#import "Neighborhood.h"
#import "Die.h"

@implementation Dimension
+(instancetype)type:(MonsterDimensionSymbol)type{
    return [[Dimension alloc] initWithType:type];
}
-(instancetype)initWithType:(MonsterDimensionSymbol)type {
    self = [super init];
    if (self){
        self.value = type;
    }
    return self;
}
-(BOOL)equalsDimension:(Dimension*)other{
    return (self.value == other.value);
}

@end

@implementation Monster
-(id)initWithProperties:(NSDictionary *)properties {
    self = [super init];
    if (self){
        self.name = properties[@"name"];
        self.toughness = [properties[@"toughness"] integerValue];
        self.horrorRating = [properties[@"horror_rating"] integerValue];
        self.horrorDamage = [properties[@"horror_damage"] integerValue];
        self.combatRating = [properties[@"combat_rating"] integerValue];
        self.combatDamage = [properties[@"combat_damage"] integerValue];
        
        self.isEndless = [properties[@"is_endless"] boolValue];
        self.canAmbush = [properties[@"can_ambush"] boolValue];
        self.isMaskMonster = [properties[@"is_mask"] boolValue];
        self.isUndead = [properties[@"is_undead"] boolValue];
        
        self.physicallyResistant = [properties[@"physically_resistant"] boolValue];
        self.magicallyResistant = [properties[@"magically_resistant"] boolValue];
        self.physicallyImmune = [properties[@"physically_immune"] boolValue];
        self.magicallyImmune = [properties[@"magically_immune"] boolValue];
        
        self.nightmarishRating = [properties[@"nightmarish"] integerValue];
        self.overwhelmingRating = [properties[@"overwhelming"] integerValue];
        
        
        NSString *movementString = properties[@"movement"];
        if ([movementString isEqualToString:@"Flying"]){
            self.movementType = MonsterMovementTypeFlying;
        }
        else if ([movementString isEqualToString:@"Fast"]){
            self.movementType = MonsterMovementTypeFast;
        }
        else if ([movementString isEqualToString:@"Stationary"]){
            self.movementType = MonsterMovementTypeStationary;
        }
        else if ([movementString isEqualToString:@"Unique"]){
            self.movementType = MonsterMovementTypeUnique;
        }
        else {
            self.movementType = MonsterMovementTypeNormal;
        }
        
        NSString *dimensionString = properties[@"dimension"];
        if ([dimensionString isEqualToString:@"Triangle"]){
            self.dimension = [Dimension type:MonsterDimensionSymbolTriangle];
        }
        else if ([dimensionString isEqualToString:@"Square"]){
            self.dimension = [Dimension type:MonsterDimensionSymbolSquare];
        }
        else if ([dimensionString isEqualToString:@"Diamond"]){
            self.dimension = [Dimension type:MonsterDimensionSymbolDiamond];
        }
        else if ([dimensionString isEqualToString:@"Hexagon"]){
            self.dimension = [Dimension type:MonsterDimensionSymbolHexagon];
        }
        else if ([dimensionString isEqualToString:@"Slash"]){
            self.dimension = [Dimension type:MonsterDimensionSymbolSlash];
        }
        else if ([dimensionString isEqualToString:@"Plus"]){
            self.dimension = [Dimension type:MonsterDimensionSymbolPlus];
        }
        else if ([dimensionString isEqualToString:@"Star"]){
            self.dimension = [Dimension type:MonsterDimensionSymbolStar];
        }
        else if ([dimensionString isEqualToString:@"Crescent"]){
            self.dimension = [Dimension type:MonsterDimensionSymbolCrescent];
        }
        else {
            self.dimension = [Dimension type:MonsterDimensionSymbolCircle];
        }
    }
    return self;
}
-(void)move {
    if (self.movementType == MonsterMovementTypeNormal){
        [self moveNormally];
    }
    else if (self.movementType == MonsterMovementTypeFlying){
        [self moveFlying];
    }
    else if (self.movementType == MonsterMovementTypeFast){
        // move normally twice
        [self move];
        [self move];
    }
    else if (self.movementType == MonsterMovementTypeUnique) {
        [self moveUnique];
    }
    else if (self.movementType == MonsterMovementTypeStationary){
        
    }
}
-(void)moveNormally {
    if (self.currentLocation.investigatorsHere.count > 0){
        // stay put
        return;
    }
    else if (!self.currentLocation.isStreet){
        self.currentLocation = self.currentNeighborhood.street;
    }
    else {
        for (Dimension *dimension in [Game currentGame].currentMythosWhiteDimensions) {
            if ([dimension equalsDimension:self.dimension]) {
                self.currentLocation = self.currentNeighborhood.whiteStreetConnection.street;
                return;
            }
        }
        for (Dimension *dimension in [Game currentGame].currentMythosBlackDimensions) {
            if ([dimension equalsDimension:self.dimension]) {
                self.currentLocation = self.currentNeighborhood.blackStreetConnection.street;
                return;
            }
        }
    }
}
-(void)moveFlying {
    if (self.isInSky){
        Location *dest = [self selectNearestLocationForFlyers];
        if (dest){ // swoop!
            [[Game currentGame].sky removeObject:self];
            self.isInSky = NO;
            self.currentLocation = dest;
        }
        else {
            // no one to attack, stay in the sky
            return;
        }
    }
    else {
        if (self.currentLocation.investigatorsHere.count > 0){
            // stay put
            return;
        }
        // at a location, if theres someone in the st, move there
        else if (!self.currentLocation.isStreet && self.currentNeighborhood.street.investigatorsHere.count > 0){
            self.currentLocation = self.currentNeighborhood.street;
        }
        else if (self.currentLocation.isStreet){
            Location *dest = [self selectNearestLocationForFlyers];
            if (dest){
                self.currentLocation = dest;
            }
            else {
                // to the sky!
                self.isInSky = YES;
                self.currentLocation = nil;
                [[Game currentGame].sky addObject:self];
            }
        }
    }
}

-(Location*)selectNearestLocationForFlyers {
    NSMutableArray *dests = [NSMutableArray new];
    
    if (self.currentNeighborhood.whiteStreetConnection.street.investigatorsHere.count > 0){
        [dests addObject:self.currentNeighborhood.whiteStreetConnection.street];
    };
    if (self.currentNeighborhood.blackStreetConnection.street.investigatorsHere.count > 0){
        [dests addObject:self.currentNeighborhood.whiteStreetConnection.street];
    };
    if (self.currentNeighborhood.colorlessStreetConnection.street.investigatorsHere.count > 0){
        [dests addObject:self.currentNeighborhood.whiteStreetConnection.street];
    };
    if ([self.currentNeighborhood respondsToSelector:@selector(secondaryColorlessStreetConnection)]){
        if ([(MerchantDistrictNeighborhood*)self.currentNeighborhood secondaryColorlessStreetConnection].street.investigatorsHere.count > 0){
            [dests addObject:[(MerchantDistrictNeighborhood*)self.currentNeighborhood secondaryColorlessStreetConnection].street];
        }
    }
    
    if (dests.count > 1){
        Location *target = dests[0];
        Location *tieLocation = nil;
        NSInteger minSneak = [(Investigator*)[(Location*)dests[0] investigatorsHere][0] sneak];
        BOOL hasTie = NO;
        for (Location *loc in dests){
            for (Investigator *player in loc.investigatorsHere){
                if (player.sneak < minSneak){
                    hasTie = NO;
                    minSneak = player.sneak;
                    target = player.currentLocation;
                    tieLocation = nil;
                }
                else if (player.sneak == minSneak){
                    hasTie = YES;
                    tieLocation = player.currentLocation;
                }
            }
        }
        
        if (tieLocation){
            // ask first player which person to go to
            return nil;
        }
        else {
            return target;
        }
    }
    else {
        return nil;
    }
}
-(void)moveUnique {
    // pass, implement in subclasses
}
-(void)dealHorrorDamage:(Investigator*)investigator {
    investigator.sanity-=self.horrorDamage;
}

-(void)dealEvadeFailDamage:(Investigator *)investigator {
    investigator.stamina-=self.combatDamage;
}

-(void)dealCombatDamage:(Investigator*)investigator {
    investigator.stamina-=self.combatDamage;
}
@end

@implementation ChthonianMonster
-(void)moveUnique {
    // roll die, on 4-6, all players lose 1 STA
    if ([Die d6] >= 4){
        for (Investigator *player in [Game currentGame].investigators){
            player.stamina--;
            if (player.stamina == 0){
                // KO'ed!
            }
        }
    }
}
@end

@implementation DimensionalShamblerMonster

// on combat check fail, investigator is lost in time and space
-(void)dealCombatDamage:(Investigator*)investigator {
    investigator.isLostInTimeAndSpace = YES;
}
@end

@implementation ElderThingMonster
-(void)dealEvadeFailDamage:(Investigator *)investigator {
    investigator.stamina-=self.combatDamage;
    // lose weapon or spell of choice
}
-(void)dealCombatDamage:(Investigator *)investigator {
    investigator.stamina-=self.combatDamage;
    // lose weapon or spell of choice
}
@end

@implementation HaunterOfTheDarkMonster
// if BlackestNightMythos is in play, this monster's combat rating is -5
@end

@implementation HoundOfTindalosMonster
-(void)moveUnique {
    Location *dest = [self selectNearestLocationForHound];
    self.currentLocation = dest;
    
}
-(Location*)selectNearestLocationForHound {
    
    NSLog(@"the hound of tindalos is tracking it's prey...");
    NSMutableArray *shortestPaths = [NSMutableArray new];
    for (Investigator *investigator in [Game currentGame].investigators) { //TODO handle investigators who are lost in time and space / other world
        NSLog(@"path finding investigator %@",investigator.name);
        NSArray *route = [[Game currentGame] routeFrom:self.currentLocation to:investigator.currentLocation];
        if (shortestPaths.count == 0 || route.count == [(NSArray*)shortestPaths[0] count]) { // unset, or found a path tied for shortest
            [shortestPaths addObject:route];
        }
        else if (route.count < [(NSArray*)shortestPaths[0] count]){ // found a shorter path
            [shortestPaths removeAllObjects];
            [shortestPaths addObject:route];
        }
    }
    
    if (shortestPaths.count == 1){ // go to nearest investigator
        return [(NSArray*)shortestPaths[0] objectAtIndex:0];
    }
    else if (shortestPaths.count > 1){ // theres a tie, pick investigator with lowest sneak
        NSLog(@"got a tie amongst dist's");
        NSMutableArray *lowestSneaks = [NSMutableArray new];
        NSMutableArray *lowestSneaksLocs = [NSMutableArray new];
        
        for (NSArray *path in shortestPaths){
            NSLog(@"comparing paths");
            Location *playerLoc = [path lastObject];
            NSArray *playersHere = playerLoc.investigatorsHere;
            for (Investigator *player in playersHere){
                NSLog(@"checking sneak of %@",player.name);
                if (lowestSneaks.count == 0 || player.sneak == [(Investigator*)lowestSneaks[0] sneak]) { // unset, or found sneak tied for last
                    [lowestSneaks addObject:player];
                    [lowestSneaksLocs addObject:path[0]];
                }
                else if (player.sneak < [(Investigator*)lowestSneaks[0] sneak]){ // found a lesser sneak
                    [lowestSneaks removeAllObjects];
                    [lowestSneaksLocs removeAllObjects];
                    [lowestSneaks addObject:player];
                    [lowestSneaksLocs addObject:path[0]];
                }
            }
        }
        if (lowestSneaksLocs.count == 1){
            NSLog(@"got loc with lowest sneak");
            return [(NSArray*)lowestSneaksLocs[0] objectAtIndex:0];
        }
        else if (lowestSneaksLocs.count > 1){ // TODO if tie amongst lowest sneak, first player picks target
            NSLog(@"got many loc's with lowest sneak");
            return nil;
        }
        else {
            NSLog(@"Error:WTF, tied player dists returned 0 sneaks?"); // shouldn't ever happen
            return nil;
        }
    }
    else {
        NSLog(@"Error, hound found no-one to go to!"); // maybe everyone is lost in time and space / in other world at the same time
        return nil;
    }
}
@end

@implementation ManiacMonster
@end

@implementation MiGoMonster
@end

@implementation NightgauntMonster
@end

@implementation TheBlackManMonster
@end

@implementation TheBloatedWomanMonster
@end

@implementation TheDarkPharoahMonster
@end

@implementation WarlockMonster
@end
