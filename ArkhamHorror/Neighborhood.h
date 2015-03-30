//
//  Neighborhood.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class Neighborhood;
@class Location;

#import <Foundation/Foundation.h>
#import "MFJSONObject.h"

@interface Neighborhood : MFJSONObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *encounterDeck;
@property (strong, nonatomic) NSArray *locations;
@property (strong, nonatomic) Location *street;

@property (strong, nonatomic) NSString *whiteStreetConnection;
@property (strong, nonatomic) NSString *blackStreetConnection;
@property (strong, nonatomic) NSString *colorlessStreetConnection;
@property (strong, nonatomic) NSString *secondaryColorlessStreetConnection;

-(void)setWhiteStreetConnectingNeighborhood:(Neighborhood*)connectingHood;
-(void)setBlackStreetConnectingNeighborhood:(Neighborhood*)connectingHood;
-(void)setColorlessConnectingNeighborhood:(Neighborhood*)connectingHood;

@end
