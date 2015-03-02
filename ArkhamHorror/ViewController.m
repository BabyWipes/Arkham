//
//  ViewController.m
//  ArkhamHorror
//
//  Created by Michael Cornell on 2/23/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "ViewController.h"
#import "Investigator.h"
#import "SkillCheck.h"
#import "JSTest.h"
#import "Board.h"
#import "Game.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSArray *cards;

@property (weak, nonatomic) IBOutlet UITextView *textBox;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.titleLabel.text = [NSString stringWithFormat:@"Arkham Horror v:%@",[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]];
    self.titleLabel.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.1];
    
    self.textBox.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.1];
    self.inputField.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.1];
    
    self.textBox.text = @"";
    self.inputField.text = @"";
    
    [self loadNewGame];
    //[self loadDefaultGame];
    //[JSTest testJS];
}

-(void)loadNewGame {
    Game *game = [Game arkhamHorror];
}


-(void)loadDefaultGame {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"GameDefaults" ofType:@"plist"];
    NSDictionary* gameDefaults =  [NSDictionary dictionaryWithContentsOfFile:path];
    if (gameDefaults) {
        NSArray *investigators = gameDefaults[@"Investigators"];
        Investigator *dummy = [[Investigator alloc] initWithProperties:investigators[0]];
        NSLog(@"Dummy %@",dummy);
        NSLog(@"dummy skills : %@",dummy.skillsString);
        NSLog(@"Dummy: %@, %@",dummy.name,dummy.occupation);
        NSLog(@"Dummy: $%li, Focus:%li, Clues:%li",dummy.money,dummy.focus,dummy.clues);

    }
    else {
        NSLog(@"Game Defaults couldn't be loaded!");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - IO

-(void)appendToTextBox:(NSString*)message {
    self.textBox.text = [NSString stringWithFormat:@"%@\n%@",self.textBox.text,message];
}
-(BOOL)getBool {
    NSString *input = [self getInput:@"Please enter a 1 or 0"];
    NSInteger boolVal = [input boolValue];
    return boolVal;
}
-(NSInteger)getInt {
    NSString *input = [self getInput:@"Please enter a number"];
    NSInteger intVal = [input integerValue];
    return intVal;
}

#pragma mark - Cocoa
-(NSString*)getTerminalInput:(NSString*)prompt {
    NSLog(@"%@",prompt);
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSData *inputData = [input availableData];
    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
    inputString = [inputString stringByTrimmingCharactersInSet: [NSCharacterSet newlineCharacterSet]];
    return inputString;
}

@end
