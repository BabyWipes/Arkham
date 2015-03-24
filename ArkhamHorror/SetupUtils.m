//
//  SetupUtils.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "SetupUtils.h"
#import "Item.h"
#import "Skill.h"
#import "Monster.h"
#import "Ally.h"

@implementation SetupUtils



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

+(NSMutableArray*)arkhamHorrorAllies {
    NSMutableArray *allies = [NSMutableArray new];
    
    Ally *ally;
    
    ally = [[Ally alloc] init];
    ally.name = @"Anna Kaslow";
    ally.skillAffected = SkillCheckTypeLuck;
    ally.skillBonus = 2;
    ally.givesClueReward = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"Duke";
    ally.maxSanityBonus = 1;
    ally.discardToHealSanity = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"Eric Colt";
    ally.skillAffected = SkillCheckTypeSpeed;
    ally.skillBonus = 2;
    ally.ignoresNightmarish = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"John Legrasse";
    ally.skillAffected = SkillCheckTypeWill;
    ally.skillBonus = 2;
    ally.ignoresEndless = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"Professor Armitage";
    ally.skillAffected = SkillCheckTypeLore;
    ally.skillBonus = 2;
    ally.ignoresMagicalResist = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"Richard Upton Pickman";
    ally.skillAffected = SkillCheckTypeLuck;
    ally.skillBonus = 1;
    ally.secondSkillAffected = SkillCheckTypeSpeed;
    ally.secondSkillBonus = 1;
    ally.ignoresPhysicalResist = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"Ruby Standish";
    ally.skillAffected = SkillCheckTypeSneak;
    ally.skillBonus = 2;
    ally.givesUniqueItemReward = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"Ryan Dean";
    ally.skillAffected = SkillCheckTypeWill;
    ally.skillBonus = 1;
    ally.secondSkillAffected = SkillCheckTypeSneak;
    ally.secondSkillBonus = 1;
    ally.givesCommonItemReward = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"Sir William Brinton";
    ally.maxStaminaBonus = 1;
    ally.discardToHealStamina = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"Eric Colt";
    ally.skillAffected = SkillCheckTypeFight;
    ally.skillBonus = 1;
    ally.secondSkillAffected = SkillCheckTypeLore;
    ally.secondSkillBonus = 1;
    ally.givesSpellReward = YES;
    [allies addObject:ally];
    
    ally = [[Ally alloc] init];
    ally.name = @"Tom \"Mountain\" Murphy";
    ally.skillAffected = SkillCheckTypeFight;
    ally.skillBonus = 2;
    ally.ignoresOverwhelming = YES;
    [allies addObject:ally];
    
    return allies;
}

+(NSMutableArray*)arkhamHorrorSkills {
    NSMutableArray *skills = [NSMutableArray new];
    
    /*
     Bravery            exhaust, re-roll horror check
     Expert Occultist   exhaust, re-roll spell check
     Marksman           exhaust, re-roll combat check
     Stealth            exhaust, re-roll evade check
     Fight              +1 fight, when you spend a clue to add fight, add an extra die
     Lore               +1 lore, when you spend a clue to add lore, add an extra die
     Luck               +1 luck, when you spend a clue to add luck, add an extra die
     Sneak              +1 sneak, when you spend a clue to add sneak, add an extra die
     Speed              +1 speed, when you spend a clue to add speed, add an extra die
     Will               +1 will, when you spend a clue to add will, add an extra die
     */
    
    Skill *skill;
    
    skill = [[Skill alloc] init];
    skill.name = @"Bravery";
    skill.skillAffected = SkillCheckTypeHorror;
    skill.allowsReroll = YES;
    [skills addObject:skill];
    
    skill = [[Skill alloc] init];
    skill.name = @"Expert Occultist";
    skill.skillAffected = SkillCheckTypeSpell;
    skill.allowsReroll = YES;
    [skills addObject:skill];
    
    skill = [[Skill alloc] init];
    skill.name = @"Marksman";
    skill.skillAffected = SkillCheckTypeCombat;
    skill.allowsReroll = YES;
    [skills addObject:skill];
    
    skill = [[Skill alloc] init];
    skill.name = @"Stealth";
    skill.skillAffected = SkillCheckTypeEvade;
    skill.allowsReroll = YES;
    [skills addObject:skill];
    
    skill = [[Skill alloc] init];
    skill.name = @"Speed";
    skill.skillAffected = SkillCheckTypeSpeed;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    
    skill = [[Skill alloc] init];
    skill.name = @"Sneak";
    skill.skillAffected = SkillCheckTypeSneak;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    
    skill = [[Skill alloc] init];
    skill.name = @"Fight";
    skill.skillAffected = SkillCheckTypeFight;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    
    skill = [[Skill alloc] init];
    skill.name = @"Will";
    skill.skillAffected = SkillCheckTypeWill;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    
    skill = [[Skill alloc] init];
    skill.name = @"Lore";
    skill.skillAffected = SkillCheckTypeLore;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    
    skill = [[Skill alloc] init];
    skill.name = @"Luck";
    skill.skillAffected = SkillCheckTypeLuck;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    
    return skills;
}

