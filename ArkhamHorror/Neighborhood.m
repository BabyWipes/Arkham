//
//  Neighborhood.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Neighborhood.h"

@implementation Neighborhood

-(instancetype)init {
    self = [super init];
    if (self){
        self.street = [Location street];
    }
    return self;
}

-(void)setWhiteStreetConnection:(Neighborhood *)whiteStreetConnection {
    if (_whiteStreetConnection != whiteStreetConnection){
        _whiteStreetConnection = whiteStreetConnection;
        whiteStreetConnection.blackStreetConnection = self;
    }
}
-(void)setBlackStreetConnection:(Neighborhood *)blackStreetConnection {
    if (_blackStreetConnection != blackStreetConnection){
        _blackStreetConnection = blackStreetConnection;
        blackStreetConnection.whiteStreetConnection = self;
    }
}
-(void)setColorlessStreetConnection:(Neighborhood *)colorlessStreetConnection {
    if (_colorlessStreetConnection != colorlessStreetConnection){
        _colorlessStreetConnection = colorlessStreetConnection;
        colorlessStreetConnection.colorlessStreetConnection = self;
    }
}

#pragma mark - Description
-(NSString*)description {
    return [NSString stringWithFormat:@"%@(%@)",[super description],self.name];
}
@end

@implementation MerchantDistrictNeighborhood

-(void)setColorlessStreetConnection:(Neighborhood *)colorlessStreetConnection {
    if (self.colorlessStreetConnection != nil){
        self.secondaryColorlessStreetConnection = colorlessStreetConnection;
        colorlessStreetConnection.colorlessStreetConnection = self;
    }
    else {
        [super setColorlessStreetConnection:colorlessStreetConnection];
    }
}

@end
