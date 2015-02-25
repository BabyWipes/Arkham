//
//  SkillCheck.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "SkillCheck.h"

@implementation SkillCheck
+(BOOL)skillCheck:(NSInteger)die {
    return YES;
}
+(BOOL)skillCheck:(NSInteger)modifier difficulty:(NSInteger)difficulty {
    for (int i = 0; i < 100; i++){
        int roll = arc4random_uniform(6) + 1;
        NSLog(@"Roll %i",roll);
    }
    return YES;
}
@end
