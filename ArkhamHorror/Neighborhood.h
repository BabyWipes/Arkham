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

@interface Neighborhood : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *encounterDeck;
@property (strong, nonatomic) NSArray *locations;
@property (strong, nonatomic) Location *street;
@property (nonatomic) BOOL hasSecondaryColorlessStreet;

@property (strong, nonatomic) Neighborhood *whiteStreetConnection;
@property (strong, nonatomic) Neighborhood *blackStreetConnection;
@property (strong, nonatomic) Neighborhood *colorlessStreetConnection;
@property (strong, nonatomic) Neighborhood *secondaryColorlessStreetConnection;

@property (strong, nonatomic) NSString *whiteStreetConnectionName;
@property (strong, nonatomic) NSString *blackStreetConnectionName;
@property (strong, nonatomic) NSString *colorlessStreetConnectionName;
@property (strong, nonatomic) NSString *secondaryColorlessStreetConnectionName;

+(NSArray*)arkhamBoard;
-(instancetype)initWithProperties:(NSDictionary*)properties;
-(NSDictionary*)exportJSON;
@end
