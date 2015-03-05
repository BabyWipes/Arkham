//
//  Movable.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class Movable;
@class Location;
@class Neighborhood;

#import <Foundation/Foundation.h>

@interface Movable : NSObject
@property (strong, nonatomic) Neighborhood *currentNeighborhood;
@property (strong, nonatomic) Location *currentLocation;
@property (nonatomic, readonly) BOOL inInStreet;
@end
