//
//  Dimension.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/16/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Dimension.h"

@implementation Dimension

+(instancetype)ofType:(MonsterDimensionSymbol)type{
    return [[Dimension alloc] initWithType:type];
}
+(NSArray*)exportJSON:(NSArray*)dimensions {
    NSMutableArray *exportedDimensions = [NSMutableArray new];
    for (Dimension *dim in dimensions){
        [exportedDimensions addObject:@(dim.value)];
    }
    return exportedDimensions;
}
+(NSArray*)importJSON:(NSArray*)rawDimensions {
    NSMutableArray *dimensions = [NSMutableArray new];
    for (NSNumber *dimValue in rawDimensions){
        [dimensions addObject:[Dimension ofType:[dimValue unsignedIntegerValue]]];
    }
    return dimensions;
}

-(instancetype)initWithType:(MonsterDimensionSymbol)type {
    self = [super init];
    if (self){
        self.value = type;
    }
    return self;
}
-(BOOL)equalsDimension:(Dimension*)other{
    return (self.value == other.value);
}

@end