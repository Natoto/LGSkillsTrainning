//
//  ViewController.h
//  RNFrostedSidebar
//
//  Created by Ryan Nystrom on 8/13/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//
#import "SidebarViewController.h"
#import <UIKit/UIKit.h>
//#import "RNFrostedSidebar.h" 
#import "ModuleViewController.h"
@interface ViewController : ModuleViewController


@property(nonatomic,assign)ViewController *delegate;
@property (nonatomic, retain) IBOutlet UIView *settingsView;
@property (nonatomic, retain) IBOutlet UIStepper *numberOfTabs;
@property (nonatomic, retain) IBOutlet UISegmentedControl *sectionAligment;

@property (assign,nonatomic) int index;
//
//- (IBAction)numberOfTabsValueChanged;
//- (IBAction)sectionAligmentValueChanged;
-(void)goToTestViewCtr:(id)sender;
@end
