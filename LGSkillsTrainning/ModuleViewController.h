//
//  ModuleViewController.h
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
//@protocol  ModuleViewControllerDelegate <NSObject>
//
//- (void)moduleViewControllerBackBtnTapBlock:(id)sender;
//
//@end
@interface ModuleViewController : UIViewController
{
//    NSObject <ModuleViewControllerDelegate> *delegate;
    UIButton *backBtn;
}
@property(nonatomic,retain)UIButton *backBtn;
//@property (nonatomic, assign) NSObject <ModuleViewControllerDelegate> * delegate;
 
@end
