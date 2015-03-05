//
//  Monster.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/26/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class Monster;

#import <Foundation/Foundation.h>
#import "Movable.h"
#import "Investigator.h"

typedef NS_ENUM(NSUInteger, MonsterMovementType){
    MonsterMovementTypeNormal = 0,
    MonsterMovementTypeStationary,
    MonsterMovementTypeFast,
    MonsterMovementTypeFlying,
    MonsterMovementTypeUnique
};

typedef NS_ENUM(NSUInteger, MonsterDimensionSymbol){
    MonsterDimensionSymbolCircle,
    MonsterDimensionSymbolCrescent,
    MonsterDimensionSymbolTriangle,
    MonsterDimensionSymbolHexagon,
    MonsterDimensionSymbolSquare,
    MonsterDimensionSymbolDiamond,
    MonsterDimensionSymbolStar,
    MonsterDimensionSymbolSlash,
    MonsterDimensionSymbolPlus,
};

@interface Dimension : NSObject
@property (nonatomic) MonsterDimensionSymbol value;
-(BOOL)equalsDimension:(Dimension*)other;
@end

@interface Monster : Movable
@property (strong, nonatomic) NSString *name;

@property (nonatomic) NSInteger toughness;
@property (nonatomic) NSInteger combatRating;
@property (nonatomic) NSInteger horrorRating;
@property (nonatomic) NSInteger combatDamage;
@property (nonatomic) NSInteger horrorDamage;

@property (nonatomic) MonsterMovementType movementType;
@property (nonatomic) Dimension *dimension;

@property (nonatomic) BOOL canAmbush;
@property (nonatomic) BOOL isEndless;
@property (nonatomic) BOOL isUndead;
@property (nonatomic) BOOL isMaskMonster;

@property (nonatomic) BOOL isInSky;

@property (nonatomic) BOOL physicallyResistant;
@property (nonatomic) BOOL magicallyResistant;
@property (nonatomic) BOOL physicallyImmune;
@property (nonatomic) BOOL magicallyImmune;

@property (nonatomic) NSInteger nightmarishRating;
@property (nonatomic) NSInteger overwhelmingRating;

-(id)initWithProperties:(NSDictionary*)properties;
-(void)dealHorrorDamage:(Investigator*)investigator;
-(void)dealCombatDamage:(Investigator*)investigator;
-(void)move;
@end

@interface ChthonianMonster : Monster
// instead of moving, roll a die, on 4-6, all investigators in Arkham (not other world) lose 1 STA
@end
@interface DimensionalShamblerMonster : Monster
// if you fail a combat check against this, you are lost in time and space
@end
@interface ElderThingMonster : Monster
// When you fail a Combat or Evade check, you must additionally discard 1 Weapon or Spell
@end
@interface HaunterOfTheDarkMonster : Monster
// if Blackest Night Environment Mythos is in play, it's combat rating is -5
@end
@interface HoundOfTindalosMonster : Monster
// move to nearest investigator in arkham, excepting plays in asylum or hospital. If tie, then tracks lowest Sneak.
// If tie, the first player chooses. If there no players on the same board as Hound, moves through the train station to the closest investigator.
@end
@interface ManiacMonster : Monster
// if terror >= 6, maniac's combat rating = -2, combat damage is 3, is Endless
@end
@interface MiGoMonster : Monster
// if pass combat check against mi-go, remove from game and draw 1 unique
@end
@interface NightgauntMonster : Monster
// if fail combat or evade check, go through nearest gate. if tie, choose among tied gates. if in other world, return to arkham (counts as explored).
// if no gates open, ignore
@end
@interface TheBlackManMonster : Monster
// before making horror check, make Luck(-1) check. if pass, +2 clues, else player is devoured. either way, return black man to cup
@end
@interface TheBloatedWomanMonster : Monster
// Before making Horror check, make Will(-2) check. if fail, automatically fail the Horror check and the Combat check
@end
@interface TheDarkPharoahMonster : Monster
// use lore instead of fight in combat checks
@end
@interface WarlockMonster : Monster
// if you pass a combat check, gain 2 clue tokens and remove warlock from game
@end

