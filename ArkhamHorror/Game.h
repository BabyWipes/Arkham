//
//  Game.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Investigator.h"
#import "AncientOne.h"
@interface Game : NSObject
@property (strong, nonatomic) NSMutableArray *investigators;
@property (strong, nonatomic) AncientOne *ancientOne;
@property (nonatomic) NSInteger terrorLevel;
@property (nonatomic) NSInteger monstersInOutskirts;

@property (strong, nonatomic) NSMutableArray *commonItemDeck;
@property (strong, nonatomic) NSMutableArray *uniqueItemDeck;
@property (strong, nonatomic) NSMutableArray *skillDeck;
@property (strong, nonatomic) NSMutableArray *spellDeck;
@property (strong, nonatomic) NSMutableArray *allyDeck;

@property (strong, nonatomic) NSMutableArray *mythosDeck;

@property (strong, nonatomic) NSMutableArray *monsterCup;
@end
