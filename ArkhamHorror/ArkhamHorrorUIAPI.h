//
//  ArkhamHorrorUIAPI.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/10/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#ifndef ArkhamHorror_ArkhamHorrorUIAPI_h
#define ArkhamHorror_ArkhamHorrorUIAPI_h

@class Game;
@class Card;
@class Investigator;
@class Monster;

typedef void(^AHGameEvent)(Game *game);
typedef void(^AHInvestigatorEvent)(Investigator *investigator);
typedef void(^AHMonsterEvent)(Monster *monster);
typedef void(^AHCardEvent)(Card *card);
typedef void(^AHSelectEvent)(id selection);

@protocol ArkhamHorrorUIAPI <NSObject>
-(void)enqueueGameEvent:(AHGameEvent)callback;
-(void)enqueueSelectionEvent:(NSArray*)selections select:(NSUInteger)select callback:(AHSelectEvent)callback;
-(void)enqueueInvestigatorEvent:(AHInvestigatorEvent)callback;
-(void)enqueueMonsterEvent:(AHMonsterEvent)callback;
-(void)enqueueCardEvent:(AHCardEvent)callback;
@end


#endif
