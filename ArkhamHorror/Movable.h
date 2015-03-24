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
#import "JSONObject.h"

@interface Movable : JSONObject
@property (nonatomic, readonly) Neighborhood *currentNeighborhood;
@property (strong, nonatomic) Location *currentLocation;
@end
