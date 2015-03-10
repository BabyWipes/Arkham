//
//  PathFinder.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/9/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PESGraph.h"
#import "Location.h"

@interface PathFinder : NSObject
+(PESGraph*)setupBoardGraph:(NSArray*)neighborhoods;
+(NSArray*)graph:(PESGraph*)graph routeFrom:(Location*)a to:(Location*)b;

@end
