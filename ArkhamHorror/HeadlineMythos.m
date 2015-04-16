//
//  HeadlineMythos.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 4/16/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "HeadlineMythos.h"
#import "Dimension.h"
#import "Mythos.h"
#import "Game.h"

@implementation HeadlineMythos
-(id)init{
    self = [super init];
    if (self){
        self.name = @"Prototype Headline Mythos";
        self.mythosType = MythosTypeHeadline;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCircle]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolDiamond],
                                 [Dimension ofType:MonsterDimensionSymbolSquare]];
        
    }
    
    return self;
}
-(void)applyHeadlineEffect:(Game *)game {
    // pass
}
@end

#pragma mark - Headlines

@implementation AllQuietMythos
-(id)init{
    // Each player may pass a Luck(-1) to be Blessed
    self = [super init];
    if (self){
        self.name = @"All Quiet in Arkham!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"Woods";
        self.clueLocation = @"Historical Society";
    }
    
    return self;
}
@end

@implementation BigStormMythos
-(id)init{
    // All monsters in outskirts and sky return to cup
    self = [super init];
    if (self){
        self.name = @"Big Storm Sweeps Arkham!";
        self.gateLocation = @"Independence Square";
        self.clueLocation = @"The Unnamable";
    }
    return self;
}
@end

@implementation BizarreDreamsMythos
-(id)init{
    // Gugs + Nightgaunts in arkham return to cup. If any mosnters returned to cup this way, terror +1
    self = [super init];
    if (self){
        self.name = @"Bizarre Dreams Plague Citizens!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"Science Building";
        self.clueLocation = @"The Witch House";
    }
    return self;
}
@end

@implementation BlueFluMythos
-(id)init{
    // All jailed are released immediately. No one may be arrested until end of next turn
    self = [super init];
    if (self){
        self.name = @"Blue Flu!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"The Unnamable";
        self.clueLocation = @"Woods";
    }
    return self;
}
@end

@implementation CampusSecurityIncreasedMythos
-(id)init{
    // All monsters in Miskatonic U. neighborhood return to cup
    self = [super init];
    if (self){
        self.name = @"Campus Security Increased!";
        self.gateLocation = @"Independence Square";
        self.clueLocation = @"The Unnamable";
    }
    return self;
}
@end

@implementation ReclaimsSouthsideMythos
-(id)init{
    // All monsters in Southside neighborhood return to cup
    self = [super init];
    if (self){
        self.name = @"Church Group Reclaims Southside!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"Black Cave";
        self.clueLocation = @"Hibb's Roadhouse";
        
    }
    return self;
}
@end

@implementation BlackoutsMythos
-(id)init{
    // Common Shop, Unique Shop, and Spell Shop are closed until the end of next turn.
    self = [super init];
    if (self){
        self.name = @"City Gripped by Blackouts!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"Unvisited Isle";
        self.clueLocation = @"Science Building";
    }
    return self;
}
@end

@implementation FamilyFoundButcheredMythos
-(id)init{
    // terror +1
    self = [super init];
    if (self){
        self.name = @"Family Found Butchered!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"Graveyard";
        self.clueLocation = @"Unvisited Isle";
    }
    return self;
}
@end

@implementation FedsRaidArkhamMythos
-(id)init{
    // All monsters in streets return to cup
    self = [super init];
    if (self){
        self.name = @"Feds Raid Arkham!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"Black Cave";
        self.clueLocation = @"Hibb's Roadhouse";
    }
    return self;
}
@end

