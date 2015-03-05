//
//  Movable.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Movable.h"
#import "Neighborhood.h"
#import "Location.h"

@implementation Movable

-(void)setCurrentLocation:(Location *)currentLocation {
    if (_currentLocation != currentLocation) {
        // current neighborhood = new locations neighborhood
        _currentLocation = currentLocation;
        if ([self isKindOfClass:[Investigator class]]){
            [_currentLocation.investigatorsHere addObject:self];
        }
        else {
            [_currentLocation.monstersHere addObject:self];
        }
    }
}

-(BOOL)inInStreet {
    return (self.currentNeighborhood.street == self.currentLocation);
}
@end
