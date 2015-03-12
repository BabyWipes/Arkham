//
//  Item.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class Item;

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Defines.h"

typedef NS_ENUM(NSUInteger, ItemClassification){
    ItemClassificationNone = 0,
    ItemClassificationPhysicalWeapon,
    ItemClassificationMagicalWeapon,
    ItemClassificationTome
};

extern NSUInteger const kItemInfiniteUses;

@interface Item : Card <NSCopying>

@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger hands;
@property (nonatomic) NSInteger price;
@property (nonatomic) BOOL isExhausted;
@property (nonatomic) NSInteger usesBeforeDiscard;
@property (nonatomic) ItemClassification itemClass;
@property (strong, nonatomic) NSArray *eventFlags; // things a player holding this item needs to pay attention to
-(instancetype)initWithProperties:(NSDictionary*)properties;

@end

@interface WeaponItem : Item
@property (nonatomic) NSUInteger combatBonus;
@end

@interface TomeItem : Item
@property (nonatomic) NSInteger sanityCost;
@property (nonatomic) NSInteger moveCost;
@property (nonatomic) NSInteger loreDifficulty;
@property (nonatomic) NSInteger clueReward;
@property (nonatomic) NSInteger spellReward;
@property (nonatomic) NSInteger skillReward;
@end

// mitigates or heals a cost
@interface HealingItem : Item
@property (nonatomic) NSInteger sanityGain;
@property (nonatomic) NSInteger staminaGain;
@property (nonatomic) NSInteger clueGain;
@end

@interface MovementItem : Item
@property (nonatomic) NSInteger movementBonus;
@property (nonatomic) BOOL usableInOtherWorld;
@end

// TODO a weapon could really be considered a Fight SkillBonusItem, revise?
@interface SkillBonusItem : Item
@property (nonatomic) NSInteger skillBonus;
@property (nonatomic) SkillCheckType skillType;
@end

