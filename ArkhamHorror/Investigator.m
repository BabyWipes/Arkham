//
//  Investigator.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Investigator.h"

@interface Investigator ()
@property (nonatomic) NSInteger speedSneakSlider;
@property (nonatomic) NSInteger fightWillSlider;
@property (nonatomic) NSInteger loreLuckSlider;

@property (nonatomic) int blessingValue;
@end

@implementation Investigator

#pragma mark - Init
-(instancetype)initWithProperties:(NSDictionary*)properties {
    self = [super init];
    if (self){
        self.commonItems = [NSMutableArray new];
        self.uniqueItems = [NSMutableArray new];
        self.skills = [NSMutableArray new];
        self.spells = [NSMutableArray new];
        self.allies = [NSMutableArray new];

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
        
        self.speedSneakSlider = 0;
        self.fightWillSlider = 0;
        self.loreLuckSlider = 0;
        
        NSArray *startingFixedItems = properties[@"fixed_items"]; // array of itemIDs (NSUIntegers), draw these specific items from deck
        
        // draw this many cards from the decks
        NSInteger randomCommons = [properties[@"random_commons"] integerValue];
        NSInteger randomUniques = [properties[@"random_uniques"] integerValue];
        NSInteger randomSkills = [properties[@"random_skills"] integerValue];
        NSInteger randomSpells = [properties[@"random_spells"] integerValue];
        NSInteger randomAllies = [properties[@"random_allies"] integerValue];


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

#pragma mark - Description
-(NSString*)description {
    return [NSString stringWithFormat:@"%@:%@ <%lu>",self.class,self.name,self.hash];
}
-(NSString*)skillsString {
    return [NSString stringWithFormat:@"%@: Sp:%li, Sn:%li, Fi:%li, Wi:%li, Lo:%li, Lu:%li",
            self.name,
            self.speed,self.sneak,
            self.fight,self.will,
            self.lore,self.luck];
}
@end
