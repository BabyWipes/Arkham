//
//  Ally.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/4/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Ally.h"
#import "Investigator.h"
#import "Game.h"

@interface Ally ()
@end

@implementation Ally
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Ally";
        self.cardType = CardTypeAlly;
        self.skillAffected = SkillCheckTypeNone;
        self.secondSkillAffected = SkillCheckTypeNone;
        
        self.maxSanityBonus = 0;
        self.maxStaminaBonus = 0;
        
        self.discardToHealSanity = NO;
        self.discardToHealStamina = NO;
        
        self.givesClueReward = NO;
        self.givesCommonItemReward = NO;
        self.givesSpellReward = NO;
        self.givesUniqueItemReward = NO;
        
        self.ignoresNightmarish = NO;
        self.ignoresOverwhelming = NO;
        self.ignoresEndless = NO;
        
        self.ignoresPhysicalResist = NO;
        self.ignoresMagicalResist = NO;
    }
    return self;
}
-(id)initWithProperties:(NSDictionary *)properties {
    self = [self init];
    if (self){
        self.name = properties[@"name"];
        self.skillAffected = [properties[@"skill_type"] unsignedIntegerValue];
        self.skillBonus = [properties[@"skill_bonus"] integerValue];
        self.secondSkillAffected = [properties[@"second_skill_type"] unsignedIntegerValue];
        self.secondSkillBonus = [properties[@"second_skill_bonus"] integerValue];
        
        self.maxSanityBonus = [properties[@"max_san_bonus"] integerValue];
        self.maxStaminaBonus = [properties[@"max_sta_bonus"] integerValue];
        
        self.discardToHealSanity = [properties[@"heals_san"] boolValue];
        self.discardToHealStamina = [properties[@"heals_sta"] boolValue];
        
        self.givesClueReward = [properties[@"clue_reward"] boolValue];
        self.givesCommonItemReward = [properties[@"common_reward"] boolValue];
        self.givesSpellReward = [properties[@"spell_reward"] boolValue];
        self.givesUniqueItemReward = [properties[@"unique_reward"] boolValue];
        
        self.ignoresNightmarish = [properties[@"ignore_nightmarish"] boolValue];
        self.ignoresOverwhelming = [properties[@"ignore_overwhelming"] boolValue];
        self.ignoresEndless = [properties[@"ignore_endless"] boolValue];
        
        self.ignoresPhysicalResist = [properties[@"ignore_p_resist"] boolValue];
        self.ignoresMagicalResist = [properties[@"ignore_m_resist"] boolValue];
        
    }
    return self;
}
-(NSDictionary*)exportJSON {
    return @{@"name":self.name,
             @"skill_type":@(self.skillAffected),
             @"second_skill_type":@(self.secondSkillAffected),
             @"skill_bonus":@(self.skillBonus),
             @"second_skill_bonus":@(self.secondSkillBonus),
             @"max_san_bonus":@(self.maxSanityBonus),
             @"max_sta_bonus":@(self.maxStaminaBonus),
             @"heals_san":@(self.discardToHealSanity),
             @"heals_sta":@(self.discardToHealStamina),
             @"clue_reward":@(self.givesClueReward),
             @"common_reward":@(self.givesCommonItemReward),
             @"spell_reward":@(self.givesSpellReward),
             @"unique_reward":@(self.givesUniqueItemReward),
             @"ignore_nightmarish":@(self.ignoresNightmarish),
             @"ignore_overwhelming":@(self.ignoresOverwhelming),
             @"ignore_endless":@(self.ignoresEndless),
             @"ignore_p_resist":@(self.ignoresPhysicalResist),
             @"ignore_m_resist":@(self.ignoresMagicalResist)};
}


-(void)ally:(Ally*)ally wasGivenToInvestigator:(Investigator*)investigator {
    
    if (self.givesClueReward){
        investigator.clues += 2;
    }
    
    if (self.givesCommonItemReward){
        // draw 1 common
    }
    if (self.givesSpellReward){
        // draw 1 spell
    }
    if (self.givesUniqueItemReward){
        // draw 1 unique
    }    
    
    investigator.maxSanity += ally.maxSanityBonus;
    investigator.maxStamina += ally.maxStaminaBonus;
    
    switch (ally.skillAffected) {
        case SkillCheckTypeSpeed: {
            investigator.minSpeed += ally.skillBonus;
            break;
        }
        case SkillCheckTypeSneak: {
            investigator.minSneak += ally.skillBonus;
            break;
        }
        case SkillCheckTypeFight: {
            investigator.minFight += ally.skillBonus;
            break;
        }
        case SkillCheckTypeWill: {
            investigator.minWill += ally.skillBonus;
            break;
        }
        case SkillCheckTypeLore: {
            investigator.minLore += ally.skillBonus;
            break;
        }
        case SkillCheckTypeLuck: {
            investigator.minLuck += ally.skillBonus;
            break;
        }
        case SkillCheckTypeNone:
        default: {
            break;
        }
    }
    switch (ally.secondSkillAffected) {
        case SkillCheckTypeSpeed: {
            investigator.minSpeed += ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeSneak: {
            investigator.minSneak += ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeFight: {
            investigator.minFight += ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeWill: {
            investigator.minWill += ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeLore: {
            investigator.minLore += ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeLuck: {
            investigator.minLuck += ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeNone:
        default: {
            break;
        }
    }
}

-(void)ally:(Ally*)ally wasTakenFromInvestigator:(Investigator*)investigator {
    
    investigator.maxSanity -= ally.maxSanityBonus;
    investigator.maxStamina -= ally.maxStaminaBonus;
    
    switch (ally.skillAffected) {
        case SkillCheckTypeSpeed: {
            investigator.minSpeed -= ally.skillBonus;
            break;
        }
        case SkillCheckTypeSneak: {
            investigator.minSneak -= ally.skillBonus;
            break;
        }
        case SkillCheckTypeFight: {
            investigator.minFight -= ally.skillBonus;
            break;
        }
        case SkillCheckTypeWill: {
            investigator.minWill -= ally.skillBonus;
            break;
        }
        case SkillCheckTypeLore: {
            investigator.minLore -= ally.skillBonus;
            break;
        }
        case SkillCheckTypeLuck: {
            investigator.minLuck -= ally.skillBonus;
            break;
        }
        case SkillCheckTypeNone:
        default: {
            break;
        }
    }
    switch (ally.secondSkillAffected) {
        case SkillCheckTypeSpeed: {
            investigator.minSpeed -= ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeSneak: {
            investigator.minSneak -= ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeFight: {
            investigator.minFight -= ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeWill: {
            investigator.minWill -= ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeLore: {
            investigator.minLore -= ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeLuck: {
            investigator.minLuck -= ally.secondSkillAffected;
            break;
        }
        case SkillCheckTypeNone:
        default: {
            break;
        }
    }
}

@end
