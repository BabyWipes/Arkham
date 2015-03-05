//
//  Monster.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/26/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Monster.h"

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



    }
    return self;
}
@end

@implementation ChthonianMonster
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
