//
//  Card.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/27/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Defines.h"
#import "GameEventDelegate.h"
#import "MFJSONObject.h"

// All items drawable from a Deck must extend from the Card base class
@interface Card : MFJSONObject
@property (nonatomic) CardType cardType;
@property (strong, nonatomic) NSString *name;
@end
