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
    else if (!self.inInStreet){
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
    
}
-(void)moveUnique {
    // pass, implement in subclasses
}
@end

@implementation ChthonianMonster
-(void)move {
    // roll die, on 4-6, all players lose 1 STA
}
@end

@implementation DimensionalShamblerMonster
@end

@implementation ElderThingMonster
@end

@implementation HaunterOfTheDarkMonster
@end

@implementation HoundOfTindalosMonster
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
