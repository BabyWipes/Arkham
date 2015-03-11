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
    
    ArkhamHorrorCLI *cli = [[ArkhamHorrorCLI alloc] init];
    cli.eventsQueue = [NSMutableArray new];
    Game *game = [Game initializeWithSettings:@{}]; // init singleton
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
    [self processNextEvent]; // recursively resolves each event in order
    [self getTerminalInput:@"All events processed. Hit Enter to continue..."]; // just a halt to debugging
    
}

-(void)processNextEvent {
    if (self.eventsQueue.count > 0){
        void (^enqueuedBlock)(void) = [self.eventsQueue firstObject];
        [self.eventsQueue removeObject:enqueuedBlock];
        enqueuedBlock();
    }
}

-(void)enqueueDieRollEvent:(AHRollEvent)callback {
    void (^dieRollBlock)(void) = ^{
        NSUInteger roll = [Die d6];
        callback(roll);
        [self processNextEvent];
    };
    [self.eventsQueue addObject:dieRollBlock];
}

-(void)enqueueSelectionEvent:(NSArray *)selections select:(NSUInteger)select callback:(AHSelectEvent)callback {
    
}

@end
