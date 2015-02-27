//
//  Investigator.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Investigator : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *occupation;
@property (strong, nonatomic) NSString *home;

@property (nonatomic) NSInteger focus;
@property (nonatomic) NSInteger money;
@property (nonatomic) NSInteger clues;

@property (nonatomic) NSInteger maxSanity;
@property (nonatomic) NSInteger maxStamina;
@property (nonatomic) NSInteger sanity;
@property (nonatomic) NSInteger stamina;

@property (nonatomic) NSInteger minSneak;
@property (nonatomic) NSInteger minSpeed;
@property (nonatomic) NSInteger minFight;
@property (nonatomic) NSInteger minWill;
@property (nonatomic) NSInteger minLore;
@property (nonatomic) NSInteger minLuck;

-(NSInteger)speed;
-(NSInteger)sneak;
-(NSInteger)fight;
-(NSInteger)will;
-(NSInteger)lore;
-(NSInteger)luck;

-(void)shiftSpeedUp;
-(void)shiftSneakUp;
-(void)shiftFightUp;
-(void)shiftWillUp;
-(void)shiftLoreUp;
-(void)shiftLuckUp;

@property (nonatomic) NSMutableArray *commonItems;
@property (nonatomic) NSMutableArray *uniqueItems;
@property (nonatomic) NSMutableArray *skills;
@property (nonatomic) NSMutableArray *spells;
@property (nonatomic) NSMutableArray *allies;

@property (nonatomic) BOOL isBlessed;
@property (nonatomic) BOOL isCursed;

@property (nonatomic) BOOL isDelayed;

@property (nonatomic) BOOL hasBankLoan;
@property (nonatomic) BOOL failedBankLoan;

@property (nonatomic) BOOL isDeputy;

@property (nonatomic) BOOL isLodgeMember;

@property (nonatomic) NSInteger retainers;

-(instancetype)initWithProperties:(NSDictionary*)properties;
-(NSString*)skillsString;




/*
 
 INVESTIGATORS
 Name               Occupation      Home                    Sanity	Stamina	Focus
 -------------------------------------------------------------------------------
 Amanda Sharpe      Student         Bank of Arkham          5       5       3
 "Ashcan" Pete      Drifter         River Docks             4       6       1
 Bob Jenkins        Salesman        General Store           4       6       1
 Carolyn Fern       Psychologist	Arkham Asylum           6       4       2
 Darrell Simmons    Photographer	Newspaper               4       6       2
 Dexter Drake       Magician        Ye Olde Magick Shoppe	5       5       2
 Gloria Goldberg    Author          Velma's Diner           6       4       2
 Harvey Walters     Professor       Administration Building 7       3       2
 Jenny Barnes       Dilettante      Train Station           6       4       1
 Joe Diamond        Private Eye     Police Station          4       6       3
 Kate Winthrop      Scientist       Science Building        6       4       1
 Mandy Thompson     Researcher      Library                 5       5       2
 Michael McGlen     Gangster        Ma's Boarding House     3       7       1
 Monterey Jack      Archeologist	Curiositie Shoppe       3       7       2
 Sister Mary        Nun             South Church            7       3       1
 Vincent Lee        Doctor          St. Mary's Hospital     5       5       2
 
 */







@end
