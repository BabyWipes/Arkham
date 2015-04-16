//
//  HeadlineMythos.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 4/16/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Mythos.h"

@interface HeadlineMythos : Mythos
-(void)applyHeadlineEffect:(Game*)game;
@end

#pragma mark - Headlines

/*
 
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
 Vigilante Guards the Night!            The Unnamable           Woods                   O           <>,[]
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
 */

@interface AllQuietMythos : HeadlineMythos
@end
@interface BigStormMythos : HeadlineMythos
@end
@interface BizarreDreamsMythos : HeadlineMythos
@end
@interface BlueFluMythos : HeadlineMythos
@end
@interface CampusSecurityIncreasedMythos : HeadlineMythos
@end
@interface ReclaimsSouthsideMythos : HeadlineMythos
@end
@interface BlackoutsMythos : HeadlineMythos
@end
@interface FamilyFoundButcheredMythos : HeadlineMythos
@end
@interface FedsRaidArkhamMythos : HeadlineMythos
@end
@interface FourthIfJulyParadeMythos : HeadlineMythos
@end
@interface CleanUpEasttownMythos : HeadlineMythos
@end
@interface GhostShipDocksMythos : HeadlineMythos
@end
@interface GoatLikeCreatureInWoodsMythos : HeadlineMythos
@end
@interface HorrorAtGroundbreakingMythos : HeadlineMythos
@end
@interface IllWindMythos : HeadlineMythos
@end
@interface LodgeMemberQuestionedMythos : HeadlineMythos
@end
@interface LodgeMembersWatchNightMythos : HeadlineMythos
@end
@interface ManhuntInArkhamMythos : HeadlineMythos
@end
@interface MerchantsMarchMythos : HeadlineMythos
@end
@interface ArcticExpeditionReturnsMythos : HeadlineMythos
@end
@interface MissingPeopleReturnMythos : HeadlineMythos
@end
@interface PicnickersPanicMythos : HeadlineMythos
@end
@interface PolicePatrolNorthsideMythos : HeadlineMythos
@end
@interface SecurityInUptownMythos : HeadlineMythos
@end
@interface RivertownTakesStreetsMythos : HeadlineMythos
@end
@interface DimensionalRiftMythos : HeadlineMythos
@end
@interface GangTurnsToPoliceMythos : HeadlineMythos
@end
@interface SlumMurdersContinueMythos : HeadlineMythos
@end
@interface SouthsideStranglerSuspectedMythos : HeadlineMythos
@end
@interface StrangeLightsOnCampusMythos : HeadlineMythos
@end
@interface StrangePowerFluxMythos : HeadlineMythos
@end
@interface StrangeTremorsCeaseMythos : HeadlineMythos
@end
@interface TemperenceFeverMythos : HeadlineMythos
@end
@interface TerrorAtTrainStationMythos : HeadlineMythos
@end
@interface VigilanteGuardsNightMythos : HeadlineMythos
@end
@interface WitchBurningAnniversaryMythos : HeadlineMythos
@end