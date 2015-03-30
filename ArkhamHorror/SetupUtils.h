//
//  SetupUtils.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetupUtils : NSObject
+(void)resetArkhamHorrorSettings;
+(NSMutableArray*)arkhamHorrorCommons;
+(NSMutableArray*)arkhamHorrorSkills;
+(NSMutableArray*)arkhamHorrorAllies;
+(NSMutableArray*)arkhamHorrorMonsters;
+(NSArray*)arkhamHorrorMaskMonsters;
+(NSArray*)arkhamBoard;
@end
