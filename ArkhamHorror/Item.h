//
//  Item.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger hands;
@property (nonatomic) NSInteger price;
@property (nonatomic) BOOL isExhausted;
@property (nonatomic) BOOL shouldDiscard;
@end
