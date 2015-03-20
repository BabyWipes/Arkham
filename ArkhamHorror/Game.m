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
#import "Monster.h"
#import "Macros.h"

#import "MonsterSetup.h"
#import "ItemSetup.h"

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
    NSLog(@"run phase");
    switch (self.currentPhase) {
        case GamePhaseSetupAncientOne: {
            [self pickAncientOne];
            break;
        }
        case GamePhaseSetupInvestigators: {
            [self pickInvestigator];
            break;
        }
        case GamePhaseUpkeepRefresh: {
            [self upkeepRefresh];
            break;
        }
        case GamePhaseUpkeepAction: {
            [self upkeepAction];
            break;
        }
        case GamePhaseUpkeepFocus: {
            [self upkeepFocus];
            break;
        }
        case GamePhaseMovementArkham: {
            [self movementArkham];
            break;
        }
        case GamePhaseMovementOtherWorld: {
            [self movementOtherWorld];
            break;
        }
        case GamePhaseMovementDelayed: {
            [self movementDelayed];
            break;
        }
        case GamePhaseEncounterArkhamGate: {
            [self encounterArkhamGate];
            break;
        }
        case GamePhaseEncounterArkhamNoGate: {
            [self encounterArkhamNoGate];
            break;
        }
        case GamePhaseEncounterOtherWorld: {
            [self encounterOtherWorld];
            break;
        }
        case GamePhaseMythosGatesSpawn: {
            [self mythosGatesSpawn];
            break;
        }
        case GamePhaseMythosPlaceClues: {
            [self mythosPlaceClues];
            break;
        }
        case GamePhaseMythosMoveMonsters: {
            [self mythosMoveMonsters];
            break;
        }
        case GamePhaseMythosEffect: {
            [self mythosEffect];
            break;
        }
        case GamePhaseTurnOver: {
            [self turnOver];
            break;
        }
        case GamePhaseNone: {
            logError(@"GamePhaseNone triggered");
            // investigate failure condition
            self.gameOver = YES;
            break;
        }
        default:
            logError(@"Found unknown game state");
            self.exitCode = ExitCodeUnknownGamePhase;
            self.gameOver = YES;
            break;
    }
}

#pragma mark - init

