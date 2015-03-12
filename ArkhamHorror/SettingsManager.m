//
//  SettingsManager.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/12/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "SettingsManager.h"

@implementation SettingsManager

+(NSURL*)arkhamHorrorDirectory {
    // for production, put these files in NSApplicationSupportDirectory instead of NSDocumentDirectory.
    // on iOS, i _believe_ we only have access to documents dir though
    NSURL *url = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
    url = [url URLByAppendingPathComponent:@"ArkhamHorror"];
    BOOL isDirectory;
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[url path] isDirectory:&isDirectory];
    if (fileExists && isDirectory) {
        return url;
    }
    else {
        NSError *error;
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtURL:url withIntermediateDirectories:YES attributes:nil error:&error];
        if (success){
            return url;
        }
        else {
            NSLog(@"Error, can't create dir: %@",error.localizedDescription);
        }
    }
    return nil;
}

+(NSDictionary*)settingsNamed:(NSString*)fileName {
    if (!fileName){
        fileName = @"Default";
    }
    NSURL *settingsFile = [[[self arkhamHorrorDirectory] URLByAppendingPathComponent:fileName] URLByAppendingPathExtension:@"json"];
    NSError *error;
    NSString *jsonString = [[NSString alloc] initWithContentsOfURL:settingsFile encoding:NSUTF8StringEncoding error:&error];
    if (jsonString == nil) {
        NSLog(@"Error, can't read file at %@: %@", settingsFile, error.localizedDescription);
        return nil;
    }
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];
    if (!json){
        NSLog(@"Error, couldn't parse JSON: %@",error.localizedDescription);
        return nil;
    }
    return json;
}

+(BOOL)writeSettings:(NSDictionary*)dict named:(NSString*)fileName{
    if (!fileName){
        fileName = @"Default";
    }
    BOOL validJSON = [NSJSONSerialization isValidJSONObject:dict];
    if (!validJSON){
        NSLog(@"Error, Settings dictionary contains values which may not be parsed into JSON");
        return NO;
    }
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"Error, dict couldn't be parsed into JSON: %@",error.localizedDescription);
        return NO;
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSURL *settingsUrl = [[[self arkhamHorrorDirectory] URLByAppendingPathComponent:fileName] URLByAppendingPathExtension:@"json"];
    BOOL ok = [jsonString writeToURL:settingsUrl atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!ok){
        NSLog(@"Error, couldn't write JSON to file: %@",error.localizedDescription);
        return NO;
    }
    else {
        return YES;
    }
}

+(NSDictionary*)arkhamHorrorDefaults {
    NSDictionary *settings = [self settingsNamed:@"Default"];
    if (!settings){
        NSLog(@"Settings not found, writing default settings");
        settings = @{@"string":@"string",
                     @"dict":@{@"sub_string":@"sub_string"},
                     @"num":@1,
                     @"arr":@[@1,@2,@3]};
        [self writeSettings:settings named:@"Default"];
    }
    return settings;
}
@end
