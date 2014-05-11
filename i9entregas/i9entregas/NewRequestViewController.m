//
//  NewRequestViewController.m
//  i9entregas
//
//  Created by Rahul Bansal on 11/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import "NewRequestViewController.h"

@interface NewRequestViewController ()

@end

@implementation NewRequestViewController

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
    // Do any additional setup after loading the view from its nib.
    
    appd = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.title = @"New Request";
    self.navigationController.navigationBar.topItem.title = @"Back";
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:107.0/255.0 green:112.0/255.0 blue:115.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    [self.view addSubview:_scrollView];
    _scrollView.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height);
    _scrollView.contentSize = CGSizeMake(_scrollView.contentSize.width, _btnSumbit.frame.origin.y + _btnSumbit.frame.size.height + 10);
    
    for (int i = 0; i < 14; i++)
    {
        UITextField *tf = (UITextField*)[_scrollView viewWithTag:i + 1];
        [appd setGrayBgDarkBorder:tf];
        [appd setPadding:tf];
    }
}

- (IBAction)actionOSubmit:(id)sender
{
    
}

- (IBAction)actionDSubmit:(id)sender
{
    
}

- (IBAction)actionSubmit:(id)sender
{
    
}

- (IBAction)actionClear:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
