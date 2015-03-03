//
//  Monster.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/26/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Monster : NSObject
@property (strong, nonatomic) NSString *name;

@property (nonatomic) NSInteger toughness;
@property (nonatomic) NSInteger combatRating;
@property (nonatomic) NSInteger horrorRating;
@property (nonatomic) NSInteger combatDamage;
@property (nonatomic) NSInteger horrorDamage;

@property (nonatomic) BOOL isFlying;
@property (nonatomic) BOOL canAmbush;
@property (nonatomic) BOOL isEndless;
@property (nonatomic) BOOL physicallyResistant;
@property (nonatomic) BOOL magicallyResistant;
@property (nonatomic) BOOL physicallyImmune;
@property (nonatomic) BOOL magicallyImmune;

@property (nonatomic) NSInteger nightmarishRating;
@property (nonatomic) NSInteger overwhelmingRating;
@end
