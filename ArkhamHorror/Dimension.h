//
//  Dimension.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/16/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFJSONObject.h"
#import "Defines.h"

@interface Dimension : MFJSONObject
@property (nonatomic) MonsterDimensionSymbol value;

+(instancetype)ofType:(MonsterDimensionSymbol)symbol;

@end