//
//  HomeView.m
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView
@synthesize delegate;
@synthesize resourceAry;
@synthesize recomendAry;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//        button.frame=CGRectMake(100, 100, 100, 50);
//        [button setTitle:@"next" forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:button];
        ResourceInfo *aResourceInfo1=[[[ResourceInfo alloc] init] autorelease];
        aResourceInfo1.resourcetitle=@"Asians worry that U. S. aid is a new colonialism";
        aResourceInfo1.priview=@"  SEOUL, South Korea, Feb. 16 — From America it may seem as if the United States is rescuing Asia from its economic mess, but gratitude is not the most striking emotion here in the region";
        
        recomendAry=[[NSMutableArray alloc] initWithObjects:aResourceInfo1, nil];
        resourceAry=[[NSMutableArray alloc] initWithObjects:aResourceInfo1,aResourceInfo1,aResourceInfo1,aResourceInfo1,aResourceInfo1,aResourceInfo1, nil];
        
        
        CGRect tbFrame= CGRectMake(0, 0, frame.size.width, frame.size.height-70);
        tableview=[[UITableView alloc] initWithFrame:tbFrame];
        tableview.backgroundColor=[UIColor clearColor];
        tableview.delegate=self;
        tableview.dataSource=self;
        [self addSubview:tableview];
    }
    return self;
}

-(void)dealloc
{
    
    GVRelease(recomendAry);
    GVRelease(resourceAry);
    GVRelease(tableview);
    delegate=nil;
    [super dealloc];
}

-(IBAction)buttonTap:(id)sender
{
    [delegate goToTestViewCtr:sender];
//    TestViewController *atestctr=[[TestViewController alloc] init];
//    [self.navigationController pushViewController:atestctr animated:YES];
//    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self buttonTap:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return recomendAry.count;
    }
    return resourceAry.count;
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        return 40;
    }
    return 0;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return RECOMENDCELLHEIGHT;
    }
    return RESOURCECELLHEIGHT;
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        return @"资源列表";
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier=[NSString stringWithFormat:@"sec%dcell%d",indexPath.section,indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        //TODO: 今日推荐
        if (indexPath.section==0) {
            cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
//            cell.textLabel.text=cellIdentifier;
            UIView *recomendView=[[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, RECOMENDCELLHEIGHT)] autorelease];
           
            ResourceInfo *aResourceInfo=[recomendAry objectAtIndex:indexPath.row];
            recomendView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"recomendViewColor"]];
            
            UILabel *lable=[[UILabel alloc] initWithFrame:CGRectMake(150, 40, 100, 30)];
            lable.text=@"推荐资料:";
            lable.textColor=[UIColor yellowColor];
            lable.backgroundColor=[UIColor clearColor];
            [recomendView addSubview:lable];
            [lable release];
            
            UILabel *lblTitle=[[UILabel alloc] initWithFrame:CGRectMake(250, 40, 700, 50)];
            lblTitle.textAlignment=NSTextAlignmentCenter;
            lblTitle.font=[UIFont boldSystemFontOfSize:18];
            lblTitle.backgroundColor=[UIColor clearColor];
            lblTitle.text=aResourceInfo.resourcetitle;
            [recomendView addSubview:lblTitle];
            [lblTitle release];
            
            UILabel *lblPreview=[[UILabel alloc] initWithFrame:CGRectMake(120, 80, 850, 90)];
            lblPreview.textAlignment=NSTextAlignmentLeft;
            lblPreview.font=[UIFont systemFontOfSize:15];
            lblPreview.numberOfLines=0;
            lblPreview.lineBreakMode = NSLineBreakByWordWrapping;// 自动折行
            lblPreview.backgroundColor=[UIColor clearColor];
            lblPreview.text=aResourceInfo.priview;
            [recomendView addSubview:lblPreview];            
            [lblPreview release];
            
            [cell.contentView addSubview:recomendView];
            
        }
        // TODO: 资源列表
        else
        {
            cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
//            cell.textLabel.text=cellIdentifier;
            
            ResourceInfo *aResourceInfo=[resourceAry objectAtIndex:indexPath.row];
            
             UIView *resourceView=[[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, RESOURCECELLHEIGHT)] autorelease];
            
            UILabel *lblTitle=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 400, 20)];
            lblTitle.textAlignment=NSTextAlignmentLeft;
            lblTitle.font=[UIFont boldSystemFontOfSize:18];
//            lblTitle.backgroundColor=[UIColor clearColor];
            lblTitle.text=aResourceInfo.resourcetitle;
            [resourceView addSubview:lblTitle];
            [lblTitle release];
            
            UILabel *lblPreview=[[UILabel alloc] initWithFrame:CGRectMake(10, 30, self.frame.size.width-20, 60)];
            lblPreview.textAlignment=NSTextAlignmentLeft;
            lblPreview.font=[UIFont systemFontOfSize:15];
            lblPreview.numberOfLines=0;
            lblPreview.lineBreakMode = NSLineBreakByWordWrapping;// 自动折行
//            lblPreview.backgroundColor=[UIColor clearColor];
            lblPreview.text=aResourceInfo.priview;
            [resourceView addSubview:lblPreview];
            [lblPreview release];
            
            [cell.contentView addSubview:resourceView];

            
        }

    }
    return cell;
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
