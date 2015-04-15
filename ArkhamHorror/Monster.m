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

@implementation Monster

#pragma mark - init

-(id)init {
    self = [super init];
    if (self){
        self.name = @"Monster Prototype";
        self.toughness = 1;
        self.awareness = 0;
        self.movementType = MonsterMovementTypeNormal;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolCircle];
    }
    return self;
}

#pragma mark - movement

-(void)move {
    if (self.movementType == MonsterMovementTypeNormal){
        [self moveNormally];
    }
    else if (self.movementType == MonsterMovementTypeFlying){
        [self moveFlying];
    }
    else if (self.movementType == MonsterMovementTypeFast){
        // move normally twice
        [self moveNormally];
        [self moveNormally];
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
            if ([dimension isEqual:self.dimension]) {
                self.currentLocation = [[Game currentGame] locationNamed:self.currentNeighborhood.whiteStreetConnection];
                return;
            }
        }
        for (Dimension *dimension in [Game currentGame].currentMythosBlackDimensions) {
            if ([dimension isEqual:self.dimension]) {
                self.currentLocation = [[Game currentGame] locationNamed:self.currentNeighborhood.blackStreetConnection];
                return;
            }
        }
    }
}

-(void)moveFlying {
    if ([[Game currentGame].sky containsObject:self]){ // is in sky
        Location *dest = [self selectNearestLocationForFlyers];
        if (dest){ // swoop!
            [[Game currentGame].sky removeObject:self];
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
                self.currentLocation = nil;
                [[Game currentGame].sky addObject:self];
            }
        }
    }
}

-(Location*)selectNearestLocationForFlyers {
    NSMutableArray *dests = [NSMutableArray new];
    
    Location *whiteStreet = [[Game currentGame] locationNamed:self.currentNeighborhood.whiteStreetConnection];
    Location *blackStreet = [[Game currentGame] locationNamed:self.currentNeighborhood.blackStreetConnection];
    Location *colorlessStreet = [[Game currentGame] locationNamed:self.currentNeighborhood.colorlessStreetConnection];
    Location *secondaryColorlessStreet = [[Game currentGame] locationNamed:self.currentNeighborhood.secondaryColorlessStreetConnection];

    if (whiteStreet && whiteStreet.investigatorsHere.count > 0){
        [dests addObject:whiteStreet];
    };
    if (blackStreet && blackStreet.investigatorsHere.count > 0){
        [dests addObject:blackStreet];
    };
    if (colorlessStreet && colorlessStreet.investigatorsHere.count > 0){
        [dests addObject:colorlessStreet];
    };
    if (secondaryColorlessStreet && secondaryColorlessStreet.investigatorsHere.count > 0){
        [dests addObject:secondaryColorlessStreet];
    }
    
    NSInteger lowestSneakSoFar = INT32_MAX;
    NSMutableArray *lowestSneaksLocs = [NSMutableArray new];
    for (Location *playerLoc in dests){
        NSInteger lowestSneakHere = [playerLoc lowestSneakHere];
        
        if (lowestSneakHere < lowestSneakSoFar){
            [lowestSneaksLocs removeAllObjects];
        }
        if (lowestSneakHere <= lowestSneakSoFar){
            [lowestSneaksLocs addObject:playerLoc];
            lowestSneakSoFar = lowestSneakHere;
        }
    }
    
    if (lowestSneaksLocs.count == 1){
        NSLog(@"got loc with lowest sneak");
        return lowestSneaksLocs[0];
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

#pragma mark - Logging

-(NSString*)description {
    return [NSString stringWithFormat:@"%@:%@",[super description],self.name];
}
@end

#pragma mark - unique monsters

@implementation ChthonianMonster
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"Chthonian";
        self.movementType = MonsterMovementTypeUnique;
        self.toughness = 3;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolTriangle];
        self.awareness = 1;
        self.horrorRating = -2;
        self.horrorDamage = 2;
        self.combatRating = -3;
        self.combatDamage = 3;
    }
    return self;
}
-(void)moveUnique {
    // roll die, on 4-6, all players lose 1 STA
    if (arc4random_uniform(6) + 1 >= 4){
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
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"Dimensional Shambler";
        self.movementType = MonsterMovementTypeFast;
        self.toughness = 1;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolSquare];
        self.awareness = -3;
        self.horrorRating = -2;
        self.horrorDamage = 1;
        self.combatRating = -2;
        self.combatDamage = 0;
    }
    return self;
}