-(instancetype)initWithSettings:(NSDictionary*)settings {
    self = [super init];
    if (self){
        
        self.exitCode = ExitCodeNormal;
        self.currentPhase = GamePhaseSetupAncientOne;
        self.gameOver = NO;
        
        [self setupBoard];
        [self setupDecks];
        self.monsterCup = [MonsterSetup arkhamHorrorMonsters];
        
        self.outskirts = [NSMutableArray new];
        
        self.gateSealCost = 5;
        self.gateDifficultyModifier = 0;
        
        self.investigators = [NSMutableArray new];
        
        self.maxMonstersInOutskirts = 8 - self.investigators.count;
        self.maxMonstersInArkham = self.investigators.count + 3;
        
        self.maxGatesOpen = 9 - floor(self.investigators.count/2); // if this many gates open at the same time, ancient one awakens
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

-(void)setupBoard {
    self.neighborhoods = [Neighborhood arkhamBoard];
    // wire up neighborhoods
    for (Neighborhood *hoodA in self.neighborhoods){
        for (Neighborhood *hoodB in self.neighborhoods){
            if (hoodA != hoodB){
                if ([hoodA.whiteStreetConnectionName isEqualToString:hoodB.name]){
                    hoodA.whiteStreetConnection = hoodB;
                }
                if ([hoodA.colorlessStreetConnectionName isEqualToString:hoodB.name]){
                    hoodA.colorlessStreetConnection = hoodB;
                }
            }
        }
    }
    self.pathFindingGraph = [PathFinder setupBoardGraph:self.neighborhoods];
}

-(void)setupDecks {
    self.commonsDeck = [ItemSetup arkhamHorrorCommons];
    self.uniquesDeck = [NSMutableArray new];
    self.spellsDeck = [NSMutableArray new];
    self.skillsDeck = [NSMutableArray new];
    self.alliesDeck = [NSMutableArray new];
    self.mythosDeck = [NSMutableArray new];
}

#pragma mark - player interactive setup

-(void)pickAncientOne {
    // pop dialog listing available ancient ones
    // palyer picks ancient one
    [self.uiDelegate enqueueAncientOneSetup:^(NSString *selected) {
        if ([selected isEqualToString:@"Azathoth"]){
            self.ancientOne = [[AncientOneAzathoth alloc] init];
        }
        [self.ancientOne applySetupEffect];
        [self advanceGamePhase];
    }];
}

-(void)pickInvestigator {
    // pop dialog listing availible investigators
    // player picks investgator
    [self.uiDelegate enqueuePlayerSetup:^(NSString *selected, BOOL done) {
        if ([selected isEqualToString:@"Mike"]){
            [self setupPlayer:[Investigator testingInvestigator]];
        }

        if (done){
            [self advanceGamePhase];
        }
    }];    
}

-(void)setupPlayer:(Investigator*)investigator {
    
    for (NSString *itemName in investigator.startingItems){
        // add to respective array
        NSLog(@"search for itemID %@",itemName);
        Card *card = [self.commonsDeck cardNamed:itemName];
        if (card) {
            [investigator.commonItems addObject:card];
        }
        else {
            card = [self.uniquesDeck cardNamed:itemName];
        }
        if (card) {
            [investigator.uniqueItems addObject:card];
        }
        else {
            card = [self.spellsDeck cardNamed:itemName];
        }
        if (card) {
            [investigator.spells addObject:card];
        }
        else {
            card = [self.skillsDeck cardNamed:itemName];
        }
        if (card) {
            [investigator.skills addObject:card];
        }
        else {
            card = [self.alliesDeck cardNamed:itemName];
        }
        if (card) {
            [investigator.allies addObject:card];
        }
        else {
            NSLog(@"Starting item: %@ coudln't be found.",itemName);
            
        }
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

#pragma mark - game phases

-(void)advanceGamePhase {
    self.currentPhase++;
    if (self.currentPhase > GamePhaseTurnOver){
        self.currentPhase = GamePhaseUpkeepRefresh;
    }
}

-(void)advanceCurrentPlayer {
    self.currentPlayerIndex++;
    if (self.currentPlayerIndex == self.investigators.count){
        self.currentPlayerIndex = 0;
    }
}

-(void)upkeepRefresh { // all investigators items, spells, etc refresh
    for (Investigator *investigator in self.investigators){
        for (Item *item in investigator.commonItems){
            item.isExhausted = NO;
        }
        for (Item *item in investigator.uniqueItems){
            item.isExhausted = NO;
        }
        for (Item *item in investigator.spells){
            item.isExhausted = NO;
        }
    }
    [self advanceGamePhase];
}

// player must roll for blessings/curses/retainers, pay bank loans, and deal with any card effects which occur during upkeep.
// investigator abilities that affect upkeep occur now
// players may complete these in any order (IE completing a retainer roll to gain it's profit before paying off a bank loan)
// bank loans, retainers, blessings, and curses are not rolled for during the first upkeep after they are gained, you still get the effect
-(void)upkeepAction {
    
    
    Investigator *currentPlayer = self.investigators[self.currentPlayerIndex];
    
    // TODO - a player may resolve these events in any order
    
    if (currentPlayer.isBlessed){
        if (currentPlayer.blessedSkipRolling){
            currentPlayer.blessedSkipRolling = NO;
        }
        else {
            [self.uiDelegate enqueueDieRollEvent:^(NSUInteger roll) {
                if (roll == 1){ // lost blessing
                    currentPlayer.isBlessed = NO;
                }
            } push:NO];
        }
    }
    
    // CURSES
    if (currentPlayer.isCursed){
        if (currentPlayer.cursedSkipRolling){
            currentPlayer.cursedSkipRolling = NO;
        }
        else {
            [self.uiDelegate enqueueDieRollEvent:^(NSUInteger roll) {
                if (roll == 1){ // lost curse
                    currentPlayer.isCursed = NO;
                }
            } push:NO];
        }
    }
    
    // BANK LOAN
    if (currentPlayer.hasBankLoan){
        if (currentPlayer.bankLoanSkipRolling){
            currentPlayer.bankLoanSkipRolling = NO;
        }
        else {
            // offer chance to pay $10 to remove bank loan
            [self.uiDelegate enqueueDieRollEvent:^(NSUInteger roll) {
                if (roll < 4){
                    // pay $1 or discard all items + can no longer get bank loan
                }
            } push:NO];
        }
    }
    
    // RETAINERS
    if (currentPlayer.retainers > 0){
        // gain $2
        for (int idx = 0; idx < currentPlayer.retainers-currentPlayer.retainersSkipRolling; idx++){
            [self.uiDelegate enqueueDieRollEvent:^(NSUInteger roll) {
                if (roll == 1){ // lose the retainer
                    if (currentPlayer.retainers > 0){
                        currentPlayer.retainers--;
                    }
                }
            } push:NO];
        }
    }
    
    // ITEMS
    // items with upkeep functions happen now
    
    [self advanceCurrentPlayer];
    if (self.currentPlayerIndex == self.firstPlayerIndex){
        // everyone has gone
        [self advanceGamePhase];
    }
}

// players adjust skills based on focus
-(void)upkeepFocus {
    [self advanceGamePhase];
}
-(void)movementArkham {
    [self advanceGamePhase];
}
-(void)movementOtherWorld {
    [self advanceGamePhase];
}
-(void)movementDelayed {
    [self advanceGamePhase];
}
-(void)encounterArkhamNoGate {
    [self advanceGamePhase];
}
-(void)encounterArkhamGate {
    [self advanceGamePhase];
}
-(void)encounterOtherWorld {
    [self advanceGamePhase];
}
-(void)mythosGatesSpawn {
    [self advanceGamePhase];
}
-(void)mythosPlaceClues {
    [self advanceGamePhase];
}
-(void)mythosMoveMonsters {
    [self advanceGamePhase];
}
-(void)mythosEffect {
    [self advanceGamePhase];
}

-(void)turnOver {
    self.firstPlayerIndex++;
    if (self.firstPlayerIndex == self.investigators.count){
        self.firstPlayerIndex = 0;
    }
    [self advanceGamePhase];
}

#pragma mark - actions


-(void)drawHeadline:(Mythos*)headline {
    self.currentMythosHeadline = headline;
    self.currentMythosWhiteDimensions = headline.whiteDimensons;
    self.currentMythosBlackDimensions = headline.blackDimensions;
    
    Location *gateLoc = [self locationNamed:headline.gateLocation];
    Location *clueLoc = [self locationNamed:headline.clueLocation];
    
    [self openGate:gateLoc];
    [self placeClue:clueLoc];
    
    // do headline action
}
-(void)openGate:(Location*)gateLocation {
    
}
-(void)placeClue:(Location*)clueLocation {
    
}

-(void)arrestInvestigator:(Investigator*)investigator {
    investigator.currentLocation = [self locationNamed:@"Police Station"];
    investigator.isDelayed = YES;
    investigator.money = floor(investigator.money/2);
}

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
    
    if (drawnCards.count > keepCount){ // you can only keep some of them
        [self.uiDelegate enqueueSelectionEvent:drawnCards select:keepCount callback:^(NSArray *selected, NSArray *rejected) {
            [player.commonItems addObjectsFromArray:selected];
            for (Card *card in rejected){
                [self.commonsDeck discard:card];
            }
        } push:NO];
    }
    else {
        [player.commonItems addObjectsFromArray:drawnCards];
    }
}

@end
