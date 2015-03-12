//
//  MonsterSetup.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/12/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "MonsterSetup.h"
#import "Monster.h"

@implementation MonsterSetup
+(NSMutableArray*)arkhamHorrorMonsters {
    NSMutableArray *arkhamHorrorMonsters = [NSMutableArray new];
    Monster *monster;
    
    monster = [[Monster alloc] init];
    monster.name = @"Byakhee";
    monster.movementType = MonsterMovementTypeFlying;
    monster.dimension = [Dimension ofType:MonsterDimensionSymbolCircle];
    monster.toughness = 1;
    monster.awareness = -2;
    monster.horrorRating = -1;
    monster.horrorDamage = 1;
    monster.combatRating = 0;
    monster.combatDamage = 2;
    
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
    return arkhamHorrorMonsters;
}
+(NSArray*)arkhamHorrorMaskMonsters {
    Monster *godOfTheBloodyTounge = [[Monster alloc] init];
    godOfTheBloodyTounge.name = @"God of the Bloody Tounge";
    godOfTheBloodyTounge.movementType = MonsterMovementTypeNormal;
    godOfTheBloodyTounge.dimension = [Dimension ofType:MonsterDimensionSymbolTriangle];
    godOfTheBloodyTounge.toughness = 4;
    godOfTheBloodyTounge.awareness = 1;
    godOfTheBloodyTounge.horrorRating = -3;
    godOfTheBloodyTounge.horrorDamage = 3;
    godOfTheBloodyTounge.combatRating = -4;
    godOfTheBloodyTounge.combatDamage = 4;
    godOfTheBloodyTounge.isEndless = YES;
    godOfTheBloodyTounge.nightmarishRating = 1;
    godOfTheBloodyTounge.overwhelmingRating = 1;
    
    HaunterOfTheDarkMonster *haunterOfTheDark = [[HaunterOfTheDarkMonster alloc] init];
    TheBlackManMonster *theBlackMan = [[TheBlackManMonster alloc] init];
    TheBloatedWomanMonster *theBloatedWoman = [[TheBloatedWomanMonster alloc] init];
    TheDarkPharoahMonster *theDarkPharoh = [[TheDarkPharoahMonster alloc] init];
    return @[godOfTheBloodyTounge,haunterOfTheDark,theBlackMan,theBloatedWoman,theDarkPharoh];
}
@end
