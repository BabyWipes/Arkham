//
//  Mythos.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Mythos : Card
@property (strong, nonatomic) NSArray *whiteDimensons;
@property (strong, nonatomic) NSArray *blackDimensions;
@property (nonatomic) MythosType mythosType;
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
 
 
 SPECIAL
 Name                   Effect
 -----------------------------
 The Story Continues…   Reshuffle Mythos deck, including this card, draw another mythos
 
 
 

 ENVIRONMENTS, URBAN
 Name                                   Gate location           Clue Location       WhiteDim    BlackDim
 -------------------------------------------------------------------------------------------------------
 Alien Technology                       Unvisited Isle          Science Building    <>,[]       O
 Curfew Enforced                        Unvisited Isle          Science Building    +           C
 Darke's Carnival Arrives               The Unnamable           Woods               <>,[]       O
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
 

 
 
 
 
 HEADLINES
 Name                                   Gate Location           Clue Location           WhiteDim    BlackDim
 -----------------------------------------------------------------------------------------------------------
 All Quiet in Arkham!                   Woods                   Historical Society      H           /,*,^
 Big Storm Sweeps Arkham!               Independence Square     The Unnamable           C           +
 Bizarre Dreams Plague Citizens!        Science Building        The Witch House         H           /,*,^
 Blue Flu!                              The Unnamable           Woods                   H           /,*,^
 Campus Security Increased!             Independence Square     The Unnamable           O           <>,[]
 Church Group Reclaims Southside!       Black Cave              Hibb's Roadhouse        H           /,*,^
 City Gripped by Blackouts!             Unvisited Isle          Science Building        H           /,*,^
 Family Found Butchered!                Graveyard               Unvisited Isle          C           +
 Feds Raid Arkham!                      Black Cave              Hibb's Roadhouse        C           +
 Fourth of July Parade!                 The Witch House         Black Cave              C           +
 Gangs Clean Up Easttown!               The Witch House         Black Cave              O           <>,[]
 Ghost Ship Docks by Itself!            The Unnamable           Woods                   C           +
 Goat-like Creature Spotted in Woods!	Independence Square     The Unnamable           H           /,*,^
 Horror at Groundbreaking!              Historical Society      Silver Twilight Lodge   C           +
 Ill Wind Grips Arkham!                 Graveyard               Unvisited Isle          H           /,*,^
 Lodge Member Held for Questioning!     Black Cave              Hibb's Roadhouse        O           <>,[]
 Lodge Members Watch the Night!         Unvisited Isle          Science Building        O           <>,[]
 Manhunt in Arkham!                     Woods                   Independence Square     /,*,^       H
 Merchants March on Crime!              Independence Square     The Unnamable           O           <>,[]
 Miskatonic Arctic Expedition Returns!	Hibb's Roadhouse        Independence Square     C           +
 Missing People Return!                 The Unnamable           Woods                   /,*,^       H
 Picnickers Panic!                      Unvisited Isle          Science Building        C           +
 Police Step Up Patrols in Northside!	Silver Twilight Lodge   Graveyard               O           <>,[]
 Private Security Hired in Uptown!      Woods                   Historical Society      O           <>,[]
 Rivertown Residents Take Back Streets!	The Witch House         Black Cave              O           <>,[]
 Scientist Warns of Dimensional Rift!	Unvisited Isle          Science Building        H           /,*,^
 Sheldon Gang Turns to Police for Aid!	Graveyard               Unvisited Isle          O           <>,[]
 Slum Murders Continue!                 Woods                   Historical Society      C           +
 Southside Strangler Suspected!         Woods                   Historical Society      O           <>,[]
 Strange Lights on Campus!              Woods                   Historical Society      H           /,*,^
 Strange Power Flux Plagues City!       Independence Square     The Unnamable           /,*.^       H
 Strange Tremors Cease!                 Independence Square     The Unnamable           H           /,*,^
 Temperence Fever Sweeps City           The Witch House         Black Cave              H           /,*,^
 Terror at the Train Station!           The Witch House         Black Cave              C           +
 Vigilante Guards the Night!            The Unnamable           Woods                   O           [],<>
 Witch Burning Anniversary!             Unvisited Isle          Science Building        C           +

 
 EFFECTS, HEADLINES
 Name                                   Effect
 ---------------------------------------------
 All Quiet in Arkham!                   Each player may pass a Luck(-1) to be Blessed
 Big Storm Sweeps Arkham!               All monsters in outskirts and sky return to cup
 Bizarre Dreams Plague Citizens!        Gugs + Nightgaunts in arkham return to cup. If any mosnters returned to cup this way, terror +1
 Blue Flu!                              All jailed are released immediately. No one may be arrested until end of next turn
 Campus Security Increased!             All monsters in Miskatonic U. neighborhood return to cup
 Church Group Reclaims Southside!       All monsters in Southside neighborhood return to cup
 City Gripped by Blackouts!             Common Shop, Unique Shop, and Spell Shop are closed until the end of next turn.
 Family Found Butchered!                terror +1
 Feds Raid Arkham!                      All monsters in streets return to cup
 Fourth of July Parade!                 Players can't move into or out of Merchant Dist. streets until end of next turn
 Gangs Clean Up Easttown!               All monsters in Easttown neighborhood return to cup
 Ghost Ship Docks by Itself!            2 monsters appear in Merchant District streets
 Goat-like Creature Spotted in Woods!   Dark Young in arkham return to cup, if any monsters return to cup this way, terror +1
 Horror at Groundbreaking!              2 monsters appear in Miskatonic U. streets
 Ill Wind Grips Arkham!                 first player must pass Luck(-1) or be Cursed
 Lodge Member Held for Questioning!     2 monsters appear in French Hill streets
 Lodge Members Watch the Night!         All monsters in French Hill neighborhood return to cup
 Manhunt in Arkham!                     All monsters in locations (not streets) return to cup
 Merchants March on Crime!              All monsters in Merchant District neighborhood return to cup
 Miskatonic Arctic Expedition Returns!  All Elder Thing monster trophies return to life and appear in River Docks
 Missing People Return!                 All players presently lost in time and space immediately return to arkham location or street of their choice
 Picnickers Panic!                      2 monsters appear in downtown street
 Police Step Up Patrols in Northside!   All monsters in Northside neighborhood return to cup
 Private Security Hired in Uptown!      All monsters in Uptown neighborhood return to cup
 Rivertown Residents Take Back Streets! All monsters in Rivertown return to cup
 Scientist Warns of Dimensional Rift!   Dimensional Shamblers + Hounds of Tindalos in arkham return to cup, if any monsters return to cup this way, terror +1
 Sheldon Gang Turns to Police for Aid!  2 monsters appear in Uptown Streets
 Slum Murders Continue!                 2 monsters appear in Easttown Streets
 Southside Strangler Suspected!         2 monsters appear in Southside Streets
 Strange Lights on Campus!              Library, Administration Building, Science Building are closed until end of next turn
 Strange Power Flux Plagues City!       All players in Other Worlds may immediately return to Arkham
 Strange Tremors Cease!                 Chthonians and Dholes in arkham return to cup, if any monsters return to cup this way, terror +1
 Temperence Fever Sweeps City           players w/ whiskey must pass Sneak(-1) or be arrested and lose whiskey. Hibb's Roadhouse is closed until end of next turn
 Terror at the Train Station!           2 monsters appear in Northside Street
 Vigilante Guards the Night!            All monsters in downtown neighborhood return to cup
 Witch Burning Anniversary!             2 Monsters appear in Rivertown Street
 
 
 
 
 
 RUMORS
 Name                               Gate Location
 ------------------------------------------------
 Disturbing the Dead                Black Cave
 Good Work Undone                   Unvisited Isle
 The Great Ritual                   Graveyard
 The Southside Strangler Strikes    Independence Square
 The Stars Are Right                Science Building
 The Terrible Experiment            Unvisited Isle
 
 All Ongoing Effects start on the Mythos Phase the turn after a card was played.
 All Rumors are returned to the box if they are passed or failed.
 All Rumors don't cause Clues to appear
 All Rumors have Slash, Star, and Triangle and White Dimensions
 All Rumors have Hexagons as a Black Dimension
 
 EFFECTS, RUMORS
 Name                       Effect
 -------------------------------------------------------------------------------------
 Disturbing the Dead    Ongoing Effect: Roll die at end of every Mythos Phase while card in play. On a 1 or 2, increase the +1 terror.
                        Pass: If a player discards 2 gate trophies during the Arkham Encounter Phase while in Rivertown streets, Each player draws 1 Spell.
                        Fail: If the terror level reaches 10, return this card to the box. Every investigator is Cursed.
 
 Good Work Undone       Setup: Place 6 Clues on card. A player may spend Clues during Arkham Encounter Phase while in Easttown streets to discard Clue tokens from 
                            this card on a 1-for-1 basis.
                        Ongoing Effect: Roll 2 die at end of every Mythos Phase. For every 1 or 2 rolled, place 1 Clue on card.
                        Pass: If there are no Clues on this card. Each player draws one unique item.
                        Fail: If there are 10 Clues on this card. All elder sign tokens are removed from the board.
 
 The Great Ritual       Ongoing Effect: Cultist,Witch,Warlock,HighPriest +2 toughness while in play. Place 1 clue on this card at end of every Mythos Phase.
                        Pass: Single player discards 3 spells (4 if > 4 players) in French Hill streets during Arkham Encounters phase. Each player +2 clues.
                        Fail: If 5 Clues on this card: From now on, draw 2 Mythos cards each Mythos Phase. Only open card 1's gate.
 
 The Southside Strangler Strikes    Ongoing Effect: Return 1 Ally from deck to box at random at the end of every Mythos Phase while this card is in play.
                                    Pass: A player discards 5 Clues in Ma's Boarding House during Arkham Encounters Phase. Each player receives a $5.
                                    Fail: If there are no more Allies in Deck at end of the Mythos Phase, Each player -1 max SAN or -1 max STA (players choice)

 
 The Stars Are Right    Ongoing Effect: Roll die at the end of every Mythos Phase while this card is in play. On 1 or 2, +1 doom
                        Pass: Any player discards 1 ally in Downtown Street during Arkham Encounter. Each player draws 2 Common Items.
                        Fail: If the Ancient One awakens

 

 
 The Terrible Experiment    Setup: Place 5 monsters on card. A player may fight one or more in Miskatonic U. streets during the Arkham Encounter Phase. If 
                                    defeated, claim as monster trophies. They don't move, aren't considered on the board, and don't count toward monster limit.
                            Ongoing Effect: Place a monster on this card at the end of every Mythos Phase.
                            Pass: If 0 monsters on this card, return to box. Each player draws 1 Skill.
                            Fail: If 8 monsters on this card, return to box. Raise terror to 10, place card's monsters in play in Miskatonic U. streets.
*/