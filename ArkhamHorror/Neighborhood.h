//
//  Neighborhood.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Neighborhood : NSObject
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSUInteger neighborhoodID;
@property (strong, nonatomic) Neighborhood *whiteStreetConnection;
@property (strong, nonatomic) Neighborhood *blackStreetConnection;
@property (strong, nonatomic) Neighborhood *colorlessStreetConnection;
@property (strong, nonatomic) NSArray *locations;

@end

@interface MerchantDistrictNeighborhood : Neighborhood
@property (strong, nonatomic) Neighborhood *secondaryColorlessStreetConnection;

@end
