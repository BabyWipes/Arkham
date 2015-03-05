//
//  AncientOne.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class AncientOne;

#import <Foundation/Foundation.h>
#import "Monster.h"
#import "Investigator.h"

@interface AncientOne : NSObject
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger combatRating;
@property (nonatomic) NSInteger doomCounter;
@property (nonatomic) NSInteger maxDoom;
@property (nonatomic) NSInteger attackDifficultyModifier;
@property (nonatomic) BOOL isPhysicallyResistant;
@property (nonatomic) BOOL isMagicallyResistant;
@property (nonatomic) BOOL isPhysicallyImmune;
@property (nonatomic) BOOL isMagicallyImmune;

-(void)applySetupEffect;
-(void)buffWorshippers;
-(void)awaken;
-(void)attack;

@end

@interface AncientOneAzathoth : AncientOne
@end

@interface AncientOneCthulhu : AncientOne
@end

@interface AncientOneHastur : AncientOne
@end

@interface AncientOneIthaqua : AncientOne
@end

@interface AncientOneNyarlathotep : AncientOne
@end

@interface AncientOneShubNiggurath : AncientOne
@end

@interface AncientOneYig : AncientOne
@end

@interface AncientOneYogSothoth : AncientOne
@end
/*

 ANCIENT ONES
 Name           Doom Track  Combat Rating   Worshippers
 ----------------------------------------------------------------
 Azathoth       14          Special         Maniacs toughness + 1
 Cthulhu        13          -6              Cultists Horror Rating = -2, Horror Damage = 2 Sanity
 Hastur         13          -X(terror lvl)  Cultists are flying, combat rating of -2
 Ithaqua        11          -3              Cultist toughness + 2
 Nyarlathotep   11          -4              Cultists are 'Endless'
 Shub-Niggurath 12          -5              Dark Young are 'Endless'
 Yig            10          -3              Cultists combat rating is +0, combat damage is 4 STA
 Yog-Sothoth    12          -5              Cultists have magic immunity and combat rating -1
 
 ANCIENT ONES, ATTACK + DEFENCE
 Name           Defences                Attack
 -----------------------------------------------------------------------
 Azathoth       None                    None
 Cthulhu        Special (See Attack)    All players lose 1 max SAN or STA, after attack, heals 1 Doom
 Hastur         Physical Resistance     All players must pass Luck(+1) or lose 2 SAN, each turn luck modifier goes down 1 (ex: Luck(+1) -> Luck(0) -> Luck(-1)
 Ithaqua        None                    All players must pass Fight(+1) or lose 2 STA, each turn modifier goes down 1
 Nyarlathotep   Magical Resistance      All players must pass Lore(+1) or lose 1 clue, if 0, player is devoured; each turn modifier goes down 1
 Shub-Niggurath Phsical Immunity        All players must pass Sneak(+1) or lose 1 monster trophy, if 0, player is devoured; each turn modifier goes down 1
 Yig            None                    All players must pass Speed(+1) or lose 1 SAN and 1 STA, each turn modifier goes down 1
 Yog-Sothoth    Magical Immunity        All players must pass Will(+1) or lose 1 gate trophy, if 0, player is devoured; each turn modifier goes down 1
 
 ANCIENT ONES, POWERS
 Name           Power
 -----------------------------------------------------------------------
 Azathoth       On awaken, game over, players lose
 Cthulhu        All players start game with -1 max SAN and STA
 Hastur         Cost to seal gate is 8 clues instead of 5
 Ithaqua        Any investigator in street at end of mythos phase -1 STA, ignore all weather effects; on awaken roll for each item you have, discard it on fail
 Nyarlathotep   Add all 5 Mask Monsters to monster cup
 Shub-Niggurath All Monsters have toughness+1
 Yig            Gains 1 doom when investigator is lost in time and space, on awake all players cursed, if already cursed, then devoured
 Yog-Sothoth    Difficulty to close/seal gates +1, if player is lost in time+space they are instead devoured; on awake, if has no gate trophies, is devoured
 
 
*/