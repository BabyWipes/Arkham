//
//  PathFinder.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/9/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "PathFinder.h"
#import "PESGraph.h"
#import "PESGraphNode.h"
#import "PESGraphEdge.h"
#import "PESGraphRoute.h"
#import "PESGraphRouteStep.h"

#import "Neighborhood.h"
#import "Location.h"

#import "Game.h"

@implementation PathFinder

+(PESGraph*)setupBoardGraph:(NSArray*)neighborhoods {
    PESGraph *graph = [[PESGraph alloc] init];
    NSMutableDictionary *hoodNodes = [NSMutableDictionary new];

    // make a node for each street
    for (Neighborhood *hood in neighborhoods){
        hoodNodes[hood.street.name] = [PESGraphNode nodeWithIdentifier:hood.street.name];
    }
    
    PESGraphNode *hoodNode;
    Location *adjecent;
    PESGraphNode *adjecentNode;
    NSString *edgeName;
    
    // connect streets
    for (Neighborhood *hood in neighborhoods){
        hoodNode = hoodNodes[hood.street.name];
        if (hood.blackStreetConnection){
            adjecent = hood.blackStreetConnection.street; // bidirection, the other direction is a white connection
            adjecentNode = hoodNodes[adjecent.name];
            
            edgeName = [NSString stringWithFormat:@"%@ <-> %@",hood.name,adjecent.name];
            [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:edgeName andWeight:@1] fromNode:hoodNode toNode:adjecentNode];
        }
        
        if (hood.colorlessStreetConnection){
            adjecent = hood.colorlessStreetConnection.street;
            adjecentNode = hoodNodes[adjecent.name];
            
            edgeName = [NSString stringWithFormat:@"%@ <-> %@",hood.name,adjecent.name];
            [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:edgeName andWeight:@1] fromNode:hoodNode toNode:adjecentNode];
        }
        
        if (hood.hasSecondaryColorlessStreet && hood.secondaryColorlessStreetConnection){
            adjecent = hood.secondaryColorlessStreetConnection.street;
            adjecentNode = hoodNodes[adjecent.name];
            
            edgeName = [NSString stringWithFormat:@"%@ <-> %@",hood.name,adjecent.name];
            [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:edgeName andWeight:@1] fromNode:hoodNode toNode:adjecentNode];
        }
        
        // make and connect a node for each location in neighborhood
        for (Location *loc in hood.locations){
            adjecentNode = [PESGraphNode nodeWithIdentifier:loc.name];
            edgeName = [NSString stringWithFormat:@"%@ <-> %@",hood.name,loc.name];
            [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:edgeName andWeight:@1] fromNode:hoodNode toNode:adjecentNode];
        }
    }
    return graph;
}

+(NSArray*)graph:(PESGraph*)graph routeFrom:(Location*)a to:(Location*)b {
    PESGraphNode *aNode = graph.nodes[a.name];
    PESGraphNode *bNode = graph.nodes[b.name];
    PESGraphRoute *route = [graph shortestRouteFromNode:aNode toNode:bNode];
    NSMutableArray *ret = [NSMutableArray new];
    for (PESGraphRouteStep *step in route.steps){
        Location *loc = [[Game currentGame] locationNamed:step.node.identifier];
        if (loc){
            [ret addObject:loc];
        }
    }
    return [NSArray arrayWithArray:ret];
}

@end

