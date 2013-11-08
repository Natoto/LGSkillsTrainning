//
//  ViewController.m
//  RNFrostedSidebar
//
//  Created by Ryan Nystrom on 8/13/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//
 
#import "ViewController.h"
#import "UINavigationBar+customBar.h"
#import <QuartzCore/QuartzCore.h>
#import "TSTabView.h"
#import "TSTabViewModel.h"
#import "TSDefines.h"
#import "Module.h"
@interface ViewController ()<TSTabViewDelegate>
{
    
    TSTabView *_tabView;  
    TSTabViewModel *_tabViewModel;
    
}
@property (nonatomic, strong) NSArray *dataSources;

@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
@end

@implementation ViewController

-(void)dealloc
{
    [_tabViewModel release];
    
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
        
        self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
        //    [self initNavgationbar];
        [self.backBtn addTarget:self action:@selector(showLeftSideBar:) forControlEvents:UIControlEventTouchUpInside];
        
        self.view.backgroundColor=[UIColor whiteColor];
        self.settingsView.layer.cornerRadius = 4;
        self.settingsView.layer.shadowOpacity = 0.5;
        self.settingsView.layer.shadowOffset = CGSizeMake(2, 4);
        
        
        _tabView = [self createTabView3WithFrame:CGRectMake(0,  NAVIGATIONBARHEIGHT , self.view.frame.size.width ,self.view.frame.size.height-NAVIGATIONBARHEIGHT)];
        _tabView.backgroundColor = [UIColor grayColor];
        _tabView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _tabView.delegate = self;
        [self.view addSubview:_tabView];
        
        _tabViewModel = [[TSTabViewModel alloc] initWithTabView:_tabView];
        [_tabViewModel setTabs:@[[self createSection3WithIndex:@0],
         [self createSection3WithIndex:@1],
         [self createSection3WithIndex:@2],
         [self createSection3WithIndex:@3]]];
        
        self.dataSources = @[
                             _tabViewModel
                             ];
        
        [self.dataSources enumerateObjectsUsingBlock:^(TSTabViewModel *dataSource, NSUInteger idx, BOOL *stop) {
            dataSource.tabView.navigationMenu.sectionsAligment = UIViewContentModeScaleAspectFill;
        }];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}
 

-(void)goToTestViewCtr:(id)sender
{
    ModuleViewController *atestctr=[[ModuleViewController alloc] initWithNibName:nil bundle:nil];
   
    [self.navigationController pushViewController:atestctr animated:YES];
    
    [atestctr release];
}
-(IBAction)TableviewTest:(id)sender
{
//    TSTabViewTestViewController *tstableview=[[[TSTabViewTestViewController alloc] init] autorelease];
//    [self.navigationController pushViewController:tstableview animated:YES];
    
}
//
//-(void)initNavgationbar
//{
////    [self.navigationController.navigationBar customNavigationBar];
//    UIView *NavgationbarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, NAVIGATIONBARHEIGHT)];
//    NavgationbarView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbarcolor"]];//[UIColor darkGrayColor];
//    
//    UIImage *img=[UIImage imageNamed:@"burger.png"];
////    UIView *myBtnView=[[UIView alloc]initWithFrame:CGRectMake(10, 5, 20, 20)];
//    UIButton *myBtn=[[UIButton alloc]init];
//    myBtn.frame=CGRectMake(20, 5, 20, 20);//myBtnView.frame;
//    
//    [myBtn addTarget:self action:@selector(onBurger:) forControlEvents:UIControlEventTouchUpInside];\
//    [myBtn setBackgroundImage:img forState:UIControlStateNormal];\
//    
////    [myBtn.titleLabel setFont:[UIFont fontWithName:@"Helvetica"size:15]];
////    [myBtn setBackgroundImage:img forState:UIControlStateNormal];
////    [myBtnView addSubview:myBtn];
////    UIBarButtonItem * myBarBtn=[[UIBarButtonItem alloc] initWithCustomView:myBtnView];
////    NSLog(@"self.navigationController.navigationItem%@",self.navigationItem);
//    
//    [NavgationbarView addSubview:myBtn];
//    [self.view addSubview:NavgationbarView];
////    [self.navigationItem setLeftBarButtonItem:myBarBtn];
//    [myBtn release];
////    [myBtnView release];
//    [NavgationbarView release];
////    [myBarBtn release];
//    
//}

-(void)cancelBackMy
{
    
    
}

