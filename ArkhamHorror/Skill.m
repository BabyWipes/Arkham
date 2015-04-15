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
        self.skillAffected = SkillCheckTypeLuck;
    }
    return self;
}
@end

@implementation RerollSkill
@end

@implementation BoostSkill
@end
