//
//  WordsBookView.m
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import "WordsBookView.h"
#import "WordInfo.h"
@implementation WordsBookView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self loadDataforViews];
        [self layoutmySubviews];
    }
    return self;
}
-(void)dealloc
{
    [wordtableview release]; wordtableview =nil;
    [wordList release];
    [super dealloc];
}

-(void)loadDataforViews
{
    WordInfo *awordInfo=[[[WordInfo alloc] init] autorelease];
    awordInfo.wordName=@"geopolitics";
    awordInfo.wordSoundmark=@"[,dʒɪ（ː）əʊ'pɒlɪtɪks]";
    awordInfo.wordMeaning=@"n. 地缘政治学；地理政治论 地缘政治学（Geopolitics）是探讨地理位置对国际关系影响的学说。该学说认为国家无论采取何种对外政策，都会受制于各种地理要素和人文要素的共同影响。";
    
    wordList= [[NSArray  alloc] initWithObjects:awordInfo,awordInfo,awordInfo,awordInfo,awordInfo,awordInfo,awordInfo,awordInfo,awordInfo,awordInfo,awordInfo, nil];
    
    
}

-(void)layoutmySubviews
{
    CGRect rect=self.bounds;
    rect.size.height=rect.size.height-80;
    wordtableview=[[UITableView alloc] initWithFrame:rect];
    wordtableview.delegate=self;
    wordtableview.dataSource=self;
    [self addSubview:wordtableview];
    
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{ 
//    if (wordList.count) {
        return wordList.count;
//    }
//    return 1;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellidf=[NSString stringWithFormat:@"cell%d",indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidf];
    if (!cell) {
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidf] autorelease];
        WordInfo *awordinfo=[wordList objectAtIndex:indexPath.row];
        UILabel *lblwordname=[[UILabel alloc] initWithFrame:CGRectMake(10, 2, 200, 30)];
        lblwordname.backgroundColor=[UIColor clearColor];
        lblwordname.text=awordinfo.wordName;
        lblwordname.font=[UIFont boldSystemFontOfSize:18];
        [cell.contentView addSubview:lblwordname];
        [lblwordname release];
        
        UILabel *lblwordSoundmark=[[UILabel alloc] initWithFrame:CGRectMake(10, 32, 200, 30)];
        lblwordSoundmark.backgroundColor=[UIColor clearColor];
        lblwordSoundmark.text=[NSString stringWithFormat:@"音标：%@",awordinfo.wordSoundmark ];
        lblwordSoundmark.textColor=[UIColor blueColor];
        lblwordSoundmark.font=[UIFont systemFontOfSize:16];
        [cell.contentView addSubview:lblwordSoundmark];
        [lblwordSoundmark release];
        
        UILabel *lblwordMeaning=[[UILabel alloc] initWithFrame:CGRectMake(10, 62, 1000, 60)];
        lblwordMeaning.backgroundColor=[UIColor clearColor];
        lblwordMeaning.text=[NSString stringWithFormat:@"词义解释：%@",awordinfo.wordMeaning];
        lblwordMeaning.font=[UIFont systemFontOfSize:16];         
        lblwordMeaning.numberOfLines=0;
        lblwordMeaning.lineBreakMode = NSLineBreakByWordWrapping;// 自动折行
        [cell.contentView addSubview:lblwordMeaning];
        [lblwordMeaning release];
        
        //自定义选中后的背景颜色
//        UIView *view_bg = [[[UIView alloc]initWithFrame:cell.frame]autorelease];
//        view_bg.backgroundColor = [UIColor clearColor];
//        cell.selectedBackgroundView = view_bg;
        cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
        cell.selectedBackgroundView.backgroundColor = [UIColor brownColor];
        
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
