//
//  Dimension.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/16/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Dimension.h"

@implementation Dimension

#pragma mark - MFJSONObject

-(NSString*)stringRepresentationOfObject:(id)obj {
    if ([obj isKindOfClass:[Dimension class]]){
        Dimension *dim = obj;
        switch (dim.value) {
            case MonsterDimensionSymbolCircle: return @"circle";
            case MonsterDimensionSymbolCrescent: return @"crescent";
            case MonsterDimensionSymbolDiamond: return @"diamond";
            case MonsterDimensionSymbolHexagon: return @"hexagon";
            case MonsterDimensionSymbolPlus: return @"plus";
            case MonsterDimensionSymbolSlash: return @"slash";
            case MonsterDimensionSymbolSquare: return @"square";
            case MonsterDimensionSymbolStar: return @"star";
            case MonsterDimensionSymbolTriangle: return @"triangle";
            default: return @"undefined";
        }
    }
    else {
        return [super stringRepresentationOfObject:obj];
    }
}

-(id)objectFromStringRepresentation:(NSString*)stringRepresentation {
    Dimension *dimension = [[Dimension alloc] init];
    if ([stringRepresentation isEqualToString:@"circle"]){
        dimension.value = MonsterDimensionSymbolCircle;
    }
    else if ([stringRepresentation isEqualToString:@"crescent"]){
        dimension.value = MonsterDimensionSymbolCrescent;
    }
    else if ([stringRepresentation isEqualToString:@"diamond"]){
        dimension.value = MonsterDimensionSymbolDiamond;
    }
    else if ([stringRepresentation isEqualToString:@"hexagon"]){
        dimension.value = MonsterDimensionSymbolHexagon;
    }
    else if ([stringRepresentation isEqualToString:@"plus"]){
        dimension.value = MonsterDimensionSymbolPlus;
    }
    else if ([stringRepresentation isEqualToString:@"slash"]){
        dimension.value = MonsterDimensionSymbolSlash;
    }
    else if ([stringRepresentation isEqualToString:@"square"]){
        dimension.value = MonsterDimensionSymbolSquare;
    }
    else if ([stringRepresentation isEqualToString:@"star"]){
        dimension.value = MonsterDimensionSymbolStar;
    }
    else if ([stringRepresentation isEqualToString:@"triangle"]){
        dimension.value = MonsterDimensionSymbolTriangle;
    }
    return dimension;
}

+(instancetype)ofType:(MonsterDimensionSymbol)type{
    Dimension *dimension = [[Dimension alloc] init];
    dimension.value = type;
    return dimension;
}

-(BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[Dimension class]]){
        return self.value == [(Dimension*)object value];
    }
    else {
        return [super isEqual:object];
    }
}

@end