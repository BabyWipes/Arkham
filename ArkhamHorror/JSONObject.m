//
//  JSONObject.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "JSONObject.h"
#import <objc/runtime.h>
#import "Macros.h"

@implementation JSONObject

NSString * const kClassKey = @"_ah_class_";

+(instancetype)generate:(NSDictionary *)properties {
    Class class = NSClassFromString(properties[kClassKey]);
    [class class]; // load class into runtime if needed
    id instance = [[class alloc] initWithProperties:properties];
    return instance;
}
-(id)initWithProperties:(NSDictionary *)properties {
    self = [self init];
    if (self){
        for (NSString *key in [self propertyNames]){
            if (properties[key]){
                if ([properties[key] isKindOfClass:[NSMutableDictionary class]] && properties[key][kClassKey]){
                    [self setValue:[JSONObject generate:properties[key]] forKey:key];
                }
                else if (![properties[key] isKindOfClass:[NSNull class]]){
                    [self setValue:properties[key] forKey:key];
                }
                else {
                    NSLog(@"got 'nil' for key %@",key);
                }
            }
            else {
                NSLog(@"properties is empty for key %@",key);
            }
        }
    }
    return self;
}
-(NSDictionary*)json {
    NSMutableDictionary *json = [NSMutableDictionary new];
    for (NSString *propertyName in [self propertyNames]) {
        id value = [self valueForKey:propertyName];
        if ([value isKindOfClass:[JSONObject class]] && [value respondsToSelector:@selector(json)]){ // child is an instance of JSONObject
            json[propertyName] = [value json];
        }
        else if (value != nil) {
            json[propertyName] = value;
        }
        else {
            json[propertyName] = [NSNull null];
        }
    }
    json[kClassKey] = self.classString;
    return json;
}
-(NSString*)classString {
    return ClassString(self);
}

-(NSArray*)propertyNames {
    return [JSONObject propertiesOfClass:[self class]];
}

#pragma mark - property enumeration - private

+(NSArray*)propertiesOfClass:(Class)class {
    return [self _propertiesForHierarchyOfClass:class];
}

+(NSArray*)_propertiesForHierarchyOfClass:(Class)class {
    if (class == [NSObject class]) { // base case
        return nil;
    }
    
    // Collect properties from the current class.
    NSArray *props = [self _propertiesForSubclass:class];
    return [props arrayByAddingObjectsFromArray:[self _propertiesForHierarchyOfClass:[class superclass]]];
    
}

+(NSArray*)_propertiesForSubclass:(Class)class {
    unsigned count;
    objc_property_t *properties = class_copyPropertyList(class, &count);
    NSMutableArray *propertyList = [NSMutableArray new];
    for (unsigned idx = 0; idx < count; idx++) {
        objc_property_t property = properties[idx];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        if (![name isEqualToString:@"description"] &&
            ![name isEqualToString:@"debugDescription"] &&
            ![name isEqualToString:@"superclass"] &&
            ![name isEqualToString:@"hash"]){
            [propertyList addObject:name];
        }
    }
    
    free(properties);
    return [NSArray arrayWithArray:propertyList];
}

@end
