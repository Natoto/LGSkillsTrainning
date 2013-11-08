//
//  ModuleViewController.m
//  LGSkillsTrainning
//
//  Created by huangbo on 13-9-27.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import "ModuleViewController.h" 
@interface ModuleViewController ()

@end

@implementation ModuleViewController
@synthesize backBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIView * atestctrview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        atestctrview.backgroundColor=[UIColor grayColor];
        self.view=atestctrview;
//        UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//        button.frame=CGRectMake(100, 100, 100, 50);
//        [button setTitle:@"back" forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(backbuttonTap:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:button];
        [atestctrview release];
        [self initNavgationbar:nil];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   	// Do any additional setup after loading the view.
}

-(void)dealloc
{
    GVRelease(backBtn);    
    [super dealloc];
}


-(void)initNavgationbar:(NSString *)backimageName
{
    if (!backimageName) {
        backimageName=@"burger.png";
    }
    
    UIView *NavgationbarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, NAVIGATIONBARHEIGHT)];
    NavgationbarView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbarcolor"]];
    
    UIImage *img=[UIImage imageNamed:backimageName];
    backBtn=[[UIButton alloc]init];
    backBtn.frame=CGRectMake(20, 5, 20, 20);
//    [backBtn addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:img forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backbuttonTap:) forControlEvents:UIControlEventTouchUpInside];
    [NavgationbarView addSubview:backBtn];
    [self.view addSubview:NavgationbarView];
    [NavgationbarView release]; 
    
}


-(IBAction)backbuttonTap:(id)sender
{
     [self.navigationController popViewControllerAnimated:YES];//:atestctr animated:YES];    
       
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
