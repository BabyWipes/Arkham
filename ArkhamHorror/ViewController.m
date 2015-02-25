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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSArray *cards;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [JSTest testJS];
    
    [super viewDidLoad];
    self.titleLabel.text = [NSString stringWithFormat:@"Arkham Horror v:%@",[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]];
    self.titleLabel.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.1];
    [self loadDefaultGame];
    [SkillCheck skillCheck:0];
    
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

@end
