//
//  AppDelegate.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "PESImp.h"
#import "Game.h"
#import "PESGraphNode.h"
#import "Neighborhood.h"
#import "PESGraphRoute.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [PESImp testGraph];
    PESGraph *graph = [PESImp setupBoardGraph:[Game currentGame].neighborhoods];
    
    for (Neighborhood *hood in [Game currentGame].neighborhoods){
        PESGraphNode *streetNode = graph.nodes[hood.name];
        NSLog(@"street %@",streetNode.identifier);
        for (PESGraphNode *node in [[graph neighborsOfNode:streetNode] allObjects]){
            NSLog(@"--- neighbor: %@",node.identifier);
        }
    }
    
    PESGraphRoute *route = [graph shortestRouteFromNode:graph.nodes[@"Woods"] toNode:graph.nodes[@"Independence Square"]];
    NSLog(@"route %@",route);
    NSLog(@"route len %f",route.length);


    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
