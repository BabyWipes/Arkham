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