- (IBAction)onBurger:(id)sender {
//    NSArray *images = @[
//                        [UIImage imageNamed:@"gear"],
//                        [UIImage imageNamed:@"globe"],
//                        [UIImage imageNamed:@"profile"],
//                        [UIImage imageNamed:@"star"],
//                        [UIImage imageNamed:@"gear"],
//                        [UIImage imageNamed:@"globe"],
//                        [UIImage imageNamed:@"profile"],
//                        [UIImage imageNamed:@"star"],
//                        [UIImage imageNamed:@"gear"],
//                        [UIImage imageNamed:@"globe"],
//                        [UIImage imageNamed:@"profile"],
//                        [UIImage imageNamed:@"star"],
//                        ];
//    NSArray *colors = @[
//                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
//                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
//                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
//                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
//                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
//                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
//                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
//                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
//                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
//                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
//                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
//                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
//                        ];
//    
//    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors];
////    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
//    callout.delegate = self;
////    callout.showFromRight = YES;
//    [callout show];
}

#pragma mark - ibaction

- (IBAction)showLeftSideBar:(id)sender
{
    if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)]) {
        [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionLeft];
    }
}

- (IBAction)showRightSideBar:(id)sender
{
    if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)]) {
        [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionRight];
    }
}
//#pragma mark - RNFrostedSidebarDelegate
//
//- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
//    NSLog(@"Tapped item at index %i",index);
//    if (index == 3) {
//        [sidebar dismiss];
//    }
//}
//
//- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
//    if (itemEnabled) {
//        [self.optionIndices addIndex:index];
//    }
//    else {
//        [self.optionIndices removeIndex:index];
//    }
//}

 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//{
//    return YES;
//}

#pragma mark - Create tab view

//TODO: 设置内容
- (UIView *)createTabWithTitle:(NSString *)title
{
    UIView *tabView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)] autorelease];
    tabView.backgroundColor =[UIColor darkGrayColor]; //[UIColor colorWithRed:(arc4random() / (float)RAND_MAX) green:(arc4random() / (float)RAND_MAX) blue:(arc4random() / (float)RAND_MAX) alpha:1];
    UILabel *label = [[[UILabel alloc] initWithFrame:tabView.bounds] autorelease];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:32];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.shadowColor = [UIColor colorWithWhite:0 alpha:0.5];
    label.shadowOffset = CGSizeMake(1, 1);
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.textAlignment = NSTextAlignmentCenter;
    [tabView addSubview:label];
    return tabView;
}

#pragma mark - NavigationStrip 3

- (TSTabView *)createTabView3WithFrame:(CGRect)rect
{
    TSNavigationStripView *navagationStripView = [self createNavigationStripView3WithFrame:CGRectMake(0, 0, 200, 32)];
    navagationStripView.navigationButtonsHidden =YES;
    //    [stripView reloadData];
    return [[[TSTabView alloc] initWithFrame:rect navigationMenu:navagationStripView] autorelease];
}

- (TSNavigationStripView *)createNavigationStripView3WithFrame:(CGRect)rect
{
    TSNavigationStripView *stripView = [[[TSNavigationStripView alloc] initWithFrame:rect] autorelease];
    stripView.backgroundColor = [UIColor whiteColor];
    
    [stripView.leftNavigationButton setImage:[UIImage imageNamed:@"NavigationStripLeftSideButtonBlue"] forState:UIControlStateNormal];
    [stripView.leftNavigationButton setImage:[UIImage imageNamed:@"NavigationStripLeftSideButtonGrey"] forState:UIControlStateDisabled];
    [stripView.rightNavigationButton setImage:[UIImage imageNamed:@"NavigationStripRightSideButtonBlue"] forState:UIControlStateNormal];
    [stripView.rightNavigationButton setImage:[UIImage imageNamed:@"NavigationStripRightSideButtonGrey"] forState:UIControlStateDisabled];
    
    return stripView;
}

