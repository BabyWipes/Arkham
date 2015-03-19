//
//  Dimension.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/16/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defines.h"

@interface Dimension : NSObject
@property (nonatomic) MonsterDimensionSymbol value;
+(instancetype)ofType:(MonsterDimensionSymbol)symbol;

+(NSArray*)exportJSON:(NSArray*)dimensions;
+(NSArray*)importJSON:(NSArray*)rawDimensions;

-(instancetype)initWithType:(MonsterDimensionSymbol)type;
-(BOOL)equalsDimension:(Dimension*)other;
@end