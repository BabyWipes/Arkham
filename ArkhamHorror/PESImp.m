//
//  PESImp.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/9/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "PESImp.h"
#import "PESGraph.h"
#import "PESGraphNode.h"
#import "PESGraphEdge.h"
#import "PESGraphRoute.h"
#import "PESGraphRouteStep.h"

#import "Neighborhood.h"
#import "Location.h"

@implementation PESImp

+(void)testGraph {
    PESGraph *graph = [[PESGraph alloc] init];
    
    // Create four basic nodes, connect them, add them to the graph,
    // and make sure the graph contains them all.
    
    PESGraphNode *aNode = [PESGraphNode nodeWithIdentifier:@"A"];
    PESGraphNode *bNode = [PESGraphNode nodeWithIdentifier:@"B"];
    PESGraphNode *cNode = [PESGraphNode nodeWithIdentifier:@"C"];
    PESGraphNode *dNode = [PESGraphNode nodeWithIdentifier:@"D"];
    
    [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:@"A <-> B" andWeight:@4] fromNode:aNode toNode:bNode];
    [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:@"B <-> A" andWeight:@4] fromNode:bNode toNode:aNode];
    [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:@"B <-> A" andWeight:@5] fromNode:bNode toNode:aNode];
    [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:@"B <-> A" andWeight:@4] fromNode:bNode toNode:aNode];
    [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:@"B <-> A" andWeight:@2] fromNode:bNode toNode:aNode];
    
    [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:@"B <-> D" andWeight:@5] fromNode:bNode toNode:dNode];
    [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:@"C <-> D" andWeight:@1] fromNode:cNode toNode:dNode];
    [graph addBiDirectionalEdge:[PESGraphEdge edgeWithName:@"C <-> A" andWeight:@4] fromNode:cNode toNode:aNode];
    
    PESGraphRoute *route = [graph shortestRouteFromNode:aNode toNode:dNode];
    for (PESGraphRouteStep *step in route.steps){
        NSLog(@"step %@",step.node.identifier);
    }
    NSLog(@"route %f",route.length);
}

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
        
        if ([hood isKindOfClass:[MerchantDistrictNeighborhood class]] && [(MerchantDistrictNeighborhood*)hood secondaryColorlessStreetConnection]){
            adjecent = [(MerchantDistrictNeighborhood*)hood secondaryColorlessStreetConnection].street;
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

@end