// on combat check fail, investigator is lost in time and space
-(void)dealCombatDamage:(Investigator*)investigator {
    investigator.isLostInTimeAndSpace = YES;
}
@end

@implementation ElderThingMonster
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"Elder Thing";
        self.movementType = MonsterMovementTypeNormal;
        self.toughness = 2;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolDiamond];
        self.awareness = -2;
        self.horrorRating = -3;
        self.horrorDamage = 2;
        self.combatRating = 0;
        self.combatDamage = 1;
    }
    return self;
}
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
// if Blackest Night Mythos is in play, this monster's combat rating is -5

-(id)init {
    self = [super init];
    if (self) {
        self.name = @"Haunter of the Dark";
        self.movementType = MonsterMovementTypeFlying;
        self.toughness = 2;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolSquare];
        self.awareness = -3;
        self.horrorRating = -2;
        self.horrorDamage = 2;
        self.combatRating = -2;
        self.combatDamage = 2;
    }
    return self;
}
@end

@implementation HoundOfTindalosMonster
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"Hound of Tindalos";
        self.movementType = MonsterMovementTypeUnique;
        self.toughness = 2;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolSquare];
        self.awareness = -1;
        self.horrorRating = -2;
        self.horrorDamage = 4;
        self.combatRating = -1;
        self.combatDamage = 3;
    }
    return self;
}
-(void)moveUnique {
    Location *dest = [self selectNearestLocationForHound];
    self.currentLocation = dest;
}
-(Location*)selectNearestLocationForHound {
    // TODO if all investigators are in expansion game area (Dunwich, etc), Hound goes in shortest path to train station
    
    NSLog(@"the hound of tindalos is tracking it's prey...");
    NSMutableArray *shortestPathDests = [NSMutableArray new];
    NSMutableDictionary *pathFirstSteps = [NSMutableDictionary new];
    NSInteger shortestPath = INT32_MAX;
    
    for (Investigator *investigator in [Game currentGame].investigators) { //TODO handle investigators who are lost in time and space / other world
        NSLog(@"path finding investigator %@",investigator.name);
        NSArray *route = [[Game currentGame] routeFrom:self.currentLocation to:investigator.currentLocation];
        Location *start = [route firstObject];
        Location *end = [route lastObject];
        if (route.count < shortestPath){
            [shortestPathDests removeAllObjects];
            [pathFirstSteps removeAllObjects];
        }
        if (route.count <= shortestPath){
            [shortestPathDests addObject:end];
            pathFirstSteps[end.name] = start;
            shortestPath = route.count;
        }
    }
    
    if (shortestPathDests.count == 1){ // go to nearest investigator
        Location *end = shortestPathDests[0];
        return pathFirstSteps[end.name];
    }
    else if (shortestPathDests.count > 1){ // theres a tie, pick investigator with lowest sneak
        NSLog(@"got a tie amongst dist's");
        NSInteger lowestSneakSoFar = INT32_MAX;
        NSMutableArray *lowestSneaksLocs = [NSMutableArray new];
        for (Location *playerLoc in shortestPathDests){
            NSInteger lowestSneakHere = [playerLoc lowestSneakHere];
            
            if (lowestSneakHere < lowestSneakSoFar){
                [lowestSneaksLocs removeAllObjects];
            }
            if (lowestSneakHere <= lowestSneakSoFar){
                [lowestSneaksLocs addObject:playerLoc];
                lowestSneakSoFar = lowestSneakHere;
            }
        }
        
        if (lowestSneaksLocs.count == 1){
            Location *end = lowestSneaksLocs[0];
            return pathFirstSteps[end.name];
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
// Maniac - if terror >= 6, maniac's combat rating = -2, combat damage is 3, is Endless
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"Maniac";
        self.movementType = MonsterMovementTypeNormal;
        self.toughness = 1;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolCrescent];
        self.awareness = -1;
        self.horrorRating = 0;
        self.horrorDamage = 0;
        self.combatRating = -1;
        self.combatDamage = 1;
    }
    return self;
}

