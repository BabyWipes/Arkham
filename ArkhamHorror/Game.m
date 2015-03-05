//
//  Game.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/2/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Game.h"

@implementation Game

+(instancetype)currentGame {
    static Game *instance = nil;
    static dispatch_once_t singletonOnceToken;
    dispatch_once(&singletonOnceToken, ^{
        instance = [[Game alloc] initArkhamHorror];
    });
    return instance;
}

#pragma mark - setup

-(instancetype)initArkhamHorror {
    self = [super init];
    if (self){
        
        NSString* path = [[NSBundle mainBundle] pathForResource:@"GameDefaults" ofType:@"plist"];
        NSDictionary* gameDefaults =  [NSDictionary dictionaryWithContentsOfFile:path];
        
        if (!gameDefaults) {
            NSLog(@"Game Defaults couldn't be found!");
        }
        
        self.board = [Board arkhamBoard];
        self.commonsDeck = [NSMutableArray new];
        self.uniquesDeck = [NSMutableArray new];
        self.spellsDeck = [NSMutableArray new];
        self.skillsDeck = [NSMutableArray new];
        self.alliesDeck = [NSMutableArray new];
        self.mythosDeck = [NSMutableArray new];
        
        [self setupMonsterCup];
        self.outskirts = [NSMutableArray new];
        
        self.gateSealCost = 5;
        self.gateDifficultyModifier = 0;
        
        
        NSArray *investigators = gameDefaults[@"Investigators"];
        self.investigators = [NSMutableArray new];
        [self setupPlayer:investigators[0]];
        
        self.maxMonstersInOutskirts = 8 - self.investigators.count;
        self.maxMonstersInArkham = self.investigators.count + 3;
        
        if (self.investigators.count < 3) { self.maxGatesOpen = 8; } // if this many gates open at the same time, ancient one awakens
        else if (self.investigators.count < 5) { self.maxGatesOpen = 7; }
        else if (self.investigators.count < 7) { self.maxGatesOpen = 6; }
        else  {self.maxGatesOpen = 5;}
    }
    return self;
    
}

-(void)setupMonsterCup {
    self.monsterCup = [NSMutableArray new];
    
}

-(void)incrementTerror {
    self.terrorLevel++;
    // remove random ally from deck
    
    Ally *ally = (Ally*)[self.alliesDeck drawOne];
    [self.removedFromGameDeck addObject:ally];
    
    if (self.terrorLevel == 3){
        // close gen store
    }
    if (self.terrorLevel == 6){
        // close unique store
    }
    if (self.terrorLevel == 9){
        // close spell store
    }
    if (self.terrorLevel == 10){ // overrun!
        self.arkhamIsOverrun = YES;
        [self.monsterCup addObjectsFromArray:self.outskirts];
        [self.outskirts removeAllObjects];
        self.ancientOne.doomCounter++;
    }
}

-(void)addMonsterToOutskirts:(Monster*)monster {
    if (!self.arkhamIsOverrun){
        [self.outskirts addObject:monster];
        if (self.outskirts.count == self.maxMonstersInOutskirts){
            [self.monsterCup addObjectsFromArray:self.outskirts];
            [self.outskirts removeAllObjects];
            [self incrementTerror];
        }
    }
    else {
        // arkham is overrun, you shouldn't be adding mosnters to outskirts
    }
}

-(void)setupPlayer:(NSDictionary*)playerDict {
    Investigator *investigator = [[Investigator alloc] initWithProperties:playerDict];
    
    NSArray *startingFixedItems = playerDict[@"fixed_items"]; // array of itemIDs (NSUIntegers), draw these specific items from deck
    for (NSNumber *itemID in startingFixedItems){
        // add to respective array
        NSLog(@"search for itemID %@",itemID);
    }
    // draw this many cards from the decks
    NSInteger randomCommons = [playerDict[@"random_commons"] integerValue];
    NSInteger randomUniques = [playerDict[@"random_uniques"] integerValue];
    NSInteger randomSkills = [playerDict[@"random_skills"] integerValue];
    NSInteger randomSpells = [playerDict[@"random_spells"] integerValue];
    
    [self draw:randomCommons player:investigator keep:randomCommons deck:self.commonsDeck];
    [self draw:randomUniques player:investigator keep:randomUniques deck:self.uniquesDeck];
    [self draw:randomSpells player:investigator keep:randomSpells deck:self.spellsDeck];
    [self draw:randomSkills player:investigator keep:randomSkills deck:self.skillsDeck];
    
    [self.investigators addObject:investigator];
}

#pragma mark - actions

-(void)adjustSkills:(Investigator*)player unlimited:(BOOL)unlimited{
    int adjustsLeft = (int)player.focus;
    adjustsLeft = 0;
    
}


-(void)draw:(NSInteger)drawCount player:(Investigator*)player keep:(NSInteger)keepCount deck:(NSMutableArray*)deck{
    if (keepCount > drawCount){
        NSLog(@"You can't keep more cards than you draw! dummy");
        return;
    }
    
    NSMutableArray *drawnCards = [NSMutableArray new];
    for (int idx = 0; idx < drawCount; idx++){
        [drawnCards addObject:[deck drawOne]];
    }
    
    // review drawn cards in drawCards, select and place into own hand
    // [deck discard:card] on each card which isn't kept
    
}

@end
