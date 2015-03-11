//
//  Game.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/2/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Game.h"
#import "Neighborhood.h"
#import "Movable.h"
#import "PathFinder.h"
@interface Game ()
@property (strong, nonatomic) PESGraph *pathFindingGraph;
@end

@implementation Game

static Game *singletonInstance = nil;
+(instancetype)initializeWithSettings:(NSDictionary *)gameSetupDict {
    static dispatch_once_t singletonOnceToken;
    dispatch_once(&singletonOnceToken, ^{
        singletonInstance = [[Game alloc] initWithSettings:gameSetupDict];
    });
    return singletonInstance;
}

+(instancetype)currentGame {
    if (singletonInstance){
        return singletonInstance;
    }
    else {
        NSLog(@"Game is un-initialized!");
    }
    return nil;
}

#pragma mark - UI API comm

-(void)runPhase {
    [self.uiDelegate enqueueDieRollEvent:^(NSUInteger roll) {
        NSLog(@"op 1 callback");
    }];
    [self.uiDelegate enqueueDieRollEvent:^(NSUInteger roll) {
        NSLog(@"op 2 callback");
    }];
}

#pragma mark - init

-(instancetype)initWithSettings:(NSDictionary*)settings {
    self = [super init];
    if (self){
        self.neighborhoods = [Neighborhood arkhamBoard];
        self.pathFindingGraph = [PathFinder setupBoardGraph:self.neighborhoods];
        
        [self setupDecks];
        [self setupMonsterCup];
        self.outskirts = [NSMutableArray new];
        
        self.gateSealCost = 5;
        self.gateDifficultyModifier = 0;
        
        self.investigators = [NSMutableArray new];
        
        NSArray *investigators = settings[@"Investigators"];
        if (investigators){ // load from plist
            Investigator *player = [[Investigator alloc] initWithProperties:investigators[0]];
            [self setupPlayer:player];
        }
        else {
            [self setupPlayer:[Investigator testingInvestigator]];
        }
        
        self.maxMonstersInOutskirts = 8 - self.investigators.count;
        self.maxMonstersInArkham = self.investigators.count + 3;
        
        if (self.investigators.count < 3) { self.maxGatesOpen = 8; } // if this many gates open at the same time, ancient one awakens
        else if (self.investigators.count < 5) { self.maxGatesOpen = 7; }
        else if (self.investigators.count < 7) { self.maxGatesOpen = 6; }
        else  {self.maxGatesOpen = 5;}
    }
    return self;
}

#pragma mark - logging

-(void)logGameInfo {
    NSLog(@"ARKHAM HORROR");
    NSLog(@"Ancient One:");
    NSLog(@"---> %@",self.ancientOne.name);
    NSLog(@"Investigators:");
    for (Investigator *player in self.investigators){
        NSLog(@"---> %@",player.name);
    }
}

#pragma mark - setup

-(void)setupDecks {
    self.commonsDeck = [NSMutableArray new];
    self.uniquesDeck = [NSMutableArray new];
    self.spellsDeck = [NSMutableArray new];
    self.skillsDeck = [NSMutableArray new];
    self.alliesDeck = [NSMutableArray new];
    self.mythosDeck = [NSMutableArray new];
}

-(void)setupMonsterCup {
    self.monsterCup = [NSMutableArray new];
    // TODO load cup with monsters
}

-(void)setupPlayer:(Investigator*)investigator {
    
    for (NSNumber *itemID in investigator.startingItems){ // array of itemIDs (NSUIntegers), draw these specific items from deck
        // add to respective array
        NSLog(@"search for itemID %@",itemID);
    }
    // draw this many cards from the decks
    NSUInteger randomCommons = investigator.startingRandomCommons;
    NSUInteger randomUniques = investigator.startingRandomUniques;
    NSUInteger randomSpells = investigator.startingRandomSpells;
    NSUInteger randomSkills = investigator.startingRandomSkills;
    
    [self draw:randomCommons player:investigator keep:randomCommons deck:self.commonsDeck];
    [self draw:randomUniques player:investigator keep:randomUniques deck:self.uniquesDeck];
    [self draw:randomSpells player:investigator keep:randomSpells deck:self.spellsDeck];
    [self draw:randomSkills player:investigator keep:randomSkills deck:self.skillsDeck];
    
    [self.investigators addObject:investigator];
}

#pragma mark - actions

-(void)incrementTerror {
    self.terrorLevel++;
    // remove random ally from deck
    
    Ally *ally = (Ally*)[self.alliesDeck drawOne];
    [self.removedFromGameDeck addObject:ally];
    
    if (self.terrorLevel == 3){ // close gen store
        [(GeneralStoreLocation*)[self locationNamed:@"General Store"] setIsClosed:YES];
    }
    if (self.terrorLevel == 6){ // close unique store
        [(GeneralStoreLocation*)[self locationNamed:@"Curiositie Shoppe"] setIsClosed:YES];
    }
    if (self.terrorLevel == 9){ // close spell store
        [(GeneralStoreLocation*)[self locationNamed:@"Ye Olde Magick Shoppe"] setIsClosed:YES];
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

-(NSArray*)routeFrom:(Location*)a to:(Location*)b {
    return [PathFinder graph:self.pathFindingGraph routeFrom:a to:b];
}

-(Location*)locationNamed:(NSString*)name {
    for (Neighborhood *hood in self.neighborhoods){
        if ([hood.street.name isEqualToString:name]){
            return hood.street;
        }
        for (Location *loc in hood.locations){
            if ([loc.name isEqualToString:name]){
                return loc;
            }
        }
    }
    return nil;
}

-(void)movable:(Movable*)movable followPath:(NSArray*)path {
    for (Location *loc in path){
        movable.currentLocation = loc;
        NSLog(@"current pos %@",loc);
        // TODO enqueue animation
    }
}

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
