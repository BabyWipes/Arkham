//
//  Ally.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/4/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Ally.h"
#import "Investigator.h"
#import "Game.h"

@interface Ally ()
@end

@implementation Ally
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Ally";
        self.cardType = CardTypeAlly;
    }
    return self;
}

-(void)wasGivenToInvestigator:(Investigator*)investigator {}
-(void)wasTakenFromInvestigator:(Investigator*)investigator {}
-(void)wasExhausted {}
-(BOOL)shouldBeExhausted {
    return NO;
}
-(BOOL)canBeDiscarded {
    return NO;
}

@end

#pragma mark - subclasses


@implementation AllyAnnaKaslow
-(id)init {
    self = [super init];
    if (self){ self.name = @"Anna Kaslow"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    [super wasGivenToInvestigator:investigator];
    investigator.clues += 2;
    investigator.minLuck += 2;
}
@end

@implementation AllyDuke
-(id)init {
    self = [super init];
    if (self){ self.name = @"Duke"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    investigator.maxSanity += 1;
}
-(void)wasTakenFromInvestigator:(Investigator*)investigator {
    investigator.sanity = investigator.maxSanity;
}
-(BOOL)canBeDiscarded {
    return YES;
}
@end

@implementation AllyEricColt
-(id)init {
    self = [super init];
    if (self){ self.name = @"Eric Colt"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    [super wasGivenToInvestigator:investigator];
    investigator.minSpeed += 2;
    investigator.ignoresNightmarish = YES;
}
@end

@implementation AllyJohnLegrasse
-(id)init {
    self = [super init];
    if (self){ self.name = @"John Legrasse"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    [super wasGivenToInvestigator:investigator];
    investigator.minWill += 2;
    investigator.ignoresEndless = YES;
}
@end

@implementation AllyProfessorArmitage
-(id)init {
    self = [super init];
    if (self){ self.name = @"Professor Armitage"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    [super wasGivenToInvestigator:investigator];
    investigator.minLore += 2;
    investigator.ignoresMagicalResistance = YES;
}
@end

@implementation AllyRichardUptonPickman
-(id)init {
    self = [super init];
    if (self){ self.name = @"Richard Upton Pickman"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    [super wasGivenToInvestigator:investigator];
    investigator.minLuck += 1;
    investigator.minSneak += 1;
    investigator.ignoresPhysicalResistance = YES;
}
@end

@implementation AllyRubyStandish
-(id)init {
    self = [super init];
    if (self){ self.name = @"Ruby Standish"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    [super wasGivenToInvestigator:investigator];
    investigator.minSneak += 2;
    // investigator draws 1 unique
}
@end

@implementation AllyRyanDean
-(id)init {
    self = [super init];
    if (self){ self.name = @"Ryan Dean"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    [super wasGivenToInvestigator:investigator];
    investigator.minSneak += 1;
    investigator.minWill += 1;
    // investigator gains 1 common
}
@end

@implementation AllySirWilliamBrinton
-(id)init {
    self = [super init];
    if (self){ self.name = @"Sir William Brinton"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    investigator.maxStamina += 1;
}
-(void)wasTakenFromInvestigator:(Investigator*)investigator {
    investigator.stamina = investigator.maxStamina;
}
-(BOOL)canBeDiscarded {
    return YES;
}
@end

@implementation AllyThomasFMalone
-(id)init {
    self = [super init];
    if (self){ self.name = @"Thoms F. Malone"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    [super wasGivenToInvestigator:investigator];
    investigator.minFight += 1;
    investigator.minLore += 1;
    // investigator gains 1 spell
}
@end

@implementation AllyTomMountainMurphy
-(id)init {
    self = [super init];
    if (self){ self.name = @"Tom \"Mountain\" Murphy"; }
    return self;
}
-(void)wasGivenToInvestigator:(Investigator*)investigator {
    [super wasGivenToInvestigator:investigator];
    investigator.minFight += 2;
    investigator.ignoresOverwhelming = YES;
}
@end
