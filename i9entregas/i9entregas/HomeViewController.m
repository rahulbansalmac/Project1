//
//  HomeViewController.m
//  i9entregas
//
//  Created by Rahul Bansal on 11/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.title = @"Home";
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:107.0/255.0 green:112.0/255.0 blue:115.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
}

- (IBAction)actionOpenRequest:(id)sender
{
    OpenRequestViewController *openreq = [[OpenRequestViewController alloc] init];
    [self.navigationController pushViewController:openreq animated:YES];
    
//    _revealSideViewController = [[PPRevealSideViewController alloc] initWithRootViewController:openreq];
    
//    AppDelegate *appd = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    appd.window.rootViewController = _revealSideViewController;
}

- (IBAction)actionMyRequest:(id)sender
{
    MyRequestViewController *myreq = [[MyRequestViewController alloc] init];
    [self.navigationController pushViewController:myreq animated:YES];
}

- (IBAction)actionOpenTrip:(id)sender
{
    OpenTripViewController *opentrip = [[OpenTripViewController alloc] init];
    [self.navigationController pushViewController:opentrip animated:YES];
}

- (IBAction)actionMap:(id)sender
{
    MapViewController *map = [[MapViewController alloc] init];
    [self.navigationController pushViewController:map animated:YES];
}

- (IBAction)actionProfile:(id)sender
{
    ProfileViewController *profilevc = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:profilevc animated:YES];
}

- (IBAction)actionLogout:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
