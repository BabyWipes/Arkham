//
//  AllySetup.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "AllySetup.h"
#import "Ally.h"
@implementation AllySetup
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
@end
