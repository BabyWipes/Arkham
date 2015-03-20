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
typedef void(^AHSelectEvent)(NSArray* selected, NSArray *rejected);
typedef void(^AHQuitEvent)(void);

typedef void(^AHAncientOneSelectEvent)(NSString *selected);
typedef void(^AHPlayerSelectEvent)(NSString *selected, BOOL done);


@protocol ArkhamHorrorUIAPI <NSObject>
@property (strong, nonatomic) NSMutableArray *eventsQueue;

-(void)enqueueAncientOneSetup:(AHAncientOneSelectEvent)callback;
-(void)enqueuePlayerSetup:(AHPlayerSelectEvent)callback;

-(void)enqueueQuitEvent:(AHQuitEvent)callback push:(BOOL)pushToFront;
-(void)enqueueSelectionEvent:(NSArray*)selections select:(NSUInteger)select callback:(AHSelectEvent)callback push:(BOOL)pushToFront;
-(void)enqueueDieRollEvent:(AHRollEvent)callback push:(BOOL)pushToFront;

@end


#endif
