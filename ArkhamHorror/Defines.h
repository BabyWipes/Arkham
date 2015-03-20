//
//  Defines.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#ifndef ArkhamHorror_Defines_h
#define ArkhamHorror_Defines_h

typedef NS_ENUM(NSUInteger, SkillCheckType) {
    SkillCheckTypeSpeed,
    SkillCheckTypeSneak,
    SkillCheckTypeEvade,  // == sneak check, some items only affect this
    SkillCheckTypeFight,
    SkillCheckTypeWill,
    SkillCheckTypeCombat, // == fight check, some items only affect this
    SkillCheckTypeHorror, // == will check, some items only affect this
    SkillCheckTypeLore,
    SkillCheckTypeLuck,
    SkillCheckTypeSpell   // == lore check, some items only affect this
};

typedef NS_ENUM(NSUInteger, MonsterMovementType){
    MonsterMovementTypeNormal = 0,
    MonsterMovementTypeStationary,
    MonsterMovementTypeFast,
    MonsterMovementTypeFlying,
    MonsterMovementTypeUnique
};

typedef NS_ENUM(NSUInteger, MonsterDimensionSymbol){
    MonsterDimensionSymbolCircle = 0,
    MonsterDimensionSymbolCrescent,
    MonsterDimensionSymbolTriangle,
    MonsterDimensionSymbolHexagon,
    MonsterDimensionSymbolSquare,
    MonsterDimensionSymbolDiamond,
    MonsterDimensionSymbolStar,
    MonsterDimensionSymbolSlash,
    MonsterDimensionSymbolPlus,
};

typedef NS_ENUM(NSUInteger, MonsterDamageImmunity){
    MonsterDamageImmunityNone = 0,
    MonsterDamageImmunityResist = 1,
    MonsterDamageImmunityImmune = 2,
};

typedef NS_ENUM(NSUInteger, CardType) {
    CardTypeCommonItem,
    CardTypeUniqueItem,
    CardTypeSpell,
    CardTypeSkill,
    CardTypeAlly,
    CardTypeArkhamEncounter,
    CardTypeOtherWorldEncounter,
    CardTypeMythos
};

typedef NS_ENUM(NSUInteger, ItemClassification){
    ItemClassificationNone = 0,
    ItemClassificationPhysicalWeapon,
    ItemClassificationMagicalWeapon,
    ItemClassificationTome
};

typedef NS_ENUM(NSUInteger, MythosType) {
    MythosTypeEnvironmentMystic,
    MythosTypeEnvironmentUrban,
    MythosTypeEnvironmentWeather,
    MythosTypeRumor,
    MythosTypeHeadline,
};

#pragma mark - Game Phases

typedef NS_ENUM(NSUInteger, GamePhase){
    
    GamePhaseNone = 0, // set to trigger failure in runPhase
    
    GamePhaseSetupAncientOne,
    GamePhaseSetupInvestigators,
    
    GamePhaseUpkeepRefresh, // game loop
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
    
    GamePhaseTurnOver // end game loop
};

#pragma mark - Exit Codes

typedef NS_ENUM(NSUInteger, ExitCode){
    ExitCodeNormal = 0, 
    ExitCodeUnknown = 1,
    ExitCodeUnknownGamePhase = 2
};


#endif