/*
 COMMONS
 Item                   Type        Price   Hands   Count
 --------------------------------------------------------
 Knife                  P. weapon	$2      1       2 // +1 combat checks
 Bullwhip               P. weapon	$2      1       2 // +1 combat check, exhaust to reroll 1 die after making a combat check
 Cavalry Saber          P. weapon	$3      1       2 // +2 combat check
 .18 Derringer          P. weapon	$3      1       2 // +2 combat check, cannot be lost or stolen unless you allow it
 Axe                    P. weapon	$3      1       2 // +2 combat check (+3 instead if your other hand is empty)
 .38 Revolver           P. weapon	$4      1       2 // +3 combat check
 Cross                  M. weapon	$3      1       2 // +3 combat check if Opponent is Undead, +1 Horror check
 .45 Automatic          P. weapon	$5      1       2 // +4 combat check
 Shotgun                P. weapon	$6      2       2 // +4 combat checks, if in hands & during combat, rolled 6's count as two successes
 Rifle                  P. weapon   $6      2       2 // +5 combat check
 Tommy Gun              P. weapon	$7      2       2 // +6 combat checks
 Dynamite               P. weapon	$4      2       2 // discard, +8 combat check
 Food                               $1      0       2 // discard, reduce stamina loss by 1
 Whiskey                            $1      0       2 // discard, reduce sanity loss by 1
 Dark Cloak                         $2      0       2 // +1 evade checks
 Lantern                            $3      0       2 // +1 luck checks
 Lucky Cigarette Case               $1      0       2 // discard, reroll skill check
 Research Materials                 $1      0       2 // discard, avoid spending 1 clue token
 Map of Arkham                      $2      0       2 // exhaust, +1 move, cant use in other world
 Motorcycle                         $4      0       2 // exhaust, +2 move, cant use in other world
 Ancient Tome           Tome        $4      0       2 // exhaust, -2 move: make Lore(-1) check. If pass, +1 Spell, discard
 Old Journal            Tome        $1      0       2 // exhaust, -1 move: make Lore(-1) check. If pass, +3 Clues, discard
 
 ///
 UNIQUES
 Item                          Type  $    Count
 --------------------------------------------------------
 Nameless Cults                Tome  $3	  2 // exhaust, -1 move: make Lore(-1) check. If pass, +1 Spell, -1 Sanity, discard
 Book of Dzyan                 Tome  $3	  1 // exhaust, -2 move: make a Lore(-1) check. If pass, +1 Spell, -1 Sanity. discard on 2nd success.
 Cabala of Saboth              Tome  $5	  2 // exhaust, -2 move: make a Lore(-2) check. If pass, +1 Skill and discard
 Cultes des Goules             Tome  $3	  2 // exhaust, -2 move: make a Lore(-2) check. If pass, +1 Spell and +1 Clue, -2 Sanity and discard
 Necronomicon                  Tome  $6	  1 // exhaust, -2 move: make Lore(-2) check. If pass, +1 Spell and -2 Sanity
 The King in Yellow            Tome  $2	  2 // exhaust, -2 move: make Lore(-2) check. If pass, +4 Clues, -1 Sanity and discard
 Alien Statue                        $5   1 // exhaust, -2 move & -1 sanity: roll 1 die. if success, +1 Spell or +3 Clues. else stamina -= 2
 Ancient Tablet                      $8	  1 // discard, -3 move: roll 2 dice. Foreach success rolled, +1 Spell. Foreach failure, +2 Clues.
 Blue Watcher of the Pyramid         $4	  1 // discard, -2 stamina: pass a Combat, Fight, or Lore check made to close a gate. can't be used vs ancient one
 Dragon's Eye                        $6	  1 // exhaust, -1 Sanity: redraw a gate or location card, 2nd card must be played
 Elder Sign                          $5	  4 // remove from game, -1 Sta, -1 San: auto seal gate, remove 1 doom from doom track
 Enchanted Jewelry                   $3	  1 // avoid losing 1 stamina, discard after 3 uses
 Silver Key                          $4	  1 // auto pass evade check, discard after 3 uses
 Gate Box                            $4	  1 // When returning Arkham from Other World, may return to any location with an open gate
 Healing Stone                       $8	  1 // (upkeep, optional) +1 Stamina or +1 Sanity
 Obsidian Statue                     $4	  1 // discard, cancel all sanity or stamina damage form one source
 Pallid Mask                         $4	  1 // +2 evade check
 Ruby of R'lyeh                      $8	  1 // +3 move
 Flute of the Outer Gods             $8	  1 // discard, -3 San -3 Sta, before combat check: if pass a horror check, defeat all monsters in your area.
 can't be used vs ancient one
 Warding Statue                      $6	  1 // discard, after failing Combat check, reduce the monster's combat damage to 0 Stamina.
 OR discard, cancel Ancient One's entire attack for 1 turn
 
 UNIQUE WEAPONS (still unique items, but has hands cost)
 Item                   Type        Hands   Price   Count
 --------------------------------------------------------
 Enchanted Knife        M. weapon	1       $5		2   // +3 Combat check, 1 hand
 Enchanted Blade        M. weapon	1       $6		2   // +4 Combat check, 1 hand
 Lamp of Alhazred       M. weapon	2       $7		1   // +5 combat check, 2 hands
 Sword of Glory         M. weapon	2       $8		1   // +6 Combat check, 2 hands
 Holy Water             M. weapon	2       $4		4   // discard, +6 Combat check, 2 hands
 Powder of Ibn-Ghazi    M. weapon   2       $6		2   // discard, +9 combat check, -1 Sanity, 2 hands
 
 
 ///
 SPELLS
 Spell                      Casting mod  SAN cost Hands Count
 ------------------------------------------------------------------------
 Wither                     0            0        1		6 // exhaust, +3 combat until end of this combat
 Shrivelling                -1           1        1		5 // exhaust, +6 combat until end of this combat
 Dread Curse of Azathoth	-2           2        2     4 // exhaust, +9 combat until end of this combat
 Enchant Weapon             +0           1        0     3 // exhaust, make p.weapon a m.weapon until end of combat
 Find Gate                  -1           1        0     4 // exhaust, immediately return from other world
 Flesh Ward                 -2           1        0     4 // exhaust, ignore all stamina damage from one source, discard on ancient one awakening
 Voice of Ra                -1           1        0     3 // exhaust to gain +1 to all skill checks until end of turn
 Heal                       +1           1        0     3 // (upkeep, optional) exhaust, stamina += successes of spell check. target 1 player in location
 Mists of Releh             Special      0        0     4 // cast + exhaust to pass evade check, casting modifier == monsters awareness
 Bind Monster               +4           2        2		2 // discard, pass 1 combat check. must roll successes = monster's toughness to cast. can't use vs ancient one
 Red Sign of Shudde M'ell	-1           1        1		2 // exhaust, lower monster's toughness by 1 (minimum of 1) + ignore 1 of its special abilities
 (not Magical Immunity) until end of combat. (only special abilities marked in bold can be
 chosen to be ignored, i.e. not special combat abilities like the Nightgaunt has.)
 
 
 ///
 SKILLS             Effect
 -------------------------
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
