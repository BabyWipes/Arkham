//
//  EnvironmentMythos.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 4/16/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "EnvironmentMythos.h"
#import "Game.h"
#import "Dimension.h"

@implementation EnvironmentMythos
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Environment Mythos";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolDiamond],
                                [Dimension ofType:MonsterDimensionSymbolSquare]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCircle]];
    }
    return self;
}
-(void)applyEnvironmentEffect:(Game *)game {
    // pass
}
-(void)removeEnvironmentEffect:(Game *)game {
    // pass
}
@end

#pragma mark - Urban Environments

@implementation AlienTechnologyMythos
// Mi-Go +2 toughness, +1 unique item reward from migo for passing combat check
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Alien Technology";
        self.mythosType = MythosTypeEnvironmentUrban;
        self.gateLocation = @"Unvisited Isle";
        self.clueLocation = @"Science Building";
    }
    return self;
}

@end

@implementation CurfewEnforcedMythos
// If end movement in street must pass a Will (+0) check or be arrested and taken to the Police Station
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Curfew Enforced";
        self.mythosType = MythosTypeEnvironmentUrban;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"Unvisited Isle";
        self.clueLocation = @"Science Building";
    }
    return self;
}
@end

@implementation DrakesCarnivalMythos
//  If end movement in the Northside street, +1 Clue, must pass  Will(-1) check or lose 1 SAN
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Drake's Carnival Arrives";
        self.mythosType = MythosTypeEnvironmentUrban;
        self.gateLocation = @"The Unnamable";
        self.clueLocation = @"Woods";
    }
    return self;
}
@end

@implementation EgyptianExhibitMythos
// If end movement in Miskatonic U. street, may make Lore(-1) check. is pass, +1 clue
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Egyptian Exhibit Visits Miskatonic U.";
        self.mythosType = MythosTypeEnvironmentUrban;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation EstateSaleMythos
//  If end movement in Uptown street, may draw 2 unique items and buy 0,1, or 2 of the at cost. discard those not bought
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Estate Sale";
        self.mythosType = MythosTypeEnvironmentUrban;
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation HappyDaysMythos
// Terror can not increase
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Happy Days Are Here Again";
        self.mythosType = MythosTypeEnvironmentUrban;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolDiamond],
                                [Dimension ofType:MonsterDimensionSymbolSquare],
                                [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCircle]];
        self.gateLocation = @"Woods";
        self.clueLocation = @"Historical Society";
    }
    return self;
}
@end

@implementation TheFestivalMythos
// Cultists, Byakhees +1 toughness
-(id)init {
    self = [super init];
    if (self){
        self.name = @"The Festival";
        self.mythosType = MythosTypeEnvironmentUrban;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"Woods";
        self.clueLocation = @"Historical Society";
    }
    return self;
}
@end

#pragma mark - Weather Environments

@implementation EvilFogMythos
// Will checks -1, Sneak checks +1, fliers do not move
-(id)init {
    self = [super init];
    if (self){
        self.name = @"An Evil Fog";
        self.mythosType = MythosTypeEnvironmentWeather;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"Graveyard";
        self.clueLocation = @"Unvisited Isle";
    }
    return self;
}
@end

@implementation HeatWaveMythos
// Fight checks -1, Lore checks +1, Fire Vampies +1 toughness
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Heat Wave";
        self.mythosType = MythosTypeEnvironmentWeather;
        self.gateLocation = @"Woods";
        self.clueLocation = @"Independence Square";
    }
    return self;
}
@end

@implementation IcyConditionsMythos
// -1 move, Fast Monsters move like normal monsters
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Icy Conditions";
        self.mythosType = MythosTypeEnvironmentWeather;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"Historical Society";
        self.clueLocation = @"Silver Twilight Lodge";
    }
    return self;
}
@end

