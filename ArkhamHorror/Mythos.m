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
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Mythos";
    }
    return self;
}
@end

@implementation TheStoryContinuesMythos
-(id)init {
    self = [super init];
    if (self){
        self.name = @"The Story Continues...";
        self.mythosType = MythosTypeStoryContinues;
    }
    return self;
}
@end
