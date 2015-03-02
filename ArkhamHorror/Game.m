//
//  Game.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/2/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Game.h"

@implementation Game

#pragma mark - setup

+(instancetype)arkhamHorror {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"GameDefaults" ofType:@"plist"];
    NSDictionary* gameDefaults =  [NSDictionary dictionaryWithContentsOfFile:path];
    if (!gameDefaults) {
        NSLog(@"Game Defaults couldn't be found!");
    }
    
    Game *game = [[Game alloc] init];
    game.board = [Board arkhamBoard];
    game.commonsDeck = [[Deck alloc] initWithCardType:CardTypeCommonItem];
    game.uniquesDeck = [[Deck alloc] initWithCardType:CardTypeUniqueItem];
    game.spellsDeck = [[Deck alloc] initWithCardType:CardTypeSpell];
    game.skillsDeck = [[Deck alloc] initWithCardType:CardTypeSkill];
    game.alliesDeck = [[Deck alloc] initWithCardType:CardTypeAlly];
    game.mythosDeck = [[Deck alloc] initWithCardType:CardTypeMythos];
    
    
    NSString *string = [game getInput:@"PROMPT"];
    NSLog(@"RET:%@",string);
    NSInteger integer = [game getInt];
    NSLog(@"RET:%li",integer);
    NSInteger boolVal = [game getBool];
    NSLog(@"RET:%@",boolVal ? @"YES":@"NO");

    NSArray *investigators = gameDefaults[@"Investigators"];
    game.players = [NSMutableArray new];
    
    [game setupPlayer:investigators[0]];
    return game;
    
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
    
    [self.players addObject:investigator];
}

#pragma mark - actions

-(void)adjustSkills:(Investigator*)player unlimited:(BOOL)unlimited{
    int adjustsLeft = player.focus;
    NSLog(@"done adjusting? %i",doneAdjusting);
    
    
    
}


-(void)draw:(NSInteger)drawCount player:(Investigator*)player keep:(NSInteger)keepCount deck:(Deck*)deck{
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
