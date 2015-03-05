//
//  Board.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class Board;
#import <Foundation/Foundation.h>

@interface Board : NSObject
@property (strong, nonatomic) NSArray *neighborhoods;
+(instancetype)arkhamBoard;
@end
