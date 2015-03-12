//
//  ItemSetup.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/12/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "ItemSetup.h"

@implementation ItemSetup

#pragma mark - class methods

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
