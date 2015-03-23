//
//  Card.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/27/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Card.h"

@implementation Card
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Card";
    }
    return self;
}
-(id)initWithProperties:(NSDictionary *)properties {
    self = [self init];
    if (self){
        self.name = properties[@"name"];
    }
    return self;
}
-(NSDictionary*)exportJSON {
    return @{@"name":self.name};
}
@end
