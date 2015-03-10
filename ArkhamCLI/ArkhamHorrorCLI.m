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
@end

@implementation ArkhamHorrorCLI

+(int)run {
    BOOL gameOver = NO;
    int exitCode = 0;
    Game *game = [Game initializeWithSettings:@{}]; // init singleton
    ArkhamHorrorCLI *cli = [[ArkhamHorrorCLI alloc] init];
    game.uiDelegate = cli;
    while (!gameOver) {
        [game runPhase]; // game sends out event requests
        [cli processEventsQueue]; // game dispatches and resolves events
    }
    return exitCode;
}

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
    [self println:[self getTerminalInput:@"Prompt:"]];
}

-(void)enqueueInvestigatorEvent:(AHInvestigatorEvent)callback {
    int idx = 1;
    int selection = [self getInt];
    
}

-(void)enqueueGameEvent:(AHGameEvent)callback {
    NSLog(@"self.game %@",[Game currentGame]);
    callback([Game currentGame]);
}

@end
