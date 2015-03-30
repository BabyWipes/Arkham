//
//  Ally.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/4/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

/*
 ALLIES
 Name                   Ability
 ------------------------------
 Anna Kaslow            +2 Luck, on gain: +2 clues
 Duke                   +1 max SAN, discard to full restore SAN
 Eric Colt              +2 Speed, you take no damage from Nightmarish
 John Legrasse          +2 Will, can claim Endless monsters as trohpies
 Professor Armitage     +2 Lore, can ignore Magical Resistance
 Richard Upton Pickman  +1 Luck, +1 Speed, can ignore Physical Resistance
 Ruby Standish          +2 Sneak, on gain: +1 unique item
 Ryan Dean              +1 Will, +1 Sneak, on gain: +1 common item
 Sir William Brinton    +1 max STA, discard to full restore STA
 Thomas F. Malone       +1 Fight, +1 Lore, on gain: +1 spell
 Tom "Mountain" Murphy  +2 Fight, you take no damage from Overwhelming
 */

@interface Ally : Card <CardEventDelegate>
-(void)wasGivenToInvestigator:(Investigator*)investigator;
-(BOOL)canBeDiscarded;
-(void)wasTakenFromInvestigator:(Investigator*)investigator;
@end

@interface AllyAnnaKaslow : Ally
@end

@interface AllyDuke : Ally
@end

@interface AllyEricColt : Ally
@end

@interface AllyJohnLegrasse : Ally
@end

@interface AllyProfessorArmitage : Ally
@end

@interface AllyRichardUptonPickman : Ally
@end

@interface AllyRubyStandish : Ally
@end

@interface AllyRyanDean : Ally
@end

@interface AllySirWilliamBrinton : Ally
@end

@interface AllyThomasFMalone : Ally
@end

@interface AllyTomMountainMurphy : Ally
@end