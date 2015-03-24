//
//  JSONObject.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONObject : NSObject
+(instancetype)generate:(NSDictionary*)properties;
-(id)initWithProperties:(NSDictionary*)properties;
-(NSDictionary*)json;
-(NSString*)classString;
@end

