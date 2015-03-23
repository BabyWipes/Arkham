//
//  Skill.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Card.h"
#import "Defines.h"

@interface Skill : Card <NSCopying, JSONObject>
@property (nonatomic) SkillCheckType skillAffected;
@property (nonatomic) BOOL allowsReroll; // if yes, reroll skill check
@property (nonatomic) NSInteger dieBonus;
@property (nonatomic) NSInteger skillBonus;
/*
///
SKILLS - 2 of each in deck
Skill              Effect
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

@end
