//
//  RumorMythos.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 4/16/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "RumorMythos.h"
#import "Dimension.h"
#import "Game.h"

@implementation RumorMythos
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Rumor Mythos";
        self.mythosType = MythosTypeRumor;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                [Dimension ofType:MonsterDimensionSymbolStar],
                                [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
    }
    return self;
}
-(void)applyRumorEffect:(Game*)game {
    // pass
}
-(void)removeRumorEffect:(Game*)game {
    // pass
}
-(void)ongoingRumorEffect:(Game*)game{
    // pass
}
-(BOOL)didPass {
    return YES;
}
-(BOOL)didFail {
    return NO;
}
@end

#pragma mark - Rumors

@implementation DisturbingTheDeadMythos
/*
 Ongoing Effect: Roll die at end of every Mythos Phase while card in play. On a 1 or 2, increase the +1 terror.
 Pass: If a player discards 2 gate trophies during the Arkham Encounter Phase while in Rivertown streets, Each player draws 1 Spell.
 Fail: If the terror level reaches 10, return this card to the box. Every investigator is Cursed.
 */
-(id)init{
    self = [super init];
    if (self){
        self.name = @"Disturbing the Dead";
        self.gateLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation GoodWorkUndoneMythos
/*
 Setup: Place 6 Clues on card. A player may spend Clues during Arkham Encounter Phase while in Easttown streets to discard Clue tokens from this
 card on a 1-for-1 basis.
 Ongoing Effect: Roll 2 die at end of every Mythos Phase. For every 1 or 2 rolled, place 1 Clue on card.
 Pass: If there are no Clues on this card. Each player draws one unique item.
 Fail: If there are 10 Clues on this card. All elder sign tokens are removed from the board.
 */
-(id)init{
    self = [super init];
    if (self){
        self.name = @"Good Work Undone";
        self.gateLocation = @"Unvisited Isle";
    }
    return self;
}
@end

@implementation GreatRitualMythos
/*
 Ongoing Effect: Cultist,Witch,Warlock,HighPriest +2 toughness while in play. Place 1 clue on this card at end of every Mythos Phase.
 Pass: Single player discards 3 spells (4 if > 4 players) in French Hill streets during Arkham Encounters phase. Each player +2 clues.
 Fail: If 5 Clues on this card: From now on, draw 2 Mythos cards each Mythos Phase. Only open card 1's gate.
 */
-(id)init{
    self = [super init];
    if (self){
        self.name = @"The Great Ritual";
        self.gateLocation = @"Graveyard";
    }
    return self;
}
@end

@implementation SouthsideStranglerStrikesMythos
/*
 Ongoing Effect: Return 1 Ally from deck to box at random at the end of every Mythos Phase while this card is in play.
 Pass: A player discards 5 Clues in Ma's Boarding House during Arkham Encounters Phase. Each player receives a $5.
 Fail: If there are no more Allies in Deck at end of the Mythos Phase, Each player -1 max SAN or -1 max STA (players choice)
 */
-(id)init{
    self = [super init];
    if (self){
        self.name = @"The Southside Strangler Strikes";
        self.gateLocation = @"Independence Square";
    }
    return self;
}
@end

@implementation StarsAreRightMythos
/*
 Ongoing Effect: Roll die at the end of every Mythos Phase while this card is in play. On 1 or 2, +1 doom
 Pass: Any player discards 1 ally in Downtown Street during Arkham Encounter. Each player draws 2 Common Items.
 Fail: If the Ancient One awakens
 */
-(id)init{
    self = [super init];
    if (self){
        self.name = @"The Stars Are Right";
        self.gateLocation = @"Science Building";
    }
    return self;
}
@end

@implementation TerribleExperimentMythos
/*
 Setup: Place 5 monsters on card. A player may fight one or more in Miskatonic U. streets during the Arkham Encounter Phase. If defeated,
 claim as monster trophies. They don't move, aren't considered on the board, and don't count toward monster limit.
 Ongoing Effect: Place a monster on this card at the end of every Mythos Phase.
 Pass: If 0 monsters on this card, return to box. Each player draws 1 Skill.
 Fail: If 8 monsters on this card, return to box. Raise terror to 10, place card's monsters in play in Miskatonic U. streets.
 */
-(id)init{
    self = [super init];
    if (self){
        self.name = @"The Terrible Experiment";
        self.gateLocation = @"Unvisited Isle";
    }
    return self;
}
@end