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

 ENVIRONMENTS, URBAN
 Name                                   Gate location
 ----------------------------------------------------------
 Alien Technology                       Unvisited Isle
 Curfew Enforced                        Unvisited Isle
 Darke's Carnival Arrives               The Unnamable
 Egyptian Exhibit Visits Miskatonic U.	The Witch House
 Estate Sale                            The Witch House
 Happy Days are Here Again              Woods
 The Festival                           Woods
 
 
 
 ENVIRONMENTS, WEATHER
 Name                       Gate location
 ----------------------------------------------------------
 An Evil Fog                Graveyard
 Heat Wave                  Woods
 Icy Conditions             Historical Society
 Raining Cats and Dogs      Hibb's Roadhouse
 Sunny and Clear            Black Cave
 
 
 
 ENVIRONMENTS, MYSTIC
 Name                       Gate location
 ----------------------------------------------------------
 A Strange Plague           Independence Square
 Blackest Night             Black Cave
 Blood Magic                Independence Square
 Dreams of a Sunken City    Independence Square
 No One Can Help You Now    The Unnamable
 Noden's Favor              The Witch House
 Planetary Alignment        The Witch House
 R'lyeh Rising              Woods
 Solar Eclipse              Graveyard
 The Chill of the Grave     Unvisited Isle
 The Man in Black           The Witch House
 Things of Darkness         Silver Twilight Lodge
 

 SPECIAL
 Name                   Effect
 -----------------------------
 The Story Continues…   Reshuffle Mythos deck, including this card, draw another mythos
 
 HEADLINES
 Name                                   Gate Location
 -------------------------------------------------------
 All Quiet in Arkham!                   Woods
 Big Storm Sweeps Arkham!               Independence Square
 Bizarre Dreams Plague Citizens!        Science Building
 Blue Flu!                              The Unnamable
 Campus Security Increased!             Independence Square
 Church Group Reclaims Southside!       Black Cave
 City Gripped by Blackouts!             Unvisited Isle
 Family Found Butchered!                Graveyard
 Feds Raid Arkham!                      Black Cave
 Fourth of July Parade!                 The Witch House
 Gangs Clean Up Easttown!               The Witch House
 Ghost Ship Docks by Itself!            The Unnamable
 Goat-like Creature Spotted in Woods!	Independence Square
 Horror at Groundbreaking!              Historical Society
 Ill Wind Grips Arkham!                 Graveyard
 Lodge Member Held for Questioning!     Black Cave
 Lodge Members Watch the Night!         Unvisited Isle
 Manhunt in Arkham!                     Woods
 Merchants March on Crime!              Independence Square
 Miskatonic Arctic Expedition Returns!	Hibb's Roadhouse
 Missing People Return!                 The Unnamable
 Picnickers Panic!                      Unvisited Isle
 Police Step Up Patrols in Northside!	Silver Twilight Lodge
 Private Security Hired in Uptown!      Woods
 Rivertown Residents Take Back Streets!	The Witch House
 Scientist Warns of Dimensional Rift!	Unvisited Isle
 Sheldon Gang Turns to Police for Aid!	Graveyard
 Slum Murders Continue!                 Woods
 Southside Strangler Suspected!         Woods
 Strange Lights on Campus!              Woods
 Strange Power Flux Plagues City!       Independence Square
 Strange Tremors Cease!                 Independence Square
 Temperence Fever Sweeps City           The Witch House
 Terror at the Train Station!           The Witch House
 Vigilante Guards the Night!            The Unnamable
 Witch Burning Anniversary!             Unvisited Isle
 
 
 Dimension Key
 
 C = Crescent
 + = Plus
 [] = Square
 <> = Diamond
 * = Star
 / = Slash
 O = Circle
 ^ = Triangle
 H = Hexagon
 
 EFFECTS, HEADLINES
 Name                               Clue Location   WhtDim  BlkDim  Effect
 -------------------------------------------------------------------------------------
 Witch Burning Anniversary!         SciBuilding     C       +       +2 Monsters in Rivertown Street
 Vigilante Guards the Night!        Woods           O       [],<>   All monsters in downtown return to cup
 
 EFFECTS, ENVIRONMENT, MYSTIC
 Name                               Clue Location   WhtDim  BlkDim  Effect
 -------------------------------------------------------------------------------------
 Things of Darkness                 Graveyard       [],<>   O       Ghoul,FormlessSpawn,Shoggoth,FlyingPolyp +1 toughness

 
 
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
 The Terrible Experiment    Setup: Place 5 monsters on card. A player may fight one or more in Miskatonic U. streets during the Arkham Encounter Phase.
                                If defeated, claim as monster trophies. They don't move, aren't considered on the board, and don't count toward monster limit.
                            Ongoing Effect: Place a monster on this card at the end of every Mythos Phase.
                            Pass: If 0 monsters on this card, return to box. Each player draws 1 Skill.
                            Fail: If 8 monsters on this card, return to box. Raise terror to 10, place card's monsters in play in Miskatonic U. streets.
 
 The Stars Are Right        Ongoing Effect: Roll die at the end of every Mythos Phase while this card is in play. On 1 or 2, +1 doom
                            Pass: Any player discards 1 ally in Downtown Street during Arkham Encounter. Each player draws 2 Common Items.
                            Fail: If the Ancient One awakens
 
 The Southside Strangler Strikes    Ongoing Effect: Return 1 Ally from deck to box at random at the end of every Mythos Phase while this card is in play.
                                    Pass: A player discards 5 Clues in Ma's Boarding House during Arkham Encounters Phase. Each player receives a $5.
                                    Fail: If there are no more Allies in Deck at end of the Mythos Phase, Each player -1 max SAN or -1 max STA (players choice)
 
 The Great Ritual       Ongoing Effect: Cultist,Witch,Warlock,HighPriest +2 toughness while in play. Place 1 clue on this card at end of every Mythos Phase.
                        Pass: Single player discards 3 spells (4 if > 4 players) in French Hill streets during Arkham Encounters phase. Each player +2 clues.
                        Fail: If 5 Clues on this card: From now on, draw 2 Mythos cards each Mythos Phase. Only open card 1's gate.
 
 Good Work Undone       Setup: Place 6 Clues on card. A player may spend Clues during Arkham Encounter Phase while in Easttown streets to 
                            discard Clue tokens from this card on a 1-for-1 basis.
                        Ongoing Effect: Roll 2 die at end of every Mythos Phase. For every 1 or 2 rolled, place 1 Clue on card.
                        Pass: If there are no Clues on this card. Each player draws one unique item.
                        Fail: If there are 10 Clues on this card. All elder sign tokens are removed from the board.
 
 Disturbing the Dead    Ongoing Effect: Roll die at end of every Mythos Phase while card in play. On a 1 or 2, increase the +1 terror.
                        Pass: If a player discards 2 gate trophies during the Arkham Encounter Phase while in Rivertown streets, Each player draws 1 Spell.
                        Fail: If the terror level reaches 10, return this card to the box. Every investigator is Cursed.
*/