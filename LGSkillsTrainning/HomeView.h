//
//  HomeView.h
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ResourceInfo.h"
#define RECOMENDCELLHEIGHT 200
#define RESOURCECELLHEIGHT 100

@interface HomeView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView     * tableview;
    ViewController  * delegate;
    NSMutableArray  * resourceAry;
    NSMutableArray  * recomendAry;
}
@property(nonatomic,retain) NSMutableArray  * resourceAry;
@property(nonatomic,retain) NSMutableArray  * recomendAry;
@property(nonatomic,assign) ViewController  * delegate;

-(IBAction)buttonTap:(id)sender;
@end
