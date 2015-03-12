//
//  Investigator.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "NSMutableArray+Deck.h"
#import "Investigator.h"
#import "Game.h"

@interface Investigator ()
@property (nonatomic) NSInteger speedSneakSlider;
@property (nonatomic) NSInteger fightWillSlider;
@property (nonatomic) NSInteger loreLuckSlider;

@property (nonatomic) int blessingValue;
@end

@implementation Investigator

#pragma mark - Class methods

// an overpowered investigator for testing
+(instancetype)testingInvestigator {
    Investigator *merman = [[Investigator alloc] init];
    merman.name = @"Mike Cornell";
    merman.occupation = @"Merman";
    merman.focus = 1;
    merman.money = 10;
    merman.clues = 5;
    merman.maxSanity = 10;
    merman.maxStamina = 10;
    merman.sanity = merman.maxSanity;
    merman.stamina = merman.maxStamina;
    merman.minFight = 5;
    merman.minLore = 5;
    merman.minLuck = 5;
    merman.minSneak = 5;
    merman.minSpeed = 5;
    merman.minWill = 5;
    merman.startingItems = @[@1,@2];
    return merman;
}

#pragma mark - Init

-(instancetype)init {
    self = [super init];
    if (self){
        self.commonItems = [NSMutableArray new];
        self.uniqueItems = [NSMutableArray new];
        self.skills = [NSMutableArray new];
        self.spells = [NSMutableArray new];
        self.allies = [NSMutableArray new];
        
        self.speedSneakSlider = 0;
        self.fightWillSlider = 0;
        self.loreLuckSlider = 0;
    }
    return self;
}
-(instancetype)initWithProperties:(NSDictionary*)properties{
    self = [self init];
    if (self){
        self.name = properties[@"name"];
        self.occupation = properties[@"occupation"];
        
        self.focus = [properties[@"focus"] integerValue];
        self.money = [properties[@"money"] integerValue];
        self.clues = [properties[@"clues"] integerValue];
        
        self.maxSanity = [properties[@"max_sanity"] integerValue];
        self.maxStamina = [properties[@"max_stamina"] integerValue];
        self.sanity = self.maxSanity;
        self.stamina = self.maxStamina;
        
        self.minSpeed = [properties[@"min_speed"] integerValue];
        self.minSneak = [properties[@"min_sneak"] integerValue];
        self.minFight = [properties[@"min_fight"] integerValue];
        self.minWill = [properties[@"min_will"] integerValue];
        self.minLore = [properties[@"min_lore"] integerValue];
        self.minLuck = [properties[@"min_luck"] integerValue];
        
        self.startingItems = properties[@"starting_items"];
        self.startingRandomCommons = [properties[@"starting_random_commons"] unsignedIntegerValue];
        self.startingRandomUniques = [properties[@"starting_random_uniques"] unsignedIntegerValue];
        self.startingRandomSpells = [properties[@"starting_random_spells"] unsignedIntegerValue];
        self.startingRandomSkills = [properties[@"starting_random_skills"] unsignedIntegerValue];

    }
    
    return self;
}

#pragma mark - Upkeep

-(void)upkeep {
        // if blessed or cursed, roll to see if lost
        // if bank loan, pay up or pay out
        // if retainers, gain money, then roll to keep
        // check items with upkeep
}

#pragma mark - Skills
-(NSInteger)speed {
    return self.minSpeed + self.speedSneakSlider;
}
-(NSInteger)sneak {
    return self.minSneak + (3-self.speedSneakSlider);
}
-(NSInteger)fight {
    return self.minFight + self.fightWillSlider;
}
-(NSInteger)will {
    return self.minWill + (3-self.fightWillSlider);
}
-(NSInteger)lore {
    return self.minLore + self.loreLuckSlider;
}
-(NSInteger)luck {
    return self.minLuck + (3-self.loreLuckSlider);
}
-(void)shiftSpeedUp {
    if (self.speedSneakSlider < 4){
        self.speedSneakSlider++;
    }
}
-(void)shiftSneakUp {
    if (self.speedSneakSlider > 0){
        self.speedSneakSlider--;
    }
}
-(void)shiftFightUp {
    if (self.fightWillSlider < 4){
        self.fightWillSlider++;
    }
}
-(void)shiftWillUp {
    if (self.fightWillSlider > 0){
        self.fightWillSlider--;
    }
}
-(void)shiftLoreUp {
    if (self.loreLuckSlider < 4){
        self.loreLuckSlider++;
    }
}
-(void)shiftLuckUp {
    if (self.loreLuckSlider > 0){
        self.loreLuckSlider--;
    }
}

#pragma mark - Blessings and Curses

-(BOOL)isBlessed {
    return (self.blessingValue == 2);
}
-(void)setIsBlessed:(BOOL)isBlessed {
    if (self.blessingValue < 2){
        self.blessingValue++;
    }
}
-(BOOL)isCursed {
    return (self.blessingValue == 0);
}
-(void)setIsCursed:(BOOL)isCursed {
    if (self.blessingValue > 0){
        self.blessingValue--;
    }
}

-(void)setIsLostInTimeAndSpace:(BOOL)isLostInTimeAndSpace {
    if (_isLostInTimeAndSpace != isLostInTimeAndSpace){
        _isLostInTimeAndSpace = isLostInTimeAndSpace;
        if (_isLostInTimeAndSpace){
            self.currentLocation = nil;
            self.isDelayed = YES;
            [[Game currentGame].lostInTimeAndSpace addObject:self];
        }
        else {
            // TODO user picks location or street to move to
        }
    }
}

#pragma mark - Stamina + Sanity

-(void)setMaxSanity:(NSInteger)maxSanity {
    if (_maxSanity != maxSanity){
        _maxSanity = maxSanity;
        if (self.sanity > maxSanity){
            self.sanity = _maxSanity;
        }
    }
}

-(void)setMaxStamina:(NSInteger)maxStamina {
    if (_maxStamina != maxStamina){
        _maxStamina = maxStamina;
        if (self.stamina > maxStamina){
            self.stamina = _maxStamina;
        }
    }
}


#pragma mark - Description
-(NSString*)description {
    return [NSString stringWithFormat:@"%@(%@)",[super description],self.name];
}
-(NSString*)skillsString {
    return [NSString stringWithFormat:@"%@: Sp:%li, Sn:%li, Fi:%li, Wi:%li, Lo:%li, Lu:%li",
            self.name,
            self.speed,self.sneak,
            self.fight,self.will,
            self.lore,self.luck];
}
@end
