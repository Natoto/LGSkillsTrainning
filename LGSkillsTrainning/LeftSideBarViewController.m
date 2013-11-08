//
//  LeftNavViewController.m
//  SideBarNavDemo
//
//  Created by JianYe on 12-12-11.
//  Copyright (c) 2012年 JianYe. All rights reserved.
//

#import "LeftSideBarViewController.h"
#import "ViewController.h"
#import "SideBarSelectedDelegate.h"
@interface LeftSideBarViewController ()
{
    NSArray *_modeList;
    int _selectIdnex;
    NSArray *_sysSetList;
}
@end

@implementation LeftSideBarViewController

@synthesize mainTableView,delegate;

-(void)dealloc
{
    GVRelease(mainTableView);
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:100/255 green:100/255 blue:100/255 alpha:0.8];
    
    mainTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 331, 704)];
    mainTableView.dataSource=self;
    mainTableView.delegate=self;
    mainTableView.backgroundColor=[UIColor clearColor];
    mainTableView.separatorColor=[UIColor grayColor];
    [self setExtraCellLineHidden:mainTableView];

      [self.view addSubview:mainTableView];
    _modeList = @[@"看报",@"情景对话",@"求职面试",@"洽谈"];
    _sysSetList=@[@"清除缓存"];
    if ([delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        [delegate leftSideBarSelectWithController:[self subConWithIndex:0]];
        
        _selectIdnex = 0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source


-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    
    UIView *view =[ [UIView alloc]init];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
    [view release];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1) {
        return [_sysSetList count];
    }
    else
    return [_modeList count];
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tableHeaderView=[[[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 40)] autorelease];
    tableHeaderView.backgroundColor=[UIColor darkGrayColor];
    UILabel *lbltitle=[[[UILabel alloc] initWithFrame:CGRectMake(5, 0, 150, 40)] autorelease];
    if (section==0) {
        lbltitle.text= @"实用技能";
    }
    else if (section==1)
    {
         lbltitle.text= @"系统设置";
    }
    lbltitle.textColor=[UIColor lightGrayColor];
    lbltitle.backgroundColor=[UIColor clearColor];
    [tableHeaderView addSubview:lbltitle];
    return tableHeaderView;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"section%dcell%d",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        if (indexPath.section==0) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            cell.textLabel.text = [_modeList objectAtIndex:indexPath.row];
            cell.textLabel.textColor=[UIColor whiteColor];
            cell.textLabel.font=[UIFont systemFontOfSize:16];
        }
        else if (indexPath.section==1)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            cell.textLabel.text = [_sysSetList objectAtIndex:indexPath.row];
            cell.textLabel.textColor=[UIColor whiteColor];
            cell.textLabel.font=[UIFont systemFontOfSize:16];
        }

    }
    return cell;
}

//
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (section==0) {
//        return @"实用技能";
//    }
//    else if (section==1)
//    {
//        return @"系统设置";
//    }
//    return nil;
//}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}   

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        if (indexPath.row == _selectIdnex) {
            [delegate leftSideBarSelectWithController:nil];
        }else
        {
            [delegate leftSideBarSelectWithController:[self subConWithIndex:indexPath.row]];
        }
        
    }
    _selectIdnex = indexPath.row; 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UINavigationController *)subConWithIndex:(int)index
{
    ViewController *con = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    con.index = index+1;
    UINavigationController *nav= [[[UINavigationController alloc] initWithRootViewController:con] autorelease];
    nav.navigationBar.hidden = YES;
    return nav ;
}

@end
