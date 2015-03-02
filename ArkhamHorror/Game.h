//
//  Game.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/2/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Investigator.h"
#import "Board.h"

@interface Game : NSObject
@property (strong, nonatomic) Board *board;

@property (strong, nonatomic) Deck *commonsDeck;
@property (strong, nonatomic) Deck *uniquesDeck;
@property (strong, nonatomic) Deck *spellsDeck;
@property (strong, nonatomic) Deck *skillsDeck;
@property (strong, nonatomic) Deck *alliesDeck;

@property (strong, nonatomic) Deck *mythosDeck;

@property (strong, nonatomic) NSMutableArray *players;

+(instancetype)arkhamHorror;

// select ancient one
// setup decks
    // load decks
    // shuffle all
// setup board
// setup players
    // draw items
    // adjust skills

@end
