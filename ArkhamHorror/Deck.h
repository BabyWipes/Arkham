//
//  Deck.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/27/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
@property (nonatomic) CardType cardType;

// returns <keepCount> Card of type <deck.cardType> from a selection of <drawCount> cards
-(Card*)drawOne;

// puts a Card of type <type> to the bottom of the deck
-(void)discard:(Card*)card;

// shuffles deck, only used if a card instructs you to do so, or after an enounter draw if it's a location deck (multicard draws shuffle after all cards drawn)
-(void)shuffle;

-(instancetype)initWithCardType:(CardType)cardType;


@end
