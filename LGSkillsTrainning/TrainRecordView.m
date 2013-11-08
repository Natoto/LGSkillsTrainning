//
//  TrainRecordView.m
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import "TrainRecordView.h"

@implementation TrainRecordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self layoutmySubviews];
    }
    return self;
}

-(void)dealloc
{
    [trainRectableview release]; trainRectableview=nil;
    [trainRecList release]; trainRecList=nil;
    [super dealloc];
}

-(void)layoutmySubviews
{
    CGRect rect=self.bounds;
    rect.size.height=rect.size.height-80;
    trainRectableview=[[UITableView alloc] initWithFrame:rect];
    trainRectableview.delegate=self;
    trainRectableview.dataSource=self;
    [self addSubview:trainRectableview];
    
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    if (trainRecList.count) {
    return 20;
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
        cell.textLabel.text=[NSString stringWithFormat:@"%d",indexPath.row]; 
        cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.frame] autorelease];
        cell.selectedBackgroundView.backgroundColor = [UIColor brownColor];
        
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
 