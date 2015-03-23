//
//  SkillSetup.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "SkillSetup.h"
#import "Skill.h"
@implementation SkillSetup
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
    [skills addObject:[skill copy]];
    
    skill = [[Skill alloc] init];
    skill.name = @"Expert Occultist";
    skill.skillAffected = SkillCheckTypeSpell;
    skill.allowsReroll = YES;
    [skills addObject:skill];
    [skills addObject:[skill copy]];
    
    skill = [[Skill alloc] init];
    skill.name = @"Marksman";
    skill.skillAffected = SkillCheckTypeCombat;
    skill.allowsReroll = YES;
    [skills addObject:skill];
    [skills addObject:[skill copy]];
    
    skill = [[Skill alloc] init];
    skill.name = @"Stealth";
    skill.skillAffected = SkillCheckTypeEvade;
    skill.allowsReroll = YES;
    [skills addObject:skill];
    [skills addObject:[skill copy]];
    
    skill = [[Skill alloc] init];
    skill.name = @"Speed";
    skill.skillAffected = SkillCheckTypeSpeed;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    [skills addObject:[skill copy]];
    
    skill = [[Skill alloc] init];
    skill.name = @"Sneak";
    skill.skillAffected = SkillCheckTypeSneak;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    [skills addObject:[skill copy]];
    
    skill = [[Skill alloc] init];
    skill.name = @"Fight";
    skill.skillAffected = SkillCheckTypeFight;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    [skills addObject:[skill copy]];
    
    skill = [[Skill alloc] init];
    skill.name = @"Will";
    skill.skillAffected = SkillCheckTypeWill;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    [skills addObject:[skill copy]];
    
    skill = [[Skill alloc] init];
    skill.name = @"Lore";
    skill.skillAffected = SkillCheckTypeLore;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    [skills addObject:[skill copy]];
    
    skill = [[Skill alloc] init];
    skill.name = @"Luck";
    skill.skillAffected = SkillCheckTypeLuck;
    skill.allowsReroll = NO;
    skill.skillBonus = 1;
    skill.dieBonus = 1;
    [skills addObject:skill];
    [skills addObject:[skill copy]];
    
    return skills;
}
@end
