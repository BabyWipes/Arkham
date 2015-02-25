//
//  Defines.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#ifndef ArkhamHorror_Defines_h
#define ArkhamHorror_Defines_h

typedef void(^ActionBlock)(void);

typedef NS_ENUM(NSUInteger, ItemType) {
    ItemTypesCommon,
    ItemTypesUnique,
    ItemTypeMoney,
    ItemTypeNil
};

#endif