//TODO: 设置选项卡
- (TSTabViewSection *)createSection3WithIndex:(NSNumber *)index
{
    
    TSTabViewSection *section = [[[TSTabViewSection alloc] init] autorelease];
    
    if ([index integerValue]==0) {
        section.title = [NSString stringWithFormat:@"首页"];
//        ModuleViewController *aModuleViewController=[[[ModuleViewController alloc] init] autorelease];
        HomeView *aHomeView=[[HomeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        aHomeView.backgroundColor=[UIColor whiteColor];  //[UIColor colorWithRed:(arc4random() / (float)RAND_MAX) green:(arc4random() / (float)RAND_MAX) blue:(arc4random() / (float)RAND_MAX) alpha:1];
        aHomeView.delegate=self;
        section.tabContent=aHomeView;
        [aHomeView release];
               
        
    }
    else if ([index integerValue]==2) {
        section.title = [NSString stringWithFormat:@"单词本"];
        WordsBookView *aWordsBookView=[[WordsBookView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        aWordsBookView.backgroundColor=[UIColor colorWithRed:(arc4random() / (float)RAND_MAX) green:(arc4random() / (float)RAND_MAX) blue:(arc4random() / (float)RAND_MAX) alpha:1];
        section.tabContent=aWordsBookView;
        [aWordsBookView release];
        
    }
    else if ([index integerValue]==1) {
        section.title = [NSString stringWithFormat:@"我的足迹"];
        TrainRecordView *aTrainRecordView=[[TrainRecordView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        aTrainRecordView.backgroundColor=[UIColor colorWithRed:(arc4random() / (float)RAND_MAX) green:(arc4random() / (float)RAND_MAX) blue:(arc4random() / (float)RAND_MAX) alpha:1];
        section.tabContent=aTrainRecordView;
        [aTrainRecordView release];
    }
    else if ([index integerValue]==3) {
        section.title = [NSString stringWithFormat:@"收藏"];
        MyFavouriteView *aMyFavouriteView=[[MyFavouriteView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        aMyFavouriteView.backgroundColor=[UIColor colorWithRed:(arc4random() / (float)RAND_MAX) green:(arc4random() / (float)RAND_MAX) blue:(arc4random() / (float)RAND_MAX) alpha:1];
        section.tabContent=aMyFavouriteView;
        [aMyFavouriteView release];
    }
    
    section.selectedTitle = section.title ;//[NSString stringWithFormat:@"Section %@",index];
//
//    section.icon = [UIImage imageNamed: @"NavigationStripIcon"];
//    section.selectedIcon = [UIImage imageNamed: @"NavigationStripIcon-Selected"];
    //？？？很神奇的事情发生了，当选中的字体和默认的字体相同时候就会莫名其名的抛出异常， 奇怪
    section.font = [UIFont systemFontOfSize:15];
    section.selectedFont = [UIFont boldSystemFontOfSize:18];//[UIFont italicSystemFontOfSize:15];
    section.color = [UIColor colorWithWhite:0.3f alpha:1];//[UIColor grayColor];//
    section.selectedColor = [UIColor colorWithWhite:0.6f alpha:1];//[UIColor grayColor];//
    UIImage *img = [UIImage imageNamed:@"NavigationStripSectionBackground"];
    
    section.backgroundImage = [img resizableImageWithCapInsets:UIEdgeInsetsMake(img.size.height/2, img.size.width/2, img.size.height/2, img.size.width/2)];
    img = [UIImage imageNamed:@"NavigationStripSectionBackground-Selected"];
    
    section.selectedBackgroundImage = [img resizableImageWithCapInsets:UIEdgeInsetsMake(img.size.height/2, img.size.width/2, img.size.height/2, img.size.width/2)];
    // Create tab view
     
//    section.tabContent = [self createTabWithTitle:[NSString stringWithFormat:@"Tab %@",index]];
    return section;
    
}


#pragma mark - TSTabViewDelegate

- (void)tabView:(TSTabView *)tabView menuItemAtIndex:(NSInteger)index fromLeftSide:(BOOL)leftSide didChangeState:(BOOL)selected
{
    VerboseLog(@"index = %d leftSide = %@ selected = %@",index,@(leftSide),@(selected));
    
    NSLog(@"menuItemAtIndex = %d",index);
}

- (void)tabView:(TSTabView *)tabView willSelectSectionAtIndex:(NSInteger)index
{
    VerboseLog(@"index = %d",index);
}

- (void)tabView:(TSTabView *)tabView didSelectSectionAtIndex:(NSInteger)index
{
    VerboseLog(@"index = %d",index);
    NSLog(@"didSelectSectionAtIndex = %d",index);
}

- (void)tabView:(TSTabView *)tabView didScrollTo:(CGFloat)normScrollOffset
{
    VerboseLog(@"normScrollOffset = %f",normScrollOffset);
}

#pragma mark - Actions

//- (IBAction)numberOfTabsValueChanged
//{
//    int count = [_tabViewModel1 numberOfSections];
//    int index = (count ? arc4random() % count : 0);
//    if(self.numberOfTabs.value > count) // increase
//    {
//        SUPPRESS_PERFORM_SELECTOR_LEAK_WARNING(
//                                               [self.dataSources enumerateObjectsUsingBlock:^(TSTabViewModel *dataSource, NSUInteger idx, BOOL *stop) {
//            TSTabViewSection *section = [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"createSection%dWithIndex:",idx + 1]) withObject:@(index)];
//            [dataSource insertNewTab:section atIndex:index animated:YES];
//        }];
//                                               );
//    }
//    else //decrease
//    {
//        [self.dataSources enumerateObjectsUsingBlock:^(TSTabViewModel *dataSource, NSUInteger idx, BOOL *stop) {
//            [dataSource removeTabAtIndex:index animated:YES];
//        }];
//    }
//}

//- (IBAction)sectionAligmentValueChanged
//{
//    [self.dataSources enumerateObjectsUsingBlock:^(TSTabViewModel *dataSource, NSUInteger idx, BOOL *stop) {
//        dataSource.tabView.navigationMenu.sectionsAligment = (self.sectionAligment.selectedSegmentIndex == 1 ? UIViewContentModeCenter :
//                                                              (self.sectionAligment.selectedSegmentIndex == 0 ? UIViewContentModeLeft : UIViewContentModeRight));
//        [dataSource.tabView reloadData];
//    }];
//}



@end
