//
//  Mythos.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class Mythos;

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Monster.h"

@interface Mythos : Card
@property (strong, nonatomic) NSArray *whiteDimensons;
@property (strong, nonatomic) NSArray *blackDimensions;
@property (nonatomic) MythosType mythosType;
@end

/*

 
 Mythos                                 Type                    Gate location
 ----------------------------------------------------------------------------------
 A Strange Plague                       Environment (Mystic)	Independence Square
 Alien Technology                       Environment (Urban)		Unvisited Isle
 All Quiet in Arkham!                   Headline                Woods
 An Evil Fog                            Environment (Weather)	Graveyard
 Big Storm Sweeps Arkham!               Headline                Independence Square
 Bizarre Dreams Plague Citizens!        Headline                Science Building
 Blackest Night                         Environment (Mystic)	Black Cave
 Blood Magic                            Environment (Mystic)	Independence Square
 Blue Flu!                              Headline                The Unnamable
 Campus Security Increased!             Headline                Independence Square
 Church Group Reclaims Southside!       Headline                Black Cave
 City Gripped by Blackouts!             Headline                Unvisited Isle
 Curfew Enforced                        Environment (Urban)		Unvisited Isle
 Darke's Carnival Arrives               Environment (Urban)		The Unnamable
 Disturbing the Dead                    Rumor                   Black Cave
 Dreams of a Sunken City                Environment (Mystic)	Independence Square
 Egyptian Exhibit Visits Miskatonic U.	Environment (Urban)		The Witch House
 Estate Sale                            Environment (Urban)		The Witch House
 Family Found Butchered!                Headline                Graveyard
 Feds Raid Arkham!                      Headline                Black Cave
 Fourth of July Parade!                 Headline                The Witch House
 Gangs Clean Up Easttown!               Headline                The Witch House
 Ghost Ship Docks by Itself!            Headline                The Unnamable
 Goat-like Creature Spotted in Woods!	Headline                Independence Square
 Good Work Undone                       Rumor                   Unvisited Isle
 Happy Days are Here Again              Environment (Urban)		Woods
 Heat Wave                              Environment (Weather)	Woods
 Horror at Groundbreaking!              Headline                Historical Society
 Icy Conditions                         Environment (Weather)	Historical Society
 Ill Wind Grips Arkham!                 Headline                Graveyard
 Lodge Member Held for Questioning!     Headline                Black Cave
 Lodge Members Watch the Night!         Headline                Unvisited Isle
 Manhunt in Arkham!                     Headline                Woods
 Merchants March on Crime!              Headline                Independence Square
 Miskatonic Arctic Expedition Returns!	Headline                Hibb's Roadhouse
 Missing People Return!                 Headline                The Unnamable
 No One Can Help You Now                Environment (Mystic)	The Unnamable
 Noden's Favor                          Environment (Mystic)	The Witch House
 Picnickers Panic!                      Headline                Unvisited Isle
 Planetary Alignment                    Environment (Mystic)	The Witch House
 Police Step Up Patrols in Northside!	Headline                Silver Twilight Lodge
 Private Security Hired in Uptown!      Headline                Woods
 Raining Cats and Dogs                  Environment (Weather)	Hibb's Roadhouse
 Rivertown Residents Take Back Streets!	Headline                The Witch House
 R'lyeh Rising                          Environment (Mystic)	Woods
 Scientist Warns of Dimensional Rift!	Headline                Unvisited Isle
 Sheldon Gang Turns to Police for Aid!	Headline                Graveyard
 Slum Murders Continue!                 Headline                Woods
 Solar Eclipse                          Environment (Mystic)	Graveyard
 Southside Strangler Suspected!         Headline                Woods
 Strange Lights on Campus!              Headline                Woods
 Strange Power Flux Plagues City!       Headline                Independence Square
 Strange Tremors Cease!                 Headline                Independence Square
 Sunny and Clear                        Environment (Weather)	Black Cave
 Temperence Fever Sweeps City           Headline                The Witch House
 Terror at the Train Station!           Headline                The Witch House
 The Chill of the Grave                 Environment (Mystic)	Unvisited Isle
 The Festival                           Environment (Urban)		Woods
 The Great Ritual                       Rumor		Graveyard
 The Man in Black                       Environment (Mystic)    The Witch House
 The Southside Strangler Strikes        Rumor                   Independence Square
 The Stars Are Right                    Rumor                   Science Building
 The Story Continues…                   -                       -                    *Reshuffle Mythos deck, including this card, draw another mythos
 The Terrible Experiment                Rumor                   Unvisited Isle
 Things of Darkness                     Environment (Mystic)    Silver Twilight Lodge
 Vigilante Guards the Night!            Headline                The Unnamable
 Witch Burning Anniversary!             Headline                Unvisited Isle
 
*/