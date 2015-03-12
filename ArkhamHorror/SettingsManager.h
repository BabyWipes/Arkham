//
//  SettingsManager.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/12/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsManager : NSObject

// TODO we can put a ton of stuff in here to validate, create, and update games' settings files
+(NSDictionary*)arkhamHorrorDefaults;

+(NSDictionary*)settingsNamed:(NSString*)fileName;
+(BOOL)writeSettings:(NSDictionary*)dict named:(NSString*)fileName;

@end
