//
//  Neighborhood.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Neighborhood.h"
#import "Location.h"

@implementation Neighborhood

#pragma mark - Instance Methods

-(instancetype)init {
    self = [super init];
    if (self){
        self.street = [Location street];
        self.encounterDeck = [NSMutableArray new];
    }
    return self;
}

-(void)setName:(NSString *)name {
    if (_name != name){
        _name = name;
        if (self.street){
            self.street.name = _name;
        }
    }
}

-(void)setWhiteStreetConnectingNeighborhood:(Neighborhood*)connectingHood {
    self.whiteStreetConnection = connectingHood.name;
    connectingHood.blackStreetConnection = self.name;
}

-(void)setBlackStreetConnectingNeighborhood:(Neighborhood*)connectingHood {
    self.blackStreetConnection = connectingHood.name;
    connectingHood.whiteStreetConnection = self.name;
}

-(void)setColorlessConnectingNeighborhood:(Neighborhood*)connectingHood {
    self.colorlessStreetConnection = connectingHood.name;
    connectingHood.colorlessStreetConnection = self.name;
}

#pragma mark - Description
-(NSString*)description {
    return [NSString stringWithFormat:@"%@(%@)",[super description],self.name];
}
@end

