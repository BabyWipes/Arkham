//
//  Mythos.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/5/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "Mythos.h"
#import "Dimension.h"

@implementation Mythos
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Mythos";
    }
    return self;
}
@end

#pragma mark - Urban
@implementation AlienTechnologyMythos
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Alien Technology";
    }
    return self;
}
@end
@implementation CurfewEnforcedMythos 
@end
@implementation DrakesCarnivalMythos
@end
@implementation EgyptianExhibitMythos
@end
@implementation EstateSaleMythos
@end
@implementation HappyDaysMythos
@end
@implementation TheFestivalMythos
@end



#pragma mark - Rumors

@implementation RumorMythos
-(id)init {
    self = [super init];
    if (self){
        self.name = @"Prototype Rumor Mythos";
        self.mythosType = MythosTypeRumor;
        self.whiteDimensons = @[[Dimension ofType:MonsterDimensionSymbolSlash],
                                [Dimension ofType:MonsterDimensionSymbolStar],
                                [Dimension ofType:MonsterDimensionSymbolTriangle]];
        self.blackDimensions = @[[Dimension ofType:MonsterDimensionSymbolHexagon]];
    }
    return self;
}
-(void)ongoingEffect{
    // pass
}
-(BOOL)didPass {
    return YES;
}
-(BOOL)didFail {
    return NO;
}
@end

@implementation DisturbingTheDeadMythos
-(id)init{
    self = [super init];
    if (self){
        self.name = @"Disturbing the Dead";
        self.gateLocation = @"Black Cave";
    }
    return self;
}
-(void)ongoingEffect{
    // roll a die, on 1 or 2, terror +1
}
-(BOOL)didPass {
    // discard 2 gate trophies in rivertown street, all players draw a spell
    return YES;
}
-(BOOL)didFail {
    // terror level is 10, all players are cursed
    return NO;
}
@end
@implementation GoodWorkUndoneMythos
@end
@implementation GreatRitualMythos
@end
@implementation SouthsideStranglerStrikesMythos
@end
@implementation StarsAreRightMythos
@end
@implementation TerribleExperimentMythos
@end