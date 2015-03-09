//
//  ShortestPath.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/6/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "ShortestPath.h"

@interface Edge : NSObject
@property (strong, nonatomic) NSString *a;
@property (strong, nonatomic) NSString *b;
@property (nonatomic) NSInteger dist;
+(instancetype)a:(NSString*)a b:(NSString*)b dist:(NSUInteger)d;
@end

@implementation Edge
+(instancetype)a:(NSString*)a b:(NSString*)b dist:(NSUInteger)d {
    Edge *edge = [[Edge alloc] init];
    edge.a = a;
    edge.b = b;
    edge.dist = d;
    return edge;
}
@end

@interface Vertex : NSObject <NSCopying>
@property (strong, nonatomic) NSString *nodeID;
@property (nonatomic) NSInteger dist; // MAX initially
@property (strong, nonatomic) Vertex *previous;
@property (strong, nonatomic) NSMutableDictionary *neighbors;
-(instancetype)initWithID:(NSString*)nodeID;
@end

@implementation Vertex

-(id)copyWithZone:(NSZone *)zone {
    Vertex *copy = [[Vertex alloc] initWithID:self.nodeID];
    copy.dist = self.dist;
    copy.previous = self.previous; //[self.previous copy];
    copy.neighbors = self.neighbors;//[self.neighbors copy];
    return copy;
}

-(instancetype)initWithID:(NSString*)nodeID {
    self = [super init];
    if (self){
        self.nodeID = nodeID;
        self.dist = LONG_MAX;
        self.previous = nil;
        self.neighbors = [NSMutableDictionary new];
    }
    return self;
}

-(void)printPath {
    if ([self isEqual:self.previous]){
        printf("%s",self.nodeID.UTF8String);
    }
    else if (self.previous == nil){
        printf("%s(unreached)",self.nodeID.UTF8String);

    }
    else {
        [self.previous printPath];
        printf(" -> %s(%li)",self.nodeID.UTF8String,self.dist);
    }
}

-(NSString*)description {
    return [NSString stringWithFormat:@"%@ nodeID:%@, dist:%@",[super description],self.nodeID,self.dist == LONG_MAX ? @"Unknown" : @(self.dist)];
}
@end

@interface Graph : NSObject
@property (strong, nonatomic) NSMutableDictionary *graph;
@end

@implementation Graph

-(instancetype)initWithEdges:(NSArray*)edges {
    self = [super init];
    if (self){
        self.graph = [NSMutableDictionary new];
        for (Edge *edge in edges){
            if (!self.graph[edge.a]){
                self.graph[edge.a] = [[Vertex alloc] initWithID:edge.a];
            }
            if (!self.graph[edge.b]){
                self.graph[edge.b] = [[Vertex alloc] initWithID:edge.b];
            }
        }
        BOOL undirected = NO;
        for (Edge *edge in edges){
            Vertex *vertA = self.graph[edge.a];
            Vertex *vertB = self.graph[edge.b];
            vertA.neighbors[vertB] = @(edge.dist);
            if (undirected){
                vertB.neighbors[vertA] = @(edge.dist);
            }
        }
    }
    return self;
}

-(void)startDijkstra:(NSString*)startNode {
    if (!self.graph[startNode]){
        NSLog(@"Graph doesn't contain start vertex %@",startNode);
        return;
    }
    Vertex *source = self.graph[startNode];
    
    id q = [NSMutableArray new];   //  NavigableSet<Vertex> q = new TreeSet<>();
    
    for (Vertex *v in self.graph.objectEnumerator){
        if (v == source){
            v.previous = source;
        }
        v.dist = (v == source ? 0 : LONG_MAX);
        [q addObject:v];
    }
    [self sortMArray:q];
    [self dijkstra:q];
}

-(void)dijkstra:(NSMutableArray*)q {
    Vertex *u;
    Vertex *v;
    while (!q.count == 0){
        u = [q firstObject]; // vertex with shortest distance
       // NSLog(@"U %@, dist:%li",u,u.dist);
        [q removeObject:u];
        if (u.dist == LONG_MAX) {
           // NSLog(@"got unreachable node");
            break; // ignore this + other remaining verticies, they are unreachable
        }

        for (Vertex *neighbor in [u.neighbors keyEnumerator]){
            v = neighbor;
            NSInteger vDist = [u.neighbors[v] integerValue];
            NSInteger altDist = u.dist + vDist;
            
            if (altDist < v.dist){ // found short path to this neighbor
                [self removeNode:q nodeID:v.nodeID];
                v.dist = altDist;
                v.previous = u;
                [q addObject:v];
                [self sortMArray:q]; // resort based on changed dist

                [self updateGraph:u];
                [self updateGraph:v];

            }
        }
    }
}

-(void)updateGraph:(Vertex*)v {
    self.graph[v.nodeID] = v;
}

-(void)removeNode:(NSMutableArray*)mArray nodeID:(NSString*)nodeName {
    for (Vertex *v in [mArray copy]){
        if ([v.nodeID isEqualToString:nodeName]){
            [mArray removeObject:v];
        }
    }
}

-(void)sortMArray:(NSMutableArray*)mArray {
    [mArray sortUsingComparator:^NSComparisonResult(Vertex *a, Vertex *b) {
        return [@(a.dist) compare:@(b.dist)];
    }];
}

-(void)printPath:(NSString*)endNode {
    if (!self.graph[endNode]){
        NSLog(@"Graph doesn't contain end vertex %@",endNode);
        return;
    }
    [self.graph[endNode] printPath];
    printf("\n");
}

@end

@interface ShortestPath ()
@end

@implementation ShortestPath

+(void)test {
    Graph *graph = [[Graph alloc] initWithEdges:@[[Edge a:@"1" b:@"2" dist:7],
                                                  [Edge a:@"1" b:@"3" dist:9],
                                                  [Edge a:@"1" b:@"6" dist:14],
                                                  [Edge a:@"2" b:@"3" dist:10],
                                                  [Edge a:@"2" b:@"4" dist:15],
                                                  [Edge a:@"3" b:@"4" dist:11],
                                                  [Edge a:@"3" b:@"6" dist:2],
                                                  [Edge a:@"4" b:@"5" dist:6],
                                                  [Edge a:@"5" b:@"6" dist:9]]];
    
    [graph startDijkstra:@"1"];
    [graph printPath:@"1"];
    [graph printPath:@"2"];
    [graph printPath:@"3"];
    [graph printPath:@"4"];
    [graph printPath:@"5"];
    [graph printPath:@"6"];
    
}

@end
