//
//  Item.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger hands;
@property (nonatomic) NSInteger price;
@property (nonatomic) BOOL isExhausted;
@property (nonatomic) BOOL shouldDiscard;

@property (strong, nonatomic) NSArray *eventFlags; // things a player holding this item needs to pay attention to


/*
 COMMONS
 
 Item                   Type        Price	Count
 ------------------------------------------------
 .18 Derringer          P. weapon	$3		2
 .38 Revolver           P. weapon	$4		2
 .45 Automatic          P. weapon	$5		2
 Ancient Tome           Tome        $4		2
 Axe                    P. weapon	$3		2
 Bullwhip               P. weapon	$2		2
 Cavalry Saber          P. weapon	$3		2
 Cross                  M. weapon	$3		2
 Dark Cloak                         $2		2
 Dynamite               P. weapon	$4		2
 Food                               $1		2
 Knife                  P. weapon	$2		2
 Lantern                            $3		2
 Lucky Cigarette Case               $1		2
 Map of Arkham                      $2		2
 Motorcycle                         $4		2
 Old Journal            Tome        $1		2
 Research Materials                 $1		2
 Rifle                  P. weapon   $6		2
 Shotgun                P. weapon	$6		2
 Tommy Gun              P. weapon	$7		2
 Whiskey                            $1		2
 
 
 ///
 
 UNIQUES
 
 
 Item                           Type        Price   Count
 --------------------------------------------------------
 Alien Statue                               $5		1
 Ancient Tablet                             $8		1
 Blue Watcher of the Pyramid                $4		1
 Book of Dzyan                  Tome        $3		1
 Cabala of Saboth               Tome        $5		2
 Cultes des Goules              Tome        $3		2
 Dragon's Eye                               $6		1
 Elder Sign                                 $5		4
 Enchanted Blade                M. weapon	$6		2
 Enchanted Jewelry                          $3		1
 Enchanted Knife                M. weapon	$5		2
 Flute of the Outer Gods                    $8		1
 Gate Box                                   $4		1
 Healing Stone                              $8		1
 Holy Water                     M. weapon	$4		4
 Lamp of Alhazred               M. weapon	$7		1
 Nameless Cults                 Tome        $3		2
 Necronomicon                   Tome        $6		1
 Obsidian Statue                            $4		1
 Pallid Mask                                $4		1
 Powder of Ibn-Ghazi            M. weapon	$6		2
 Ruby of R'lyeh                             $8		1
 Silver Key                                 $4		1
 Sword of Glory                 M. weapon	$8		1
 The King in Yellow             Tome        $2		2
 Warding Statue                             $6		1
 
 
 ///
 
 SPELLS
 
 
 Spell                      Casting modifier    Sanity cost Hands	Count
 ------------------------------------------------------------------------
 Bind Monster               +4                  2           2		2 // discard to pass 1 combat check. must roll successes = monster's toughness to cast. can't use on ancient one
 Dread Curse of Azathoth	-2                  2           2		4 // exhaust to gain +9 combat until end of this combat
 Enchant Weapon             +0                  1           0       3 // exhaust to make p.weapon a m.weapon until end of combat
 Find Gate                  -1                  1           0       4 // exhaust to immediately return from other world
 Flesh Ward                 -2                  1           0       4 // exhaust to ignore all stamina damage from one source, discard on ancient one awakening
 Heal                       +1                  1           0       3 // may exhaust in upkeep to gain stamina = successes of spell check. target 1 player in location
 Mists of Releh             Special             0           0       4 // cast + exhaust to pass evade check, modifier == monsters awareness
 Red Sign of Shudde M'ell	-1                  1           1		2 // exhaust to lower monster's toughness by 1 (minimum of 1) + ignore 1 of its special abilities (not Magical Immunity) until end of combat. (only special abilities marked in bold can be chosen to be ignored, i.e. not special combat abilities like the Nightgaunt has.)
 Shrivelling                -1                  1           1		5 // exhaust to gain +6 combat until end of this combat
 Voice of Ra                -1                  1           0       3 // exhaust to gain +1 to all skill checks until end of turn
 Wither                     0                   0           1		6 // exhaust to gain +3 combat until end of this combat
 
 */
@end

