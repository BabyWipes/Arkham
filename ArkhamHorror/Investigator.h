//
//  Investigator.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Game.h"

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

// initialize a player with predefined properties
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
 
 
 INVESTIGATORS, RANDOM ITEM COUNTS
 Name               Common  Unique  Skill   Spell   Allies
 ---------------------------------------------------------
 Amanda Sharpe      1       1       2       1       0
 "Ashcan" Pete      1       1       1       0       0
 Bob Jenkins        2       2       1       0       0
 Carolyn Fern       2       2       1       0       0
 Darrell Simmons    1       2       1       0       0
 Dexter Drake       1       1       1       2       0
 Gloria Goldberg    2       0       1       2       0
 Harvey Walters     0       2       1       2       0
 Jenny Barnes       2       1       1       1       0
 Joe Diamond        2       0       1       0       0
 Kate Winthrop      1       1       1       2       0
 Mandy Thompson     2       1       1       0       0
 Michael McGlen     0       1       1       0       0
 Monterey Jack      0       2       1       0       0
 Sister Mary        0       0       1       2       0
 Vincent Lee        2       0       1       2       0
 
 INVESTIGATORS, MIN SKILLS
 Name               Speed   Sneak   Fight   Will    Lore    Luck
 ---------------------------------------------------------------
 Amanda Sharpe      1       1       1       1       1       1
 "Ashcan" Pete      0       3       2       2       0       0
 Bob Jenkins        2       0       1       3       0       1
 Carolyn Fern       0       0       1       1       2       2
 Darrell Simmons    2       0       2       1       0       1
 Dexter Drake       2       1       1       0       2       0
 Gloria Goldberg    1       0       0       2       1       2
 Harvey Walters     0       2       0       0       3       1
 Jenny Barnes       0       1       1       2       1       2
 Joe Diamond        3       1       2       0       0       0
 Kate Winthrop      1       2       1       0       2       1
 Mandy Thompson     1       2       0       2       1       0
 Michael McGlen     2       1       3       1       0       0
 Monterey Jack      1       0       2       0       1       2
 Sister Mary        1       1       0       1       1       3
 Vincent Lee        0       2       0       1       2       1
 
 INVESTIGATORS, FIXED ITEMS
 Name               Money   Clues   Items
 --------------------------------------------
 Amanda Sharpe      1       1       None
 "Ashcan" Pete      1       3       Duke (Ally)
 Bob Jenkins        9       0       None
 Carolyn Fern       7       1       None
 Darrell Simmons    4       1       Retainer (Special)
 Dexter Drake       5       0       Shrivelling (Spell)
 Gloria Goldberg    7       2       None
 Harvey Walters     5       1       None
 Jenny Barnes       10      0       None
 Joe Diamond        8       3       .45 Automatic (Common)
 Kate Winthrop      7       2       None
 Mandy Thompson     6       4       None
 Michael McGlen     8       0       Dynamite (Common), Tommy Gun (Common)
 Monterey Jack      7       1       Bullwhip (Common), .38 Revolver (Common)
 Sister Mary        0       0       Blessing (Special), Cross (Common) Holy Water (Unique)
 Vincent Lee        9       1       None
 
 INVESTIGATORS, ABILITIES
 Name               Abilities
 --------------------------------------------
 Amanda Sharpe      On any skill deck draw, draw 1 extra, discard 1 among the drawn
 "Ashcan" Pete      May draw from top or bottom of Common, Unique, and Spell deck; may look at bottom of those decks at any time
 Bob Jenkins        On any common deck draw, draw 1 extra, discard 1 among the drawn
 Carolyn Fern       During upkeep, heal self or 1 investigator in location 1 sanity, cannot exceed max
 Darrell Simmons    When in Arkham, draws 2 location encounters, plays 1 of choice, doesnt apply to other worlds
 Dexter Drake       On any spell deck draw, draw 1 extra, discard 1 among the drawn
 Gloria Goldberg    When in Other World, draws 2 location encounters matching other world symbol, plays 1 of choice, doesnt apply to arkham
 Harvey Walters     reduces all Sanity losses he suffers by 1, to a minimum of 0
 Jenny Barnes       During upkeep, gain 1$
 Joe Diamond        rolls one extra bonus die when he spends a Clue token to add to a roll.
 Kate Winthrop      Gates+monsters cant appear in her location. Existing gates+monsters stay, monsters can move normally. Dont put clue token in SciBuilding on setup
 Mandy Thompson     Once per turn, any investigator (including herself) re-rolls all non success die in a skill check
 Michael McGlen     reduces all Stamina losses he suffers by 1, to a minimum of 0.
 Monterey Jack      On any unique deck draw, draw 1 extra, discard 1 among the drawn
 Sister Mary        is never Lost in Time and Space. Instead, if Sanity is 0, returns to Asylum. If Stamina is 0, returns to Hospital. else, returns to Church
 Vincent Lee        During upkeep, heal self or 1 investigator in location 1 stamina, cannot exceed max
 
 Amanda onSkillDraw, drawCount+1, discardCount+1
 */


@end
