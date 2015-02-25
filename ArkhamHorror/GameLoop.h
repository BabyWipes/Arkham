//
//  GameLoop.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GamePhase){
    GamePhaseUpkeepRefresh,
    GamePhaseUpkeepAction,
    GamePhaseUpkeepFocus,
    
    GamePhaseMovementArkham,
    GamePhaseMovementOtherWorld,
    GamePhaseMovementDelayed,
    
    GamePhaseEncounterArkhamNoGate,
    GamePhaseEncounterArkhamGate,

    GamePhaseEncounterOtherWorld,
    
    GamePhaseMythosGatesSpawn,
    GamePhaseMythosPlaceClues,
    GamePhaseMythosMoveMonsters,
    GamePhaseMythosEffect,
    
    GamePhasePlayerOnePass
    
};
@interface GameLoop : NSObject
@property (nonatomic) GamePhase currentPhase;
@property (strong, nonatomic) NSMutableArray *phaseEvents;
@end
