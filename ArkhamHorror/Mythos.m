//
//  Mythos.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Mythos.h"
#import "Dimension.h"

@implementation Mythos
-(instancetype)initWithProperties:(NSDictionary*)properties {
    self = [super init];
    if (self){
        self.cardType = CardTypeMythos;

        self.name = properties[@"name"];
        self.whiteDimensons = [Dimension importJSON:properties[@"white_dimensions"]];
        self.blackDimensions = [Dimension importJSON:properties[@"black_dimensions"]];
        self.mythosType = [properties[@"mythos_type"] unsignedIntegerValue];
        self.gateLocation = properties[@"gate_location"];
        self.clueLocation = properties[@"clue_location"];
    }
    return self;
}
-(NSDictionary*)exportJSON {
    NSDictionary *exportDict = @{@"name":self.name,
                                 @"white_dimensions":[Dimension exportJSON:self.whiteDimensons],
                                 @"black_dimensions":[Dimension exportJSON:self.blackDimensions],
                                 @"mythos_type":@(self.mythosType),
                                 @"gate_location":self.gateLocation,
                                 @"clue_location":self.clueLocation};
    return exportDict;
}
@end
