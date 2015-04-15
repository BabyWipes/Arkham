//
//  Item.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Item.h"

NSUInteger const kItemInfiniteUses = 0;

@implementation Item

#pragma mark - instance methods

-(instancetype)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Item";
        self.cardType = CardTypeCommonItem;
    }
    return self;
}

@end

#pragma mark - subclasses

@implementation WeaponItem
@end
@implementation TomeItem
@end
@implementation HealingItem
@end
@implementation MovementItem
@end
@implementation SkillBonusItem
@end
