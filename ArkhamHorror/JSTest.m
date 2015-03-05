//
//  JSTest.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/24/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

@class JSObj;

#import "JSTest.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol NativeObjectExport <JSExport>
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *stuff;
@property (nonatomic) NSInteger val;
@property (nonatomic) CGSize structVal;
@property (strong, nonatomic) NSNumber *objNum;
@property (nonatomic) BOOL flag;
@property (strong, nonatomic) JSObj *child;
-(void)logSelf;
@end

@interface JSObj : NSObject <NativeObjectExport>
@end


@implementation JSObj
@synthesize name;
@synthesize stuff;
@synthesize val;
@synthesize structVal;
@synthesize objNum;
@synthesize flag;
@synthesize child;

+(instancetype)dummyWithChild {
    JSObj *jsObj = [[JSObj alloc] init];
    jsObj.name = @"Carl";
    jsObj.stuff = @[@"Alpha",@"Beta"];
    jsObj.val = 5;
    jsObj.structVal = CGSizeMake(1, 1);
    jsObj.objNum = @5;
    jsObj.flag = NO;
    jsObj.child = [JSObj dummy];
    return jsObj;
}
+(instancetype)dummy {
    JSObj *jsObj = [[JSObj alloc] init];
    jsObj.name = @"Betty";
    jsObj.stuff = @[@"Gamma",@"Delta"];
    jsObj.val = 5;
    jsObj.structVal = CGSizeMake(1, 1);
    jsObj.objNum = @5;
    jsObj.flag = NO;
    jsObj.child = nil;
    return jsObj;
}

-(void)logSelf {
    NSLog(@"%@, %@, %li, %@",self.name,self.stuff,self.val,self.objNum);
}

@end

@implementation JSTest

+(void)testJS {
    
    JSObj *dummy = [JSObj dummyWithChild];
    
    JSContext *js = [[JSContext alloc] initWithVirtualMachine:[[JSVirtualMachine alloc] init]];
    js[@"aNumber"] = @5;
    NSLog(@"js val %@",js[@"aNumber"]);
    js[@"ObjCObject"] = dummy;
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.name"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.stuff"]);
    
    NSLog(@"math test");
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.val"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.val += 5"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.val += 5"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.val += 5"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.val"]);
    NSLog(@"math test end");

    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.structVal"]); // returned [object Object] ?
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.objNum"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.flag"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.child"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.child.name"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.child.stuff"]);
    NSLog(@"ObjCObject? %@",[js evaluateScript:@"ObjCObject.child.child"]); // undefined instead of nil
    [dummy logSelf];





}

@end
