//
//  ArkhamHorrorUIAPI.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/10/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import <Foundation/Foundation.h>

// shorthand notation to make priority clearer
#define push(_eventName)    priority:YES _eventName
#define enqueue(_eventName) priority: NO _eventName

typedef void(^AHRollEvent)(NSUInteger roll);
typedef void(^AHSkillCheckEvent)(NSArray *rolls);
typedef void(^AHSelectEvent)(NSArray* selected, NSArray *rejected);

typedef void(^AHAncientOneSelectEvent)(NSString *selected);
typedef void(^AHPlayerSelectEvent)(NSString *selected, BOOL done);

typedef void(^AHRandomEvent)(NSInteger random);
typedef void(^AHEvent)(void);

@protocol ArkhamHorrorUIAPI <NSObject>
@property (strong, nonatomic) NSMutableArray *eventsQueue;

-(void)priority:(BOOL)cutsLine ancientOneSetup:(AHAncientOneSelectEvent)callback;
-(void)priority:(BOOL)cutsLine playerSetupEvent:(AHPlayerSelectEvent)callback;
-(void)priority:(BOOL)cutsLine selectionEvent:(NSArray*)selections select:(NSUInteger)select callback:(AHSelectEvent)callback;
-(void)priority:(BOOL)cutsLine focusEvent:(AHEvent)callback;
-(void)priority:(BOOL)cutsLine dieRollEvent:(AHRollEvent)callback;
-(void)priority:(BOOL)cutsLine skillCheckEvent:(NSInteger)dieToRoll difficulty:(NSInteger)difficulty callback:(AHSkillCheckEvent)callback;
-(void)priority:(BOOL)cutsLine randomEvent:(NSInteger)max callback:(AHRandomEvent)callback;
-(void)priority:(BOOL)cutsLine event:(AHEvent)callback;

@end

