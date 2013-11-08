//
//  AppDelegate.h
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-26.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property(strong,nonatomic)UINavigationController *navigationCtr;
@end
