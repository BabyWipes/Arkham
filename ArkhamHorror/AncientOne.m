//
//  AncientOne.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "AncientOne.h"
#import "Monster.h"
#import "Game.h"
#import "MonsterSetup.h"

#pragma mark - Prototype

@implementation AncientOne
-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Prototype";
        self.combatRating = 0;
        self.maxDoom = 15;
        self.doomCounter = 0;
        self.attackDifficultyModifier = 1;
        self.physicalResistance = MonsterDamageImmunityNone;
        self.magicalResistance = MonsterDamageImmunityNone;
    }
    return self;
}
-(instancetype)initWithProperties:(NSDictionary*)properties {
    self = [super init];
    if (self){
        self.name = properties[@"name"];
        self.combatRating = [properties[@"combat_rating"] integerValue];
        self.maxDoom = [properties[@"max_doom"] integerValue];
        self.attackDifficultyModifier = [properties[@"attack_difficulty"] integerValue];
        self.physicalResistance = [properties[@"p_resist"] unsignedIntegerValue];
        self.magicalResistance = [properties[@"m_resist"] unsignedIntegerValue];
    }
    return self;
}
-(void)applySetupEffect{
    //pass
}
-(void)buffWorshippers{
    //pass
}
-(void)awaken{
    //pass
}
-(void)attack{
    //pass
}

-(NSDictionary*)exportJSON {
    NSDictionary *exportDict = @{@"name":self.name,
                                 @"combat_rating":@(self.combatRating),
                                 @"max_doom":@(self.maxDoom),
                                 @"attack_difficulty":@(self.attackDifficultyModifier),
                                 @"p_resist":@(self.physicalResistance),
                                 @"m_resist":@(self.magicalResistance)};
    return exportDict;
}
@end

#pragma mark - Azathoth

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

-(void)buffWorshippers {
    for (Monster *monster in [Game currentGame].monsterCup){
        if ([monster.name isEqualToString:@"Maniac"]){
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

#pragma mark - Cthulhu

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
    for (Investigator *investigator in [Game currentGame].investigators){
        investigator.maxSanity--;
        investigator.maxStamina--;
    }
}
-(void)buffWorshippers {
    for (Monster *monster in [Game currentGame].monsterCup){
        if ([monster.name isEqualToString:@"Cultist"]){
            monster.horrorRating = -2;
            monster.horrorDamage = 2;
        }
    }
}

-(void)attack {
    for (Investigator *player in [Game currentGame].investigators){
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

#pragma mark - Hastur

@implementation AncientOneHastur
-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Hastur";
        self.combatRating = 0;// on awaken == game's terror level
        self.maxDoom = 13;
        self.doomCounter = 0;
        self.physicalResistance = MonsterDamageImmunityResist;
    }
    return self;
}
-(void)applySetupEffect{
    [Game currentGame].gateSealCost = 8;
}
-(void)awaken {
    self.combatRating = [Game currentGame].terrorLevel * -1;
}
-(void)buffWorshippers {
    for (Monster *monster in [Game currentGame].monsterCup){
        if ([monster.name isEqualToString:@"Cultist"]){
            monster.movementType = MonsterMovementTypeFlying;
            monster.combatRating = -2;
        }
    }
}
-(void)attack{
    for (Investigator *player in [Game currentGame].investigators){
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

#pragma mark - Ithaqua

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
    [Game currentGame].ignoresWeatherMythos = YES;
    // tell game to inflict 1 sta of damage to every player in street at end of mythos phase
}
-(void)buffWorshippers {
    for (Monster *monster in [Game currentGame].monsterCup){
        if ([monster.name isEqualToString:@"Cultist"]){
            monster.toughness+=2;
        }
    }
}
-(void)awaken{
    // foreach player, foreach item, roll, if fail, discard item
    
}
-(void)attack{
    for (Investigator *player in [Game currentGame].investigators){
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

#pragma mark - Nyarlathotep

@implementation AncientOneNyarlathotep

-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Nyarlathotep";
        self.combatRating = -4;
        self.maxDoom = 11;
        self.doomCounter = 0;
        self.magicalResistance = MonsterDamageImmunityResist;

    }
    return self;
}

-(void)applySetupEffect{
    // add the 5 mask mosnters    ;
    [[Game currentGame].monsterCup addObjectsFromArray:[MonsterSetup arkhamHorrorMaskMonsters]];
}

-(void)attack{
    for (Investigator *player in [Game currentGame].investigators){
        // prompt lore check of self.attackDifficultyModifer
        // on fail, lose 1 clue
        if (player.clues == 0){
            //devoured!
        }
    }
    self.attackDifficultyModifier--;
}
@end

#pragma mark - Shub Niggurath

@implementation AncientOneShubNiggurath

-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Shub-Niggurath";
        self.combatRating = -5;
        self.maxDoom = 12;
        self.doomCounter = 0;
        self.physicalResistance = MonsterDamageImmunityImmune;
    }
    return self;
}

-(void)applySetupEffect{
    for (Monster *monster in [Game currentGame].monsterCup){
        monster.toughness++;
    }
}

-(void)attack{
    for (Investigator *player in [Game currentGame].investigators){
        // prompt sneak check of self.attackDifficultyModifer
        // on fail, lose 1 monsterTrophy
        if (player.monsterTrophies == 0){
            //devoured!
        }
    }
    self.attackDifficultyModifier--;
}
@end

#pragma mark - Yig

@implementation AncientOneYig

-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Yig";
        self.combatRating = -3;
        self.maxDoom = 10;
        self.doomCounter = 0;
    }
    return self;
}

-(void)applySetupEffect{
    // gain 1 doom token when investigator is lost in time and space
}

-(void)attack{
    for (Investigator *player in [Game currentGame].investigators){
        // prompt speed check of self.attackDifficultyModifer
        // on fail lose 1 SAN + 1 STA
        player.sanity--;
        player.stamina--;
        if (player.sanity == 0 || player.stamina == 0){
            //devoured!
        }
    }
    self.attackDifficultyModifier--;
}
@end

#pragma mark - Yog Sothoth

@implementation AncientOneYogSothoth
-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Yog-Sothoth";
        self.combatRating = -5;
        self.maxDoom = 12;
        self.doomCounter = 0;
        self.magicalResistance = MonsterDamageImmunityImmune;
    }
    return self;
}

-(void)applySetupEffect{
    [Game currentGame].gateDifficultyModifier++;
    
    //TODO if player is lost in time+space they are instead devoured
}

-(void)attack{
    for (Investigator *player in [Game currentGame].investigators){
        // prompt will check of self.attackDifficultyModifer
        // on fail, lose 1 gate trophy
        if (player.gateTrophies == 0){
            //devoured!
        }
    }
    self.attackDifficultyModifier--;
}
@end