@implementation FourthIfJulyParadeMythos
-(id)init{
    // Players can't move into or out of Merchant Dist. streets until end of next turn
    self = [super init];
    if (self){
        self.name = @"Fourth of July Parade!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation CleanUpEasttownMythos
-(id)init{
    // All monsters in Easttown neighborhood return to cup
    self = [super init];
    if (self){
        self.name = @"Gangs Clean Up Easttown!";
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation GhostShipDocksMythos
-(id)init{
    // 2 monsters appear in Merchant District streets
    self = [super init];
    if (self){
        self.name = @"Ghost Ship Docks by Itself!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"The Unnamable";
        self.clueLocation = @"Woods";
    }
    return self;
}
@end

@implementation GoatLikeCreatureInWoodsMythos
-(id)init{
    // Dark Young in arkham return to cup, if any monsters return to cup this way, terror +1
    self = [super init];
    if (self){
        self.name = @"Goat-like Creature Spotted in Woods!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"Independence Square";
        self.clueLocation = @"The Unnamable";
    }
    return self;
}
@end

@implementation HorrorAtGroundbreakingMythos
-(id)init{
    // 2 monsters appear in Miskatonic U. streets
    self = [super init];
    if (self){
        self.name = @"Horror at Groundbreaking!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"Historical Society";
        self.clueLocation = @"Silver Twilight Lodge";
    }
    return self;
}
@end

@implementation IllWindMythos
-(id)init{
    // first player must pass Luck(-1) or be Cursed
    self = [super init];
    if (self){
        self.name = @"Ill Wind Grips Arkham!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"Graveyard";
        self.clueLocation = @"Unvisited Isle";
    }
    return self;
}
@end

@implementation LodgeMemberQuestionedMythos
-(id)init{
    // 2 monsters appear in French Hill streets
    self = [super init];
    if (self){
        self.name = @"Lodge Member Held for Questioning!";
        self.gateLocation = @"Black Cave";
        self.clueLocation = @"Hibb's Roadhouse";
    }
    return self;
}
@end

@implementation LodgeMembersWatchNightMythos
-(id)init{
    // All monsters in French Hill neighborhood return to cup
    self = [super init];
    if (self){
        self.name = @"Lodge Members Watch the Night!";
        self.gateLocation = @"Unvisited Isle";
        self.clueLocation = @"Science Building";
    }
    return self;
}
@end

@implementation ManhuntInArkhamMythos
-(id)init{
    // All monsters in locations (not streets) return to cup
    self = [super init];
    if (self){
        self.name = @"Manhunt in Arkham!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                [Dimension ofType:MonsterDimensionSymbolStar],
                                [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.gateLocation = @"Woods";
        self.clueLocation = @"Independence Square";
    }
    return self;
}
@end

@implementation MerchantsMarchMythos
-(id)init{
    // All monsters in Merchant District neighborhood return to cup
    self = [super init];
    if (self){
        self.name = @"Merchants March on Crime!";
        self.gateLocation = @"Independence Square";
        self.clueLocation = @"The Unnamable";
    }
    return self;
}
@end

@implementation ArcticExpeditionReturnsMythos
-(id)init{
    // All Elder Thing monster trophies return to life and appear in River Docks
    self = [super init];
    if (self){
        self.name = @"Miskatonic Arctic Expedition Returns!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"Hibb's Roadhouse";
        self.clueLocation = @"Independence Square";
    }
    return self;
}
@end

@implementation MissingPeopleReturnMythos
-(id)init{
    // All players presently lost in time and space immediately return to arkham location or street of their choice
    self = [super init];
    if (self){
        self.name = @"Missing People Return!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                [Dimension ofType:MonsterDimensionSymbolStar],
                                [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.gateLocation = @"The Unnamable";
        self.clueLocation = @"Woods";
    }
    return self;
}
@end

@implementation PicnickersPanicMythos
-(id)init{
    // 2 monsters appear in downtown street
    self = [super init];
    if (self){
        self.name = @"Picknikers Panic!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"Unvisited Isle";
        self.clueLocation = @"Science Building";
    }
    return self;
}
@end

@implementation PolicePatrolNorthsideMythos
-(id)init{
    // All monsters in Northside neighborhood return to cup
    self = [super init];
    if (self){
        self.name = @"Police Step Up Patrols in Northside!";
        self.gateLocation = @"Silver Twilight Lodge";
        self.clueLocation = @"Graveyard";
    }
    return self;
}
@end

@implementation SecurityInUptownMythos
-(id)init{
    // All monsters in Uptown neighborhood return to cup
    self = [super init];
    if (self){
        self.name = @"Private Security Hired in Uptown!";
        self.gateLocation = @"Woods";
        self.clueLocation = @"Historical Society";
    }
    return self;
}
@end

@implementation RivertownTakesStreetsMythos
-(id)init{
    // All monsters in Rivertown return to cup
    self = [super init];
    if (self){
        self.name = @"Rivertown Residents Take Back Streets!";
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation DimensionalRiftMythos
-(id)init{
    // Dimensional Shamblers + Hounds of Tindalos in arkham return to cup, if any monsters return to cup this way, terror +1
    self = [super init];
    if (self){
        self.name = @"Scientist Warns of Dimensional Rift!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"Unvisited Isle";
        self.clueLocation = @"Science Building";
    }
    return self;
}
@end

@implementation GangTurnsToPoliceMythos
-(id)init{
    // 2 monsters appear in Uptown Streets
    self = [super init];
    if (self){
        self.name = @"Sheldon Gang Turns to Police for Aid!";
        self.gateLocation = @"Graveyard";
        self.clueLocation = @"Unvisited Isle";
    }
    return self;
}
@end

@implementation SlumMurdersContinueMythos
-(id)init{
    // 2 monsters appear in Easttown Streets
    self = [super init];
    if (self){
        self.name = @"Slum Murders Continue!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"Woods";
        self.clueLocation = @"Historical Society";
    }
    return self;
}
@end

@implementation SouthsideStranglerSuspectedMythos
-(id)init{
    // 2 monsters appear in Southside Streets
    self = [super init];
    if (self){
        self.name = @"Southside Strangler Suspected!";
        self.gateLocation = @"Woods";
        self.clueLocation = @"Historical Society";
    }
    return self;
}
@end

@implementation StrangeLightsOnCampusMythos
-(id)init{
    // Library, Administration Building, Science Building are closed until end of next turn
    self = [super init];
    if (self){
        self.name = @"Strange Lights on Campus!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"Woods";
        self.clueLocation = @"Historical Society";
    }
    return self;
}
@end

@implementation StrangePowerFluxMythos
-(id)init{
    // All players in Other Worlds may immediately return to Arkham
    self = [super init];
    if (self){
        self.name = @"Strange Power Flux Plagues City!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                [Dimension ofType:MonsterDimensionSymbolStar],
                                [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.gateLocation = @"Independence Square";
        self.clueLocation = @"The Unnamable";
    }
    return self;
}
@end

@implementation StrangeTremorsCeaseMythos
-(id)init{
    // Chthonians and Dholes in arkham return to cup, if any monsters return to cup this way, terror +1
    self = [super init];
    if (self){
        self.name = @"Strange Tremors Cease!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"Independence Square";
        self.clueLocation = @"The Unnamable";
    }
    return self;
}
@end

@implementation TemperenceFeverMythos
-(id)init{
    // players w/ whiskey must pass Sneak(-1) or be arrested and lose whiskey. Hibb's Roadhouse is closed until end of next turn
    self = [super init];
    if (self){
        self.name = @"Temperence Fever Sweeps City";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                 [Dimension ofType:MonsterDimensionSymbolStar],
                                 [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation TerrorAtTrainStationMythos
-(id)init{
    // 2 monsters appear in Northside Street
    self = [super init];
    if (self){
        self.name = @"Terror at the Train Station!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"The Witch House";
        self.clueLocation = @"Black Cave";
    }
    return self;
}
@end

@implementation VigilanteGuardsNightMythos
-(id)init{
    // All monsters in downtown neighborhood return to cup
    self = [super init];
    if (self){
        self.name = @"Vigilante Guards the Night!";
        self.gateLocation = @"The Unnamable";
        self.clueLocation = @"Woods";
    }
    return self;
}
@end

@implementation WitchBurningAnniversaryMythos
-(id)init{
    // 2 Monsters appear in Rivertown Street
    self = [super init];
    if (self){
        self.name = @"Witch Burning Anniversary!";
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolCrescent]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolPlus]];
        self.gateLocation = @"Unvisited Isle";
        self.clueLocation = @"Science Building";
    }
    return self;
}
@end
