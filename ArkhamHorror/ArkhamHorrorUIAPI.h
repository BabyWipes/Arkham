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
typedef void(^AHSelectEvent)(NSArray* output);

@protocol ArkhamHorrorUIAPI <NSObject>
@property (strong, nonatomic) NSMutableArray *eventsQueue;
-(void)enqueueSelectionEvent:(NSArray*)selections select:(NSUInteger)select callback:(AHSelectEvent)callback;
-(void)enqueueDieRollEvent:(AHRollEvent)callback;

@end


#endif
