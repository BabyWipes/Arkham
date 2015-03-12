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

#pragma mark - Setup convenience

+(NSArray*)arkhamBoard {
    
    Neighborhood *downtown = [[Neighborhood alloc] init];
    downtown.name = @"Downtown";
    downtown.neighborhoodID = 0;
    
    Neighborhood *easttown = [[Neighborhood alloc] init];
    easttown.name = @"Easttown";
    easttown.neighborhoodID = 1;
    
    Neighborhood *frenchHill = [[Neighborhood alloc] init];
    frenchHill.name = @"French Hill";
    frenchHill.neighborhoodID = 2;
    
    Neighborhood *merchantDistrict = [[Neighborhood alloc] init];
    merchantDistrict.name = @"Merchant District";
    merchantDistrict.neighborhoodID = 3;
    
    Neighborhood *miskatonicUniversity = [[Neighborhood alloc] init];
    miskatonicUniversity.name = @"Miskatonic University";
    miskatonicUniversity.neighborhoodID = 4;
    
    Neighborhood *northside = [[Neighborhood alloc] init];
    northside.name = @"Northside";
    northside.neighborhoodID = 5;
    
    Neighborhood *rivertown = [[Neighborhood alloc] init];
    rivertown.name = @"Rivertown";
    rivertown.neighborhoodID = 6;
    
    Neighborhood *southside = [[Neighborhood alloc] init];
    southside.name = @"Southside";
    southside.neighborhoodID = 7;
    
    Neighborhood *uptown = [[Neighborhood alloc] init];
    uptown.name = @"Uptown";
    uptown.neighborhoodID = 8;
    
    NSArray *arkham = @[downtown,
                        easttown,
                        frenchHill,
                        merchantDistrict,
                        miskatonicUniversity,
                        northside,
                        rivertown,
                        southside,
                        uptown];
    
    downtown.colorlessStreetConnection = merchantDistrict;
    downtown.whiteStreetConnection = easttown;
    downtown.blackStreetConnection = northside;
    
    easttown.whiteStreetConnection = rivertown;
    
    frenchHill.blackStreetConnection = rivertown;
    frenchHill.whiteStreetConnection = southside;
    frenchHill.colorlessStreetConnection = miskatonicUniversity;
    
    merchantDistrict.whiteStreetConnection = northside;
    merchantDistrict.blackStreetConnection = miskatonicUniversity;
    
    miskatonicUniversity.blackStreetConnection = uptown;
    
    southside.blackStreetConnection = uptown;
    
    //// downtown
    BankLocation *bank = [[BankLocation alloc] init]; // get bank loan if has none
    HealerLocation *asylum = [[HealerLocation alloc] initWithHealsSanity:YES]; // 1 free sanity or pay 2 max sanity
    Location *independenceSq = [[Location alloc] initWithStability:NO];
    downtown.locations = @[bank,asylum,independenceSq];
    
    //// easttown
    Location *roadHouse = [[Location alloc] initWithStability:NO];
    PoliceStationLocation *policeStation = [[PoliceStationLocation alloc] init]; // spend 10 monster trophy, 2 gate trophy or 5 monster + 1 gate to become deputy
    Location *diner = [[Location alloc] init];
    easttown.locations = @[roadHouse,policeStation,diner];
    
    
    //// french hill
    LodgeLocation *lodge = [[LodgeLocation alloc] initWithStability:NO]; // if has membership can choose encounter from inner sanctum
    Location *witchHouse = [[Location alloc] initWithStability:NO];
    frenchHill.locations = @[lodge,witchHouse];
    
    //// merchant
    DocksLocation *docks = [[DocksLocation alloc] init]; // 5 monster trophy or 1 gate to gain 5 money
    Location *unnamable = [[Location alloc] initWithStability:NO];
    Location *isle = [[Location alloc] initWithStability:NO];
    merchantDistrict.locations = @[docks,unnamable,isle];
    
    //// university
    AdminBuildingLocation *adminBuilding = [[AdminBuildingLocation alloc] init]; // spend 8, draw two skill, keep one
    Location *library = [[Location alloc] init];
    ScienceBuildingLocation *sciBuilding = [[ScienceBuildingLocation alloc] initWithStability:NO]; // 5 monster trophy or 1 gate to gain 2 clues
    miskatonicUniversity.locations = @[adminBuilding,library,sciBuilding];
    
    //// northside
    CurioStoreLocation *curioShop = [[CurioStoreLocation alloc] init]; // draw 3 unique, buy one at cost, discard others
    Location *newspaper = [[Location alloc] init];
    Location *trainStation = [[Location alloc] init];
    northside.locations = @[curioShop,newspaper,trainStation];
    
    //// rivertown
    Location *cave = [[Location alloc] initWithStability:NO];
    GeneralStoreLocation *genStore = [[GeneralStoreLocation alloc] init]; // draw 3 common, buy one at cost, discard others
    Location *graveyard = [[Location alloc] initWithStability:NO];
    rivertown.locations = @[cave,genStore,graveyard];
    
    //// southside
    Location *histSociety = [[Location alloc] initWithStability:NO];
    BoardingHouseLocation *boardingHouse = [[BoardingHouseLocation alloc] init]; // spend 10 monster trophy, 2 gate trophy or 5 monster and 1 gate to get ally
    ChurchLocation *church = [[ChurchLocation alloc] init]; // 5 monster trophy or 1 gate to gain blessed (choose target)
    southside.locations = @[histSociety,boardingHouse,church];
    
    //// uptown
    HealerLocation *hospital = [[HealerLocation alloc] initWithHealsSanity:NO]; // 1 free stamina or spend 2 get max stamina
    Location *woods = [[Location alloc] initWithStability:NO];
    MagickStoreLocation *magickShop = [[MagickStoreLocation alloc] init]; //spend 5, draw two spell, keep one, discard other
    uptown.locations = @[hospital,woods,magickShop];
    
    adminBuilding.name = @"Administration Building";
    asylum.name = @"Arkham Asylum";
    bank.name = @"Bank of Arkham";
    cave.name = @"Black Cave";
    curioShop.name = @"Curiositie Shoppe";
    genStore.name = @"General Store";
    graveyard.name = @"Graveyard";
    roadHouse.name = @"Hibb's Roadhouse";
    histSociety.name = @"Historical Society";
    independenceSq.name = @"Independence Square";
    library.name = @"Library";
    boardingHouse.name = @"Ma's Boarding House";
    newspaper.name = @"Newspaper";
    policeStation.name = @"Police Station";
    docks.name = @"River Docks";
    sciBuilding.name = @"Science Building";
    lodge.name = @"Silver Twilight Lodge";
    church.name = @"South Church";
    hospital.name = @"St. Mary's Hospital";
    unnamable.name = @"The Unnamable";
    witchHouse.name = @"The Witch House";
    trainStation.name = @"Train Station";
    isle.name = @"Unvisited Isle";
    diner.name = @"Velma's Diner";
    woods.name = @"Woods";
    magickShop.name = @"Ye Olde Magick Shoppe";
    
    return arkham;
}

#pragma mark - Instance Methods

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

-(void)setLocations:(NSArray *)locations {
    if (_locations != locations){
        _locations = locations;
        for (Location *ownedLoc in _locations){
            ownedLoc.neighborhood = self;
        }
    }
}

-(void)setStreet:(Location *)street {
    if (_street != street){
        _street = street;
        _street.neighborhood = self;
    }
}

-(void)setName:(NSString *)name {
    if (_name != name){
        _name = name;
        if (self.street){
            self.street.name = _name;
        }
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
