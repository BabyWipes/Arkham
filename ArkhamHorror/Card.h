//
//  Card.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/27/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class Card;

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CardType) {
    CardTypeCommonItem,
    CardTypeUniqueItem,
    CardTypeSpell,
    CardTypeSkill,
    CardTypeAlly,
    CardTypeArkhamEncounter,
    CardTypeOtherWorldEncounter,
    CardTypeMythos
};

// All items drawable from a Deck must extend from the Card base class
@interface Card : NSObject
@property (nonatomic) CardType cardType;
@end
