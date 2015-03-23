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
@property (nonatomic) SkillCheckType skillAffected;
@property (nonatomic) NSInteger skillBonus;
@property (nonatomic) SkillCheckType secondSkillAffected;
@property (nonatomic) NSInteger secondSkillBonus;

@property (nonatomic) NSInteger maxStaminaBonus;
@property (nonatomic) NSInteger maxSanityBonus;
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
             @"heals_sta":@(self.discardToHealStamina)};
}


-(void)ally:(Ally*)ally wasGivenToInvestigator:(Investigator*)investigator {
    
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
