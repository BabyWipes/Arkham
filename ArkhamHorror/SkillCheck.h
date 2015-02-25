//
//  SkillCheck.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SkillCheck : NSObject
+(BOOL)skillCheck:(NSInteger)die;
+(BOOL)skillCheck:(NSInteger)modifier difficulty:(NSInteger)difficulty;


@end
