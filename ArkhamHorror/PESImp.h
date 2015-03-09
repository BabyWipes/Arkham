//
//  PESImp.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/9/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PESGraph.h"

@interface PESImp : NSObject
+(void)testGraph;
+(PESGraph*)setupBoardGraph:(NSArray*)neighborhoods;
@end
