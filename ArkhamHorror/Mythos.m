//
//  Mythos.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Mythos.h"
#import "Dimension.h"
#import "Game.h"

@implementation Mythos

#pragma mark - MFJSONObject

+(NSArray*)ignoredProperties {
    return @[@"mythosType"];
}
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Mythos";
        self.cardType = CardTypeMythos;
    }
    return self;
}
@end

@implementation TheStoryContinuesMythos

#pragma mark - MFJSONObject

+(NSArray*)ignoredProperties {
    return @[@"blackDimensions",
             @"whiteDimensions",
             @"gateLocation",
             @"clueLocation"];
}

-(id)init {
    self = [super init];
    if (self){
        self.name = @"The Story Continues...";
        self.mythosType = MythosTypeStoryContinues;
    }
    return self;
}
@end
