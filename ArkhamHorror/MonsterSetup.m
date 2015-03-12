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
    
    /*
     
     MONSTERS
     Name                       Movement    Toughness   Dimension   Count   Mask Monster
     ---------------------------------------------------------------------------------
     Dhole                      Normal      3	        Circle 		1
     Fire Vampire               Flying      1	        Star        2
     Flying Polyp               Flying      3	        Hexagon 	1
     Formless Spawn             Normal      2	        Hexagon 	2
     Ghost                      Stationary	1	        Crescent 	3
     Ghoul                      Normal      1	        Hexagon 	3
     Gug                        Normal      3	        Slash 		2
     High Priest                Normal      2	        Plus 		1
     Shoggoth                   Fast        3	        Diamond 	2
     Star Spawn                 Normal      3	        Plus 		2
     Vampire                    Normal      1	        Crescent 	1
     Witch                      Normal      1	        Circle 		2
     Zombie                     Normal      1	        Crescent 	3
     
     
     Name                       Awareness   Horror Rating/Damage    Combat Rating/Damage
     -----------------------------------------------------------------------------------
     Dhole                      -1          -1/4                    -3/4
     Fire Vampire               +0          +0/0                    -2/2
     Flying Polyp               +0          -2/4                    -3/3
     Formless Spawn             +0          -1/2                    -2/2
     Ghost                      -3          -2/2                    -3/2
     Ghoul                      -3          +0/1                    -1/1
     Gug                        -2          -1/2                    -2/4
     High Priest                -2          +1/1                    -2/2
     Shoggoth                   -1          -1/3                    -1/3
     Star Spawn                 -1          -3/2                    -3/3
     Vampire                    -3          +0/2                    -3/3
     Witch                      -1          +0/0                    -3/2
     Zombie                     +1          -1/1                    -1/2
     
     
     Name                       P.Resist    M.Resist    Ambush  Endless Nightmarish Overwhelming
     -------------------------------------------------------------------------------------------
     Dhole                      Resist      Resist      No      No      1           1
     Fire Vampire               Immune      No          Yes     No      0           0
     Flying Polyp               Resist      No          No      No      1           1
     Formless Spawn             Immune      No          No      No      0           0
     Ghost                      Immune      No          No      No      0           0
     Ghoul                      No          No          Yes     No      0           0
     Gug                        No          No          No      No      0           1
     High Priest                No          Immune      No      No      0           0
     Shoggoth                   Resist      No          No      No      1           0
     Star Spawn                 No          No          No      No      0           0
     Vampire                    Resist      No          No      No      0           0
     Witch                      No          No          No      No      0           0
     Zombie                     No          No          No      No      0           0
     
     
     
     MONSTER UNIQUE RULES
     ----------------------
     Ghost - undead
     Vampie - undead
     Zombie - undead
     
     */
    
    NSMutableArray *arkhamHorrorMonsters = [NSMutableArray new];
    Monster *monster;
    
#pragma mark - unique monsters
    monster = [[ChthonianMonster alloc] init];
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
    monster = [[DimensionalShamblerMonster alloc] init];
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
    monster = [[ElderThingMonster alloc] init];
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
    monster = [[HoundOfTindalosMonster alloc] init];
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
    monster = [[ManiacMonster alloc] init];
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
    monster = [[MiGoMonster alloc] init];
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
    monster = [[NightgauntMonster alloc] init];
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
    monster = [[WarlockMonster alloc] init];
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
#pragma mark - monsters
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
    
    monster = [[Monster alloc] init];
    monster.name = @"Cultist";
    monster.movementType = MonsterMovementTypeNormal;
    monster.dimension = [Dimension ofType:MonsterDimensionSymbolCrescent];
    monster.toughness = 1;
    monster.awareness = -3;
    monster.horrorRating = 0;
    monster.horrorDamage = 0;
    monster.combatRating = 1; // positive combat rating
    monster.combatDamage = 1;
    [arkhamHorrorMonsters addObject:monster];
    [arkhamHorrorMonsters addObject:[monster copy]];
    [arkhamHorrorMonsters addObject:[monster copy]];
    [arkhamHorrorMonsters addObject:[monster copy]];
    [arkhamHorrorMonsters addObject:[monster copy]];
    [arkhamHorrorMonsters addObject:[monster copy]];
    
    monster = [[Monster alloc] init];
    monster.name = @"Dark Young";
    monster.movementType = MonsterMovementTypeStationary;
    monster.dimension = [Dimension ofType:MonsterDimensionSymbolHexagon];
    monster.toughness = 3;
    monster.awareness = -2;
    monster.horrorRating = 0;
    monster.horrorDamage = 3;
    monster.combatRating = -1;
    monster.combatDamage = 3;
    monster.nightmarishRating = 1;
    monster.physicalResistance = MonsterDamageImmunityResist;
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
