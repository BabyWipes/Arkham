//
//  GameEventDelegate.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/21/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#ifndef ArkhamHorror_GameEventDelegate_h
#define ArkhamHorror_GameEventDelegate_h

@class Game;
@class Monster;
@class Investigator;
@class Ally;

@protocol SkillCheckEventDelegate <NSObject>

-(BOOL)game:(Game*)game shouldMakeSkillCheck:(SkillCheckType)skillCheck investigator:(Investigator*)investigator;
-(void)game:(Game*)game willMakeSkillCheck:(SkillCheckType)skillCheck investigator:(Investigator*)investigator;
-(void)game:(Game*)game didMakeSkillCheck:(SkillCheckType)skillCheck investigator:(Investigator*)investigator;
-(NSInteger)game:(Game*)game skillCheckModifier:(SkillCheckType)skillCheck investigator:(Investigator*)investigator;
-(NSInteger)skillCheck:(SkillCheckType)skillCheck bonusDieForClueFromInvestigator:(Investigator*)investigator;

@end

@protocol CardEventDelegate <NSObject>

-(BOOL)canBeDiscarded;

-(BOOL)shouldBeExhausted;
-(void)wasExhausted;

-(void)wasGivenToInvestigator:(Investigator*)investigator;
-(void)wasTakenFromInvestigator:(Investigator*)investigator;

@end

@protocol GameEventDelegate <NSObject>


/*
 
 ///// Damage
 
 willLoseStamina:(int)amount
 (int)reduceStaminaLoss:(int)incomingDamage // skills which skip damage reduce it to zero
 didLoseStamina:(int)value
 
 willLoseSanity:(int)value
 (int)reduceSanityLoss
 didLoseSanity:(int)value
 
 
 //// Expenses
 
 willGainMoney
 didGainMoney
 
 willSpendMoney
 didSpendMoney:(int)value
 
 willGainClues
 didGainClues
 
 willSpendClues
 didSpendClues:(int)value
 
 willGainGateTrophies
 didGainGateTrophies
 
 willSpendGateTrophies
 didSpendGateTrophies
 
 willGainMonsterTrophies
 didGainMonsterTrophies
 
 willSpendMonsterTrophies
 didSpendMonsterTrophies
 
 willDrawCommonItem
 didDrawCommonItem
 
 willDrawUniqueItem
 didDrawUniqueItem
 
 willDrawSpell
 didDrawSpell
 
 willDrawSkill
 didDrawSkill
 
 willDrawAlly
 didDrawAlly
 
 
 //// Movement
 
 playerWillMove
 playerShouldMove
 playerDidMove
 
 willEnterOtherWorld
 didEnterOtherWorld
 
 willMoveThroughOtheWorld
 didMoveThroughOtherWorld
 
 
 willExitOtherWorld
 didExitOtherWorld
 
 willCloseGate
 didCloseGate
 
 willSealGate
 didSealGate
 
 willBeLostInTimeAndSpace
 didGetLostInTimeAndSpace
 
 ///// Monsters
 monsterWillAppear
 monsterDidAppear
 
 monsterWillMove
 monsterDidMove
 
 ancientOneWillAwaken
 ancientOneDidAwaken
 
 upkeepPhase
 
 willDrawArkhamEncounter
 didDrawArkhamEncounter
 
 willDrawOtherWorldEncounter
 didDrawOtherWorldEncounter
 
*/
@end
#endif