+(NSArray*)arkhamHorrorCommons {
    NSMutableArray *commons = [NSMutableArray new];
    Item *item;
    
    // WEAPONS
    // ------------------
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Knife";
    [(WeaponItem*)item setCombatBonus:1];
    item.price = 2;
    item.hands = 1;
    [commons addObject:item]; // count = 2
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Bullwhip"; //TODO exhaust to reroll 1 die after making a combat check
    [(WeaponItem*)item setCombatBonus:1];
    item.price = 2;
    item.hands = 1;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Cavalry Saber";
    [(WeaponItem*)item setCombatBonus:2];
    item.price = 3;
    item.hands = 1;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @".18 Derringer"; // cannot be lost or stolen unless you allow it
    [(WeaponItem*)item setCombatBonus:2];
    item.price = 3;
    item.hands = 1;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Axe"; // +3 combatBonus if your other hand is empty
    [(WeaponItem*)item setCombatBonus:2];
    item.price = 3;
    item.hands = 1;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @".38 Revolver";
    [(WeaponItem*)item setCombatBonus:3];
    item.price = 4;
    item.hands = 1;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationMagicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Cross"; // +3 combatBonus if Opponent is Undead, +1 Horror check
    [(WeaponItem*)item setCombatBonus:0];
    item.price = 3;
    item.hands = 1;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @".45 Automatic";
    [(WeaponItem*)item setCombatBonus:4];
    item.price = 5;
    item.hands = 1;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Shotgun"; // if in hands & during combat, rolled 6's count as two successes
    [(WeaponItem*)item setCombatBonus:4];
    item.price = 6;
    item.hands = 2;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Rifle";
    [(WeaponItem*)item setCombatBonus:5];
    item.price = 6;
    item.hands = 2;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Tommy Gun";
    [(WeaponItem*)item setCombatBonus:6];
    item.price = 7;
    item.hands = 2;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[WeaponItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationPhysicalWeapon;
    item.usesBeforeDiscard = 1;
    item.name = @"Dynamite";
    [(WeaponItem*)item setCombatBonus:8];
    item.price = 4;
    item.hands = 2;
    [commons addObject:item];
    [commons addObject:item];
    
    /*
     TOMES
     Item                   Type        Price   Hands   Count
     --------------------------------------------------------
     Ancient Tome           Tome         $4      0       2 // exhaust, -2 move: make Lore(-1) check. If pass, +1 Spell, discard
     Old Journal            Tome         $1      0       2 // exhaust, -1 move: make Lore(-1) check. If pass, +3 Clues, discard
     */
    item = [[TomeItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationTome;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Ancient Tome";
    item.price = 4;
    [(TomeItem*)item setSpellReward:1];
    [(TomeItem*)item setClueReward:0];
    [(TomeItem*)item setSkillReward:0];
    [(TomeItem*)item setMoveCost:-2];
    [(TomeItem*)item setSanityCost:0];
    [(TomeItem*)item setLoreDifficulty:-1];
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[TomeItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.itemClass = ItemClassificationTome;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Old Journal";
    item.price = 1;
    [(TomeItem*)item setSpellReward:0];
    [(TomeItem*)item setClueReward:3];
    [(TomeItem*)item setSkillReward:0];
    [(TomeItem*)item setMoveCost:-1];
    [(TomeItem*)item setSanityCost:0];
    [(TomeItem*)item setLoreDifficulty:-1];
    [commons addObject:item];
    [commons addObject:item];
    
    /*
     OTHER
     Item                   Type        Price   Hands   Count
     --------------------------------------------------------
     Food                                $1      0       2
     Whiskey                             $1      0       2
     Dark Cloak                          $2      0       2 // +1 evade checks
     Lantern                             $3      0       2 // +1 luck checks
     Lucky Cigarette Case                $1      0       2 // discard, reroll skill check
     Research Materials                  $1      0       2 // discard, avoid spending 1 clue token
     Map of Arkham                       $2      0       2 // exhaust, +1 move, cant use in other world
     Motorcycle                          $4      0       2 // exhaust, +2 move, cant use in other world
     */
    item = [[HealingItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.usesBeforeDiscard = 1;
    item.name = @"Food"; // discard, reduce stamina loss by 1
    item.price = 1;
    [(HealingItem*)item setStaminaGain:1];
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[HealingItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.usesBeforeDiscard = 1;
    item.name = @"Whiskey"; // discard, reduce sanity loss by 1
    [(HealingItem*)item setSanityGain:1];
    item.price = 1;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[SkillBonusItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Dark Cloak"; // +1 evade checks
    item.price = 2;
    [(SkillBonusItem*)item setSkillBonus:1];
    [(SkillBonusItem*)item setSkillType:SkillCheckTypeEvade];
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[SkillBonusItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Lantern"; // +1 luck checks
    item.price = 3;
    [(SkillBonusItem*)item setSkillBonus:1];
    [(SkillBonusItem*)item setSkillType:SkillCheckTypeLuck];
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[Item alloc] init];
    item.cardType = CardTypeCommonItem;
    item.usesBeforeDiscard = 1;
    item.name = @"Lucky Cigarette Case"; // discard, reroll skill check
    item.price = 1;
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[HealingItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.usesBeforeDiscard = 1;
    item.name = @"Research Materials"; // discard, avoid spending 1 clue token
    item.price = 1;
    [(HealingItem*)item setClueGain:1];
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[MovementItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Map Of Arkham"; // exhaust, +1 move, cant use in other world
    item.price = 2;
    [(MovementItem*)item setMovementBonus:1];
    [(MovementItem*)item setUsableInOtherWorld:NO];
    [commons addObject:item];
    [commons addObject:item];
    
    item = [[MovementItem alloc] init];
    item.cardType = CardTypeCommonItem;
    item.usesBeforeDiscard = kItemInfiniteUses;
    item.name = @"Motorcycle"; // exhaust, +2 move, cant use in other world
    item.price = 4;
    [(MovementItem*)item setMovementBonus:2];
    [(MovementItem*)item setUsableInOtherWorld:NO];
    [commons addObject:item];
    [commons addObject:item];
    
    return commons;
}

@end