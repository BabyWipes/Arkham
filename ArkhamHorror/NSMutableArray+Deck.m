//
//  Deck.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/27/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "NSMutableArray+Deck.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Deck)

-(Card*)drawOne {
    Card *card = nil;
    if (self.count > 0){
        card = self[0];
        [self removeObjectAtIndex:0];
    }
    return card;
}

-(Card*)cardNamed:(NSString*)name {
    Card *targetCard;
    for (Card *card in self){
        if ([card.name isEqualToString:name]){
            targetCard = card;
            break;
        }
    }
    if (targetCard){
        [self removeObject:targetCard];
    }
    return targetCard;
}

-(void)discard:(Card *)card {
    [self addObject:card];
}

-(void)shuffle {
    for (NSUInteger idx = 0; idx < self.count; ++idx) {
        NSInteger remainingCount = self.count - idx;
        NSInteger exchangeIndex = idx + arc4random_uniform((u_int32_t)remainingCount);
        [self exchangeObjectAtIndex:idx withObjectAtIndex:exchangeIndex];
    }
}


@end
