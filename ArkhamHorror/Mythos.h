//
//  Mythos.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "GameEventDelegate.h"

@interface Mythos : Card
@property (strong, nonatomic) NSArray *whiteDimensions;
@property (strong, nonatomic) NSArray *blackDimensions;
@property (strong, nonatomic) NSString *gateLocation;
@property (strong, nonatomic) NSString *clueLocation;
@property (nonatomic) MythosType mythosType;
@end

// discard this card, shuffle mythos deck, redrawn mythos
@interface TheStoryContinuesMythos : Mythos
@end

/*
 
 Environment
 Only 1 Environment may be in play at once. The effects of Environment cards stay in play until another Environment is drawn, regardless of subtype.
 If a new Environment card is drawn and resolved, all its effects take place during the Mythos phase (gate, monster, clue, monster movement) and upon resolving
 the new card's text, the old Environment is discarded.
 
 Headline
 A Headline Mythos card, the most common type, gives a one-time effect, which may be beneficial, harmful, or neutral.
 Carry out the instructions on the card under the flavor text.
 Once this is done and the rest of the Mythos Phase is complete, discard the card to the bottom of the Mythos deck unless it directs you otherwise.
 
 Rumor
 A Rumor Mythos card has an ongoing effect (similar to an Environment card), a Pass condition and result,
 and a Fail condition and result (which is usually highly detrimental.)  Each turn the Rumor card continues in effect, its ongoing effect applies.
 If the Pass condition is ever met, usually requiring some action by the investigators, the result specified takes place and the rumor is discarded.
 If the Fail condition is ever met, the result specified takes place and the rumor is discarded. While the Rumor card is in play, a second
 Rumor card can not enter play. If another Rumor card is drawn and resolved, all its other effects take place during the Mythos
 phase (gate, monster, clue, monster movement) but the second card's Rumor text itself is ignored.
 
 
 Dimension Key
 -------------
 C = Crescent
 + = Plus
 [] = Square
 <> = Diamond
 * = Star
 / = Slash
 O = Circle
 ^ = Triangle
 H = Hexagon
 
*/

