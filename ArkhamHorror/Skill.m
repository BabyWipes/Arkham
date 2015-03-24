//
//  Skill.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Skill.h"

@implementation Skill
-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Skill Prototype";
        self.cardType = CardTypeSkill;
        self.allowsReroll = NO;
        self.skillAffected = SkillCheckTypeLuck;
        self.skillBonus = 0;
        self.dieBonus = 0;
    }
    return self;
}

-(NSDictionary*)exportJSON {
    return @{@"name":self.name,
             @"skill_check_type":@(self.skillAffected),
             @"skill_bonus":@(self.skillBonus),
             @"die_bonus":@(self.dieBonus)};
}

-(id)copyWithZone:(NSZone *)zone {
    Skill *copy = [[Skill alloc] init];
    copy.name = self.name;
    copy.skillAffected = self.skillAffected;
    copy.allowsReroll = self.allowsReroll;
    copy.skillBonus = self.skillBonus;
    copy.dieBonus = self.dieBonus;
    return copy;
}

@end