@end

@implementation MiGoMonster
// Mi-Go - if pass combat check against mi-go, remove from game and draw 1 unique
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"Mi-Go";
        self.movementType = MonsterMovementTypeFlying;
        self.toughness = 1;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolCircle];
        self.awareness = -2;
        self.horrorRating = -1;
        self.horrorDamage = 2;
        self.combatRating = 0;
        self.combatDamage = 1;
    }
    return self;
}

@end

@implementation NightgauntMonster
// if fail combat or evade check, go through nearest gate. if tie, choose among tied gates. if in other world, return to arkham (counts as explored).
// if no gates open, combat ends with no other effects

-(id)init {
    self = [super init];
    if (self) {
        self.name = @"Nightgaunt";
        self.movementType = MonsterMovementTypeFlying;
        self.toughness = 2;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolSlash];
        self.awareness = -2;
        self.horrorRating = -1;
        self.horrorDamage = 1;
        self.combatRating = -2;
        self.combatDamage = 0;
    }
    return self;
}

-(void)dealEvadeFailDamage:(Investigator *)investigator {
    // investigator goes through nearest gate
}
-(void)dealCombatDamage:(Investigator *)investigator {
    [self dealEvadeFailDamage:investigator]; // same as evade fail
}
@end

@implementation TheBlackManMonster
// before making horror check, make Luck(-1) check. if pass, +2 clues, else player is devoured. either way, return black man to cup.
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"The Black Man";
        self.movementType = MonsterMovementTypeNormal;
        self.toughness = 1;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolCrescent];
        self.awareness = -3;
        self.horrorRating = 0;
        self.horrorDamage = 0;
        self.combatRating = 0;
        self.combatDamage = 0;
    }
    return self;
}
@end

@implementation TheBloatedWomanMonster
// Before making Horror check, make Will(-2) check. if fail, automatically fail the Horror check and the Combat check.
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"The Bloated Woman";
        self.movementType = MonsterMovementTypeNormal;
        self.toughness = 2;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolHexagon];
        self.awareness = -1;
        self.horrorRating = -1;
        self.horrorDamage = 2;
        self.combatRating = -2;
        self.combatDamage = 2;
    }
    return self;
}
@end

@implementation TheDarkPharoahMonster
// Use Lore instead of Fight in combat
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"The Dark Pharoah";
        self.movementType = MonsterMovementTypeNormal;
        self.toughness = 2;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolSlash];
        self.awareness = -1;
        self.horrorRating = -1;
        self.horrorDamage = 1;
        self.combatRating = -3;
        self.combatDamage = 3;
    }
    return self;
}
@end

@implementation WarlockMonster
// if you pass a combat check, gain 2 clue tokens and remove warlock from game
-(id)init {
    self = [super init];
    if (self) {
        self.name = @"Warlock";
        self.movementType = MonsterMovementTypeStationary;
        self.toughness = 2;
        self.dimension = [Dimension ofType:MonsterDimensionSymbolCircle];
        self.awareness = -2;
        self.horrorRating = -1;
        self.horrorDamage = 1;
        self.combatRating = -3;
        self.combatDamage = 1;
    }
    return self;
}
@end
