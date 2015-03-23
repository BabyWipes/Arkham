//
//  ArkhamHorrorUIAPI.h
//  ArkhamHorror
//
//  Created by Michael Cornell on 3/10/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#ifndef ArkhamHorror_ArkhamHorrorUIAPI_h
#define ArkhamHorror_ArkhamHorrorUIAPI_h



typedef void(^AHRollEvent)(NSUInteger roll);
typedef void(^AHSkillCheckEvent)(NSArray *rolls);
typedef void(^AHSelectEvent)(NSArray* selected, NSArray *rejected);

typedef void(^AHAncientOneSelectEvent)(NSString *selected);
typedef void(^AHPlayerSelectEvent)(NSString *selected, BOOL done);
typedef void(^AHSkillsFocusEvent)(void);
typedef void(^AHEvent)(void);

@protocol ArkhamHorrorUIAPI <NSObject>
@property (strong, nonatomic) NSMutableArray *eventsQueue;

-(void)enqueueAncientOneSetup:(AHAncientOneSelectEvent)callback;
-(void)enqueuePlayerSetup:(AHPlayerSelectEvent)callback;

-(void)enqueueQuitEvent:(AHEvent)callback push:(BOOL)pushToFront;
-(void)enqueueSelectionEvent:(NSArray*)selections select:(NSUInteger)select callback:(AHSelectEvent)callback push:(BOOL)pushToFront;
-(void)enqueueDieRollEvent:(AHRollEvent)callback push:(BOOL)pushToFront;
-(void)enqueueSkillCheckEvent:(NSInteger)dieToRoll difficulty:(NSInteger)difficulty callback:(AHSkillCheckEvent)callback push:(BOOL)pushToFront;

-(void)enqueueFocusEvent:(AHSkillsFocusEvent)callback;

-(void)priority:(BOOL)cutsLine doEvent:(AHEvent)callback;

@end


#endif
