//
//  WordsBookView.h
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordsBookView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *wordtableview;
    NSArray *wordList;
}
@end
