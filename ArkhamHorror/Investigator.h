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


@end
