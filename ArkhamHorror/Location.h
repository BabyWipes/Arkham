//
//  Location.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Investigator.h"
#import "Neighborhood.h"

// base class, locations with no special encounters are this
@interface Location : NSObject
@property (strong, nonatomic) NSString *name;
@property (nonatomic) BOOL isStable;
@property (nonatomic) BOOL isStreet;
@property (strong, nonatomic) NSMutableArray *investigatorsHere;
@property (strong, nonatomic) NSMutableArray *monstersHere;
@property (weak, nonatomic) Neighborhood *neighborhood;
@property (nonatomic) NSInteger cluesHere;

-(instancetype)initWithStability:(BOOL)isStable;
-(instancetype)initWithProperties:(NSDictionary*)properties;
-(NSDictionary*)exportJSON;
+(instancetype)street;
@end

@interface HealerLocation : Location // asylum and hospital
@property (nonatomic) BOOL healsSanity; // if no, heals stamina
-(instancetype)initWithHealsSanity:(BOOL)healsSanity;
-(void)heal:(Investigator*)player;
-(void)fullHeal:(Investigator*)player;
@end

@interface BankLocation : Location
-(void)getBankLoan:(Investigator*)player;
@end

@interface LodgeLocation : Location
@property (strong, nonatomic) NSMutableArray *innerSanctumLocation;
-(void)innerSanctumEncounter;
@end

#pragma mark - Shops

// spend money, get card of type
@interface GeneralStoreLocation : Location // commons
@property (nonatomic) BOOL isClosed;
-(void)shop:(Investigator*)player;
@end

@interface CurioStoreLocation : Location // uniques
@property (nonatomic) BOOL isClosed;
-(void)shop:(Investigator*)player;
@end

@interface MagickStoreLocation : Location // spells
@property (nonatomic) BOOL isClosed;
-(void)shop:(Investigator*)player;
@end

@interface AdminBuildingLocation : Location // skills
-(void)shop:(Investigator*)player;
@end

#pragma mark - trophy shops

@interface PoliceStationLocation : Location
-(void)tradeMonsterTrophies:(Investigator*)player;
-(void)tradeGateTrophies:(Investigator*)player;
-(void)tradeMixedTrophies:(Investigator*)player;
@end

@interface BoardingHouseLocation : Location
-(void)tradeMonsterTrophies:(Investigator*)player;
-(void)tradeGateTrophies:(Investigator*)player;
-(void)tradeMixedTrophies:(Investigator*)player;
@end

@interface DocksLocation : Location
-(void)tradeMonsterTrophies:(Investigator*)player;
-(void)tradeGateTrophies:(Investigator*)player;
@end

@interface ScienceBuildingLocation : Location
-(void)tradeMonsterTrophies:(Investigator*)player;
-(void)tradeGateTrophies:(Investigator*)player;
@end

@interface ChurchLocation : Location
-(void)tradeMonsterTrophies:(Investigator*)player;
-(void)tradeGateTrophies:(Investigator*)player;
@end