/*
 
 MONSTER TROPHIES
 -------------------------
    The value of a trophy is equal to the monsters toughness. You cannot "make change" in toughness; any uneven amount over what is spent is lost. If an
    Environment card currently in play increases a particular monster's toughness, it also affects its value when being spent as a monster trophy. Spent
    trophies are returned to the monster cup.
 
 
 MONSTER ABILITIES
----------------------
Ambush: Once combat has begun, investigator may no longer flee, you must fight until one is defeated
Endless: cannot be collected as a monster trophy. each time it is defeated, return it to the cup.
Physical/Magical Resistance: A Weapon or Spell that adds a bonus of the resisted type can only provide half its normal bonus (rounded up).
Physical/Magical Immunity: A Weapon or Spell that adds a bonus of the resisted type provides none of its normal bonus.
Nightmarish X: Any investigator that passes Horror check when facing this monster still loses X Sanity. doesn’t apply if the investigator fails Horror check.
Overwhelming X: Any investigator that defeats this monster in combat still loses X Stamina. doesn’t apply if the investigator fails combat check.
 
 
 MONSTER MOVEMENT
 ---------------------
 Normal (Black): move normally
 Stationary (Yellow): Stationary monsters do not move unless directed by encounter or item
 Fast (Red): move twice; stop moving if encounter an investigator
 Unique (Green): unique movement patterns
 Flying (Blue): move directly towards nearest player in street, or move to the Sky if can't reach any players. if already in Sky then may attack player in street
 
 
 MONSTERS
 Name                       Movement    Toughness   Dimension   Count   Mask Monster
 ---------------------------------------------------------------------------------
 Byakhee                    Flying      1           Circle 		3
 Chthonian                  Unique      3           Triangle	2
 Cultist                    Normal      1           Crescent 	6
 Dark Young                 Stationary	3           Hexagon 	3
 Dhole                      Normal      3	        Circle 		1
 Dimensional Shambler       Fast        1	        Square 		2
 Elder Thing                Normal      2	        Diamond 	2
 Fire Vampire               Flying      1	        Star        2
 Flying Polyp               Flying      3	        Hexagon 	1
 Formless Spawn             Normal      2	        Hexagon 	2
 Ghost                      Stationary	1	        Crescent 	3
 Ghoul                      Normal      1	        Hexagon 	3
 God of the Bloody Tongue	Normal      4	        Triangle 	1       Mask
 Gug                        Normal      3	        Slash 		2
 Haunter of the Dark        Flying      2	        Square      1       Mask
 High Priest                Normal      2	        Plus 		1
 Hound of Tindalos          Unique      2	        Square 		2
 Maniac                     Normal      1	        Crescent 	3
 Mi-Go                      Flying      1	        Circle 		3
 Nightgaunt                 Flying      2	        Slash       2
 Shoggoth                   Fast        3	        Diamond 	2
 Star Spawn                 Normal      3	        Plus 		2
 The Black Man              Normal      1	        Crescent 	1       Mask
 The Bloated Woman          Normal      2	        Hexagon     1       Mask
 The Dark Pharoah           Normal      2	        Slash  		1       Mask
 Vampire                    Normal      1	        Crescent 	1
 Warlock                    Stationary	2	        Circle 		2
 Witch                      Normal      1	        Circle 		2
 Zombie                     Normal      1	        Crescent 	3
 
 
 Awareness == sneak modifier of evade check
 base difficulty of Evade check is +1
 
 MONSTER STATS
 Name                       Awareness   Horror Rating/Damage    Combat Rating/Damage
 -----------------------------------------------------------------------------------
 Byakhee                    -2          -1/1                    +0/2
 Chthonian                  +1          -2/2                    -3/3
 Cultist                    -3          +0/0                    +1/1
 Dark Young                 -2          +0/3                    -1/3
 Dhole                      -1          -1/4                    -3/4
 Dimensional Shambler       -3          -2/1                    -2/0
 Elder Thing                -2          -3/2                    +0/1
 Fire Vampire               +0          +0/0                    -2/2
 Flying Polyp               +0          -2/4                    -3/3
 Formless Spawn             +0          -1/2                    -2/2
 Ghost                      -3          -2/2                    -3/2
 Ghoul                      -3          +0/1                    -1/1
 God of the Bloody Tongue   +1          -3/3                    -4/4
 Gug                        -2          -1/2                    -2/4
 Haunter of the Dark        -3          -2/2                    -2/2
 High Priest                -2          +1/1                    -2/2
 Hound of Tindalos          -1          -2/4                    -1/3
 Maniac                     -1          +0/0                    +1/1
 Mi-Go                      -2          -1/2                    +0/1
 Nightgaunt                 -2          -1/1                    -2/0
 Shoggoth                   -1          -1/3                    -1/3
 Star Spawn                 -1          -3/2                    -3/3
 The Black Man              -3          +0/0                    +0/0
 The Bloated Woman          -1          -1/2                    -2/2
 The Dark Pharoah           -1          -1/1                    -3/3
 Vampire                    -3          +0/2                    -3/3
 Warlock                    -2          -1/1                    -3/1
 Witch                      -1          +0/0                    -3/2
 Zombie                     +1          -1/1                    -1/2
 
 
 MONSTER ABILITIES
 Name                       P.Resist    M.Resist    Ambush  Endless Nightmarish Overwhelming
 -------------------------------------------------------------------------------------------
 Byakhee                    No          No          No      No      0           0
 Chthonian                  No          No          No      No      0           0
 Cultist                    No          No          No      No      0           0
 Dark Young                 Resist      No          No      No      1           0
 Dhole                      Resist      Resist      No      No      1           1
 Dimensional Shambler       No          No          No      No      0           0
 Elder Thing                No          No          No      No      0           0
 Fire Vampire               Immune      No          Yes     No      0           0
 Flying Polyp               Resist      No          No      No      1           1
 Formless Spawn             Immune      No          No      No      0           0
 Ghost                      Immune      No          No      No      0           0
 Ghoul                      No          No          Yes     No      0           0
 God of the Bloody Tongue   No          No          No      Yes     1           1
 Gug                        No          No          No      No      0           1
 Haunter of the Dark        No          No          No      Yes     0           0
 High Priest                No          Immune      No      No      0           0
 Hound of Tindalos          Immune      No          No      No      0           0
 Maniac                     No          No          No      No      0           0
 Mi-Go                      No          No          No      No      0           0
 Nightgaunt                 No          No          No      No      0           0
 Shoggoth                   Resist      No          No      No      1           0
 Star Spawn                 No          No          No      No      0           0
 The Black Man              No          No          No      Yes     0           0
 The Bloated Woman          No          No          No      Yes     0           0
 The Dark Pharoah           No          No          No      Yes     0           0
 Vampire                    Resist      No          No      No      0           0
 Warlock                    No          Immune      No      No      0           0
 Witch                      No          No          No      No      0           0
 Zombie                     No          No          No      No      0           0
 
 
 
 MONSTER UNIQUE RULES
 ----------------------
 Chthonian - instead of moving, roll a die, on 4-6, all investigators in Arkham (not other world) lose 1 STA
 Dimensional Shambler - if you fail a combat check against this, you are lost in time and space
 Elder Thing - When you fail a Combat or Evade check, you must additionally discard 1 Weapon or Spell
 Ghost - Undead
 Haunter of the Dark - if Blackest Night Environment Mythos is in play, it's combat rating is -5
 Hound of Tindalos - hound moves to nearest investigator in arkham, excepting plays in asylum or hospital. If tie, then tracks lowest Sneak. 
        If tie, the first player chooses. If there no players on the same board as Hound, moves through the train station to the closest investigator.
 Maniac - if terror >= 6, maniac's combat rating = -2, combat damage is 3, is Endless
 Mi-Go - if pass combat check against mi-go, remove from game and draw 1 unique
 Nightgaunt - if fail combat or evade check, go through nearest gate. if tie, choose among tied gates. if in other world, return to arkham (counts as explored).
        if no gates open, ignore
 The Black Man - before making horror check, make Luck(-1) check. if pass, +2 clues, else player is devoured. either way, return black man to cup.
 The Bloated Woman - Before making Horror check, make Will(-2) check. if fail, automatically fail the Horror check and the Combat check.
 The Dark Pharoah - Use Lore instead of Fight in combat
 Vampire - Undead
 Warlock - if you pass a combat check, gain 2 clue tokens and remove warlock from game
 Zombie - undead
*/

