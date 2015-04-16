//
//  EnvironmentMythos.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 4/16/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Mythos.h"

@interface EnvironmentMythos : Mythos
-(void)applyEnvironmentEffect:(Game*)game;
-(void)removeEnvironmentEffect:(Game*)game;
@end

/* 
 
 ENVIRONMENTS, URBAN
 Name                                   Gate location           Clue Location       WhiteDim    BlackDim
 -------------------------------------------------------------------------------------------------------
 Alien Technology                       Unvisited Isle          Science Building    <>,[]       O
 Curfew Enforced                        Unvisited Isle          Science Building    +           C
 Drake's Carnival Arrives               The Unnamable           Woods               <>,[]       O
 Egyptian Exhibit Visits Miskatonic U.	The Witch House         Black Cave          +           C
 Estate Sale                            The Witch House         Black Cave          <>,[]       O
 Happy Days are Here Again              Woods                   Historical Society  <>,[],^     O
 The Festival                           Woods                   Historical Society  +           C
 
 ENVIRONMENT, URBAN EFFECTS
 Name                                   Effect
 ---------------------------------------------
 Alien Technology                       Mi-Go +2 toughness, +1 unique item reward for passing combat check
 Curfew Enforced                        If end movement in street must pass a Will (+0) check or be arrested and taken to the Police Station
 Drake's Carnival Arrives               If end movement in the Northside street, +1 Clue, must pass  Will(-1) check or lose 1 SAN
 Egyptian Exhibit Visits Miskatonic U.  If end movement in Miskatonic U. street, may make Lore(-1) check. is pass, +1 clue
 Estate Sale                            If end movement in Uptown street, may draw 2 unique items and buy 0,1,or 2 of the at cost. discard those not bought
 Happy Days are Here Again              Terror can not increase
 The Festival                           Cultists, Byakhees +1 toughness
 
 
 
 
 ENVIRONMENTS, WEATHER
 Name                       Gate location           Clue Location           WhiteDim    BlackDim
 -------------------------------------------------------------------------------------------------------
 An Evil Fog                Graveyard               Unvisited Isle          +           C
 Heat Wave                  Woods                   Independence Square     <>,[]       O
 Icy Conditions             Historical Society      Silver Twilight Lodge   +           C
 Raining Cats and Dogs      Hibb's Roadhouse        Independence Square     +           C
 Sunny and Clear            Black Cave              Hibb's Roadhouse        +           C
 
 Note - Weather Effects only apply while in Arkham, not Other Worlds or map expansions
 
 ENVIRONMENT, WEATHER EFFECTS
 Name                       Effect
 -----------------------------------------
 An Evil Fog                Will checks -1, Sneak checks +1, fliers do not move
 Heat Wave                  Fight checks -1, Lore checks +1, Fire Vampies +1 toughness
 Icy Conditions             -1 move, Fast Monsters move like normal monsters
 Raining Cats and Dogs      Speed checks -1, -1 move, Sneak checks +1. Fire Vampire leaves play to cup, if drawn, ignore, draw again
 Sunny and Clear            Sneak Checks -1, Will checks +1, Hunter in Darkness leaves play to cup, if drawn, ignore, draw again
 
 
 
 ENVIRONMENTS, MYSTIC
 Name                       Gate location           Clue Location       WhiteDim    BlackDim
 -------------------------------------------------------------------------------------------------------
 A Strange Plague           Independence Square     The Unnamable       <>,[]       O
 Blackest Night             Black Cave              Hibb's Roadhouse    <>,[]       O
 Blood Magic                Independence Square     The Unnamable       <>,[]       O
 Dreams of a Sunken City    Independence Square     The Unnamable       +           C
 No One Can Help You Now    The Unnamable           Woods               +           C
 Noden's Favor              The Witch House         Black Cave          /,*,^       H
 Planetary Alignment        The Witch House         Black Cave          <>,[]       O
 R'lyeh Rising              Woods                   Historical Society  /,*,^       H
 Solar Eclipse              Graveyard               Unvisited Isle      <>,[]       O
 The Chill of the Grave     Unvisited Isle          Science Building    +           C
 The Man in Black           The Witch House         Black Cave          +           C
 Things of Darkness         Silver Twilight Lodge   Graveyard           [],<>       O
 
 
 ENVIRONMENT, MYSTIC EFFECTS
 Name                       Effect
 -----------------------------------------
 A Strange Plague           Players can not gain STA except from Hospital or Vincent Lee
 Blackest Night             Luck checks -1, Sneak checks +1
 Blood Magic                If end move in Rivertown streets may roll die = current STA; foreach fail, lose 1 STA. If 0 STA, devoured. else +3 Clues
 Dreams of a Sunken City    Players can not gain SAN except from Asylum or Carolyn Fern
 No One Can Help You Now    Can not seal gates (can still close gates)
 Noden's Favor              Cost to seal gates -2 clues
 Planetary Alignment        All spells SAN cost is 0
 R'lyeh Rising              Star Spawn, Maniacs toughness +1. difficulty to seal or close gates to R'lyeh +1
 Solar Eclipse              No spells may be cast
 The Chill of the Grave     Undead monsters toughness +1
 The Man in Black           If end movement in FrenchHill st. may roll die = to SAN. foreach fail, the -1 SAN. If 0 SAN, devoured. Else, +1 Clue, +1 Spell
 Things of Darkness         Ghoul, FormlessSpawn, Shoggoth, FlyingPolyp +1 toughness
 
 */


#pragma mark - Urban Environments

@interface AlienTechnologyMythos : EnvironmentMythos
@end
@interface CurfewEnforcedMythos : EnvironmentMythos
@end
@interface DrakesCarnivalMythos : EnvironmentMythos
@end
@interface EgyptianExhibitMythos : EnvironmentMythos
@end
@interface EstateSaleMythos : EnvironmentMythos
@end
@interface HappyDaysMythos : EnvironmentMythos
@end
@interface TheFestivalMythos : EnvironmentMythos
@end

#pragma mark - Weather Environments

@interface EvilFogMythos : EnvironmentMythos
@end
@interface HeatWaveMythos : EnvironmentMythos
@end
@interface IcyConditionsMythos : EnvironmentMythos
@end
@interface RainingCatsAndDogsMythos : EnvironmentMythos
@end
@interface SunnyAndClearMythos : EnvironmentMythos
@end

#pragma mark - Mystic environments

@interface StrangePlaugeMythos : EnvironmentMythos
@end
@interface BlackestNightMythos : EnvironmentMythos
@end
@interface BloodMagicMythos : EnvironmentMythos
@end
@interface DreamsOfSunkenCityMythos : EnvironmentMythos
@end
@interface NoOneCanHelpMythos : EnvironmentMythos
@end
@interface NodensFavorMythos : EnvironmentMythos
@end
@interface PlanetaryAlignmentMythos : EnvironmentMythos
@end
@interface RlyehRisingMythos : EnvironmentMythos
@end
@interface SolarEclipseMythos : EnvironmentMythos
@end
@interface ChillOfTheGraveMythos : EnvironmentMythos
@end
@interface ManInBlackMythos : EnvironmentMythos
@end
@interface ThingsOfDarknessMythos : EnvironmentMythos
@end
