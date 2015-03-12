//
//  Defines.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#ifndef ArkhamHorror_Defines_h
#define ArkhamHorror_Defines_h

typedef NS_ENUM(NSUInteger, SkillCheckType) {
    SkillCheckTypeSpeed,
    SkillCheckTypeSneak,
    SkillCheckTypeEvade,  // == sneak check, some items only affect this
    SkillCheckTypeFight,
    SkillCheckTypeWill,
    SkillCheckTypeCombat, // == fight check, some items only affect this
    SkillCheckTypeHorror, // == will check, some items only affect this
    SkillCheckTypeLore,
    SkillCheckTypeLuck,
    SkillCheckTypeSpell   // == lore check, some items only affect this
};

#endif
