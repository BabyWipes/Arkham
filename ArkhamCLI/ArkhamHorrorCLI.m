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
@interface ArkhamHorrorCLI () <ArkhamHorrorUIAPI>
@property (strong, nonatomic) Game *game;
@end

@implementation ArkhamHorrorCLI

+(int)run {
    //start up state machine
    BOOL gameOver = NO;
    int exitCode = 0;
    Game *game = [Game initializeWithSettings:@{}]; // init singleton
    ArkhamHorrorCLI *cli = [[ArkhamHorrorCLI alloc] init];
    game.uiDelegate = cli;
    NSLog(@"finished startup");
    while (!gameOver) {
        [game runPhase]; // sends out
        [cli processEventsQueue];
    }
    return exitCode;
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
    [self println:[self getTerminalInput:@"Prompt:"]];
}

-(void)enqueueEvent {
    NSLog(@"core requested enqueueEvent");
}

@end
