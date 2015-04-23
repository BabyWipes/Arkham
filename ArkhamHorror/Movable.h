//
//  Movable.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class Location;
@class Neighborhood;

#import <Foundation/Foundation.h>
#import "MFJSONObject.h"

@interface Movable : MFJSONObject
@property (strong, nonatomic) NSString *name;
@property (weak, nonatomic) Neighborhood *currentNeighborhood;
@property (weak, nonatomic) Location *currentLocation;
@end
