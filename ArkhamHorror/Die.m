//
//  Die.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Die.h"

@implementation Die

+(NSUInteger)d4 {return arc4random_uniform(4)+1;}
+(NSUInteger)d6 {return arc4random_uniform(6)+1;}
+(NSUInteger)d8 {return arc4random_uniform(8)+1;}
+(NSUInteger)d10 {return arc4random_uniform(10)+1;}
+(NSUInteger)d20 {return arc4random_uniform(20)+1;}
@end
