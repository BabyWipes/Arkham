//
//  ArkhamHorrorCLI.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/10/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "ArkhamHorrorCLI.h"
#import "ArkhamHorrorUIAPI.h"
#import "Game.h"
#import "Die.h"

@interface ArkhamHorrorCLI () <ArkhamHorrorUIAPI>
@end

@implementation ArkhamHorrorCLI
@synthesize eventsQueue;
+(int)run {
    BOOL gameOver = NO;
    int exitCode = 0;
    Game *game = [Game initializeWithSettings:@{}]; // init singleton
    ArkhamHorrorCLI *cli = [[ArkhamHorrorCLI alloc] init];
    cli.eventsQueue = [[NSOperationQueue alloc] init];
    cli.eventsQueue.name = @"com.sleepygarden.ArkhamHorror.cliEvents";
    [cli.eventsQueue setQualityOfService:NSQualityOfServiceUserInteractive];
    cli.eventsQueue.maxConcurrentOperationCount = 1;
    cli.eventsQueue.suspended = YES;
    game.uiDelegate = cli;
    while (!gameOver) {
        [game runPhase]; // game sends out event requests
        [cli processEventsQueue]; // game dispatches and resolves events
    }
    return exitCode;
}

#pragma mark - Console I/O

-(BOOL)getBool {
    NSString *rawBool = [self getTerminalInput:@"Enter Bool:"];
    return ([[rawBool lowercaseString] isEqualToString:@"yes"] || [[rawBool lowercaseString] isEqualToString:@"y"]);
}

-(int)getInt {
    NSString *rawInt = [self getTerminalInput:@"Enter Int:"];
    return [rawInt intValue];
}

-(NSString*)getTerminalInput:(NSString*)prompt {
    [self print:prompt];
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSData *inputData = [input availableData];
    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
    inputString = [inputString stringByTrimmingCharactersInSet: [NSCharacterSet newlineCharacterSet]];
    return inputString;
}

-(void)print:(NSString*)string {
    printf("%s",[string UTF8String]);
}
-(void)println:(NSString*)string {
    printf("%s\n",[string UTF8String]);
}

#pragma mark - ArkhamHorror UI API

-(void)processEventsQueue {
    [self println:[self getTerminalInput:@"Hit Enter to continue..."]];
    
    self.eventsQueue.suspended = NO;
    [self.eventsQueue waitUntilAllOperationsAreFinished]; // blocks current thread until
    self.eventsQueue.suspended = YES;
    
}

-(void)enqueueSelectionEvent:(NSArray *)selections select:(NSUInteger)select callback:(AHSelectEvent)callback {
    NSLog(@"select %lu items among %@",select,selections);
    NSArray *selectedItems = @[];
    callback(selectedItems);
}

-(void)enqueueDieRollEvent:(AHRollEvent)callback {
    NSUInteger opCount = self.eventsQueue.operationCount;
    NSLog(@"enqueueing %lu, current thread %@",opCount,[NSThread currentThread]);

    [self.eventsQueue addOperationWithBlock:^{
        // background work
        NSLog(@"dequeueing %lu, current thread %@", opCount, [NSThread currentThread]);

        NSUInteger roll = [Die d6];
        callback(roll);
    }];
    
    
}

@end
