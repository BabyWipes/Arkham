//
//  Deck.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/27/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
@property (strong, nonatomic) NSMutableArray *underlyingArray;
@end

@implementation Deck

-(instancetype)initWithCardType:(CardType)cardType{
    self = [super init];
    if (self){
        self.cardType = cardType;
        self.underlyingArray = [NSMutableArray new];
    }
    return self;
}

-(Card*)drawOne {
    Card *card = nil;
    if (self.underlyingArray.count > 0){
        card = self.underlyingArray[0];
        [self.underlyingArray removeObjectAtIndex:0];
    }
    return card;
}

-(void)discard:(Card *)card {
    [self.underlyingArray addObject:card];
}

-(void)shuffle {
    NSUInteger count = [self.underlyingArray count];
    for (NSUInteger idx = 0; idx < count; ++idx) {
        NSInteger remainingCount = count - idx;
        NSInteger exchangeIndex = idx + arc4random_uniform((u_int32_t)remainingCount);
        [self.underlyingArray exchangeObjectAtIndex:idx withObjectAtIndex:exchangeIndex];
    }
}


@end