@implementation RainingCatsAndDogsMythos
// Speed checks -1, -1 move, Sneak checks +1. Fire Vampire leaves play to cup, if drawn, ignore, draw again
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Raining Cats and Dogs";
        self.mythosType = MythosTypeEnvironmentWeather;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"Hibb's Roadhouse";
        self.clueLocation = @"Independence Square";
    }
    return self;
}
@end

@implementation SunnyAndClearMythos
// Sneak Checks -1, Will checks +1, Hunter in Darkness leaves play to cup, if drawn, ignore, draw again
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Sunny and Clear";
        self.mythosType = MythosTypeEnvironmentWeather;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"Black Cave";
        self.clueLocation = @"Hibb's Roadhouse";
    }
    return self;
}
@end

#pragma mark - Mystic environments

@implementation StrangePlaugeMythos
// Players can not gain STA except from Hospital or Vincent Lee
-(id)init {
    self = [super init];
    if (self){
        self.name = @"A Strange Plague";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.gateLocation = @"Independence Square";
        self.clueLocation = @"The Unnamable";
    }
    return self;
}
@end

@implementation BlackestNightMythos
// Luck checks -1, Sneak checks +1, Haunter of Night combat rating == -5
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Blackest Night";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.gateLocation = @"Black Cave";
        self.clueLocation = @"Hibb's Roadhouse";
    }
    return self;
}
@end

@implementation BloodMagicMythos
// If end move in Rivertown streets may roll die == current STA; foreach fail, lose 1 STA. If 0 STA, devoured. else +3 Clues
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Blood Magic";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.gateLocation = @"Independence Square";
        self.clueLocation = @"The Unnamable";
    }
    return self;
}
@end

@implementation DreamsOfSunkenCityMythos
// Players can not gain SAN except from Asylum or Carolyn Fern
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Dreams of a Sunken City";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"Independence Square";
        self.clueLocation = @"The Unnamable";
    }
    return self;
}
@end

@implementation NoOneCanHelpMythos
// Can not seal gates (can still close gates)
-(id)init {
    self = [super init];
    if (self){
        self.name = @"No One Can Help You Now";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"The Unnamable";
        self.clueLocation = @"Woods";
    }
    return self;
}
@end

@implementation NodensFavorMythos
// Cost to seal gates -2 clues
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Noden's Favor";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                [Dimension ofType:MonsterDimensionSymbolStar],
                                [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation PlanetaryAlignmentMythos
// All spells SAN cost is 0
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Planetary Alignment";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation RlyehRisingMythos
// Star Spawn, Maniacs toughness +1. difficulty to seal or close gates to R'lyeh +1
-(id)init {
    self = [super init];
    if (self){
        self.name = @"R'lyeh Rising";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                [Dimension ofType:MonsterDimensionSymbolStar],
                                [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.gateLocation = @"Woods";
        self.clueLocation = @"Historical Society";
    }
    return self;
}
@end

@implementation SolarEclipseMythos
// No spells may be cast
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Solar Eclipse";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.gateLocation = @"Graveyard";
        self.clueLocation = @"Unvisited Isle";
    }
    return self;
}
@end

@implementation ChillOfTheGraveMythos
// Undead monsters toughness +1
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Chill of the Grave";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"Unvisited Isle";
        self.clueLocation = @"Science Building";
    }
    return self;
}
@end

@implementation ManInBlackMythos
// If end movement in FrenchHill st. may roll die = to SAN. foreach fail, the -1 SAN. If 0 SAN, devoured. Else, +1 Clue, +1 Spell
-(id)init {
    self = [super init];
    if (self){
        self.name = @"The Man In Black";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation ThingsOfDarknessMythos
// Ghoul, FormlessSpawn, Shoggoth, FlyingPolyp +1 toughness
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Things of Darkness";
        self.mythosType = MythosTypeEnvironmentMystic;
        self.gateLocation = @"Silver Twilight Lodge";
        self.clueLocation = @"Graveyard";
    }
    return self;
}
@end

