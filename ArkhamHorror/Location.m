//
//  Location.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Location.h"



@implementation Location

+(instancetype)street {
    Location *street = [[Location alloc] init];
    street.name = @"Street";
    street.isStreet = YES;
    return street;
}

-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Location";
        self.isStreet = NO;
        self.isStable = YES;
        self.investigatorsHere = [NSMutableArray new];
        self.monstersHere = [NSMutableArray new];
    }
    return self;
}

-(instancetype)initWithStability:(BOOL)isStable{
    self = [self init];
    if (self){
        self.isStable = isStable;
    }
    return self;
}
-(instancetype)initWithProperties:(NSDictionary *)properties {
    self = [self init];
    if (self){
        self.name = properties[@"name"];
        self.isStable = [properties[@"stable"] boolValue];
    }
    return self;
}
-(NSDictionary*)exportJSON {
    NSDictionary *exportDict = @{@"name":self.name,
                                 @"stable":@(self.isStable)};
    return exportDict;
}
@end

@implementation GeneralStoreLocation

-(void)shop:(Investigator*)player {
    // draw 3 common, buy 1 at item cost, discard rest
}

@end

@implementation CurioStoreLocation

-(void)shop:(Investigator *)player {
    // draw 3 unique, buy 1 at item cost, discard rest
}

@end

@implementation MagickStoreLocation

-(void)shop:(Investigator*)player {
    if (player.money >= 5){
        player.money -= 5;
        // draw 2 spell, keep 1, discard rest
    }
}

@end

@implementation AdminBuildingLocation

-(void)shop:(Investigator *)player {
    if (player.money >= 8){
        player.money -= 8;
        // draw 2 skill, keep 1, discard rest
    }
}

@end

@implementation PoliceStationLocation

-(void)tradeGateTrophies:(Investigator *)player {
    // if deputy hasnt been assigned yet this game
    // spend 2 gate trophies
    // player is deputy, gets deputies gun and patrol car items
}
-(void)tradeMixedTrophies:(Investigator *)player {
    // if deputy hasnt been assigned yet this game
    // spend 1 gate trophy and 5 toughness worth of monster trophies
    // player is deputy, gets deputies gun and patrol car items
}
-(void)tradeMonsterTrophies:(Investigator *)player {
    // if deputy hasnt been assigned yet this game
    // spend 10 toughness worth of monster trophies
    // player is deputy, gets deputies gun and patrol car items
}

@end

@implementation BoardingHouseLocation

-(void)tradeGateTrophies:(Investigator *)player {
    // spend 2 gate trophies
    // draw ally of choice
}
-(void)tradeMixedTrophies:(Investigator *)player {
    // spend 1 gate trophy and 5 toughness worth of monster trophies
    // draw ally (of choice?)
}
-(void)tradeMonsterTrophies:(Investigator *)player {
    // spend 10 toughness worth of monster trophies
    // draw ally (of choice?)
}

@end

@implementation DocksLocation

-(void)tradeGateTrophies:(Investigator *)player {
    // spend 1 gate trophy
    player.money += 5;
}

-(void)tradeMonsterTrophies:(Investigator *)player {
    // spend 5 toughness worth of monster trophies
    player.money += 5;
}

@end

@implementation ScienceBuildingLocation

-(void)tradeGateTrophies:(Investigator *)player {
    // spend 1 gate trophy
    player.clues += 2;
}

-(void)tradeMonsterTrophies:(Investigator *)player {
    // spend 5 toughness worth of monster trophies
    player.clues += 2;
}

@end

@implementation ChurchLocation

-(void)tradeGateTrophies:(Investigator *)player {
    // spend 1 gate trophy
    player.isBlessed = YES;
}

-(void)tradeMonsterTrophies:(Investigator *)player {
    // spend 5 toughness worth of monster trophies
    player.isBlessed = YES;
}

@end


@implementation HealerLocation

-(instancetype)initWithHealsSanity:(BOOL)healsSanity {
    self = [super initWithStability:YES];
    if (self){
        self.healsSanity = healsSanity;
    }
    return self;
}

-(void)heal:(Investigator*)player {
    if (self.healsSanity){
        if (player.sanity < player.maxSanity){
            player.sanity++;
        }
    }
    else {
        if (player.stamina < player.maxStamina){
            player.stamina++;
        }
    }
}
-(void)fullHeal:(Investigator *)player {
    if (self.healsSanity){
        if (player.sanity < player.maxSanity && player.money > 2){
            player.money -= 2;
            player.sanity = player.maxSanity;
        }
    }
    else {
        if (player.stamina < player.maxStamina && player.money > 2){
            player.money -= 2;
            player.stamina = player.maxStamina;
        }
    }
}

@end

@implementation BankLocation

-(void)getBankLoan:(Investigator*)player {
    if (!player.hasBankLoan && !player.failedBankLoan){
        player.hasBankLoan = YES;
        player.money += 10;
    }
}

@end

@implementation LodgeLocation

-(void)innerSanctumEncounter {
    // manditory? choice? wiki and rules conflict
}

#pragma mark - Description
-(NSString*)description {
    return [NSString stringWithFormat:@"%@(%@)",[super description],self.name];
}

@end
