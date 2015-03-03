//
//  AncientOne.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "AncientOne.h"

@implementation AncientOne
-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Prototype";
        self.combatRating = 0;
        self.maxDoom = 15;
        self.doomCounter = 0;
        self.attackDifficultyModifier = 1;
    }
    return self;
}
-(void)applySetupEffect{
    //pass
}
-(void)buffWorshippers:(NSMutableArray*)monsterCup{
    //pass
}
-(void)awaken{
    //pass
}
-(void)attack{
    //pass
}
@end

@implementation AncientOneAzathoth
-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Azathoth";
        self.combatRating = 0;
        self.maxDoom = 14;
        self.doomCounter = 0;
    }
    return self;
}
-(void)applySetupEffect {
    // nothing
}
-(void)buffWorshippers:(NSMutableArray*)monsterCup{
    for (Monster *monster in monsterCup){
        if ([monster isKindOfClass:[Monster class]]){ // TODO maniac
            monster.toughness+=1;
        }
    }
}
-(void)awaken {
    // lose game
}
-(void)attack {
    // lose game
}
@end

@implementation AncientOneCthulhu
-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Cthulhu";
        self.combatRating = -6;
        self.maxDoom = 13;
        self.doomCounter = 0;
    }
    return self;
}
-(void)applySetupEffect {
    // all players max SAN -1, max STA -1
}
-(void)buffWorshippers:(NSMutableArray*)monsterCup{
    for (Monster *monster in monsterCup){
        if ([monster isKindOfClass:[Monster class]]){ // TODO cultist
            monster.horrorRating = -2;
            monster.horrorDamage = 2;
        }
    }
}

-(void)attack {
    NSArray *investigators = @[]; // todo get investigators from game
    for (Investigator *player in investigators){
        // prompt, pick lose 1 max SAN or 1 max STA
        
        player.maxSanity--; // OR
        player.maxStamina--;
        
        if (player.sanity == 0 || player.stamina == 0){
            // devoured!
        }
    }
    
    // heal 1
    if (self.doomCounter < self.maxDoom){
        self.doomCounter++;
    }
}
@end

@implementation AncientOneHastur
-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Hastur";
        // self.combatRating == game's terror level
        self.maxDoom = 13;
        self.doomCounter = 0;
    }
    return self;
}
-(void)applySetupEffect{
    // cost to seal gates = 8 clues;
}
-(void)awaken {
    self.combatRating = 0; // TODO set to Games terror level
}
-(void)buffWorshippers:(NSMutableArray*)monsterCup{
    for (Monster *monster in monsterCup){
        if ([monster isKindOfClass:[Monster class]]){ // TODO cultist
            monster.isFlying = YES;
            monster.combatRating = -2;
        }
    }
}
-(void)attack{
    NSArray *investigators = @[]; // todo get investigators from game
    for (Investigator *player in investigators){
        // prompt luck check of self.attackDifficultyModifer
        // on fail, lose 2 SAN
        player.sanity-=2;
        if (player.sanity <= 0){
            // devoured!
        }
    }
    self.attackDifficultyModifier--;
}
@end

@implementation AncientOneIthaqua
-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Ithaqua";
        self.combatRating = -3;
        self.maxDoom = 11;
        self.doomCounter = 0;
    }
    return self;
}
-(void)applySetupEffect{
    // tell game to ignore all weather effects
    // tell game to inflict 1 sta of damage to every player in street at end of mythos phase
}
-(void)buffWorshippers:(NSMutableArray*)monsterCup{
    for (Monster *monster in monsterCup){
        if ([monster isKindOfClass:[Monster class]]){ // TODO cultist
            monster.toughness+=2;
        }
    }
}
-(void)awaken{
    // foreach player, foreach item, roll, if fail, discard item
 
}
-(void)attack{
    NSArray *investigators = @[]; // todo get investigators from game
    for (Investigator *player in investigators){
        // prompt fight check of self.attackDifficultyModifer
        // on fail, lose 2 STA
        player.stamina-=2;
        if (player.stamina == 0){
            // devoured!
        }
        
    }
    self.attackDifficultyModifier--;
}
@end

@implementation AncientOneNyarlathotep
-(void)attack{
    NSArray *investigators = @[]; // todo get investigators from game
    for (Investigator *player in investigators){
        // prompt lore check of self.attackDifficultyModifer
        // on fail, lose 1 clue
        if (player.clues == 0){
            //devoured@
        }
    }
    self.attackDifficultyModifier--;
}
@end

@implementation AncientOneShubNiggurath
@end

@implementation AncientOneYig
@end

@implementation AncientOneYogSothoth
@end


