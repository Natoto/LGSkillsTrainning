//
//  MYFavouriteView.h
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFavouriteView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *favtableview;
    NSArray *favList;
}
@end
