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
@synthesize _revealSideViewController1,_revealSideViewController2,_revealSideViewController3,_revealSideViewController4,_revealSideViewController5;

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

    self.navigationItem.hidesBackButton = YES;
//    self.navigationItem.title = @"Home";
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:107.0/255.0 green:112.0/255.0 blue:115.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
}

- (IBAction)actionOpenRequest:(id)sender
{
    OpenRequestViewController *openreq = [[OpenRequestViewController alloc] init];
    
    self.navc1 = [[UINavigationController alloc] initWithRootViewController:openreq];
    _revealSideViewController1 = [[PPRevealSideViewController alloc] initWithRootViewController:self.navc1];
    _revealSideViewController1.fakeiOS7StatusBarColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    appd.window.rootViewController = _revealSideViewController1;
}

- (IBAction)actionMyRequest:(id)sender
{
    MyRequestViewController *myreq = [[MyRequestViewController alloc] init];

    self.navc2 = [[UINavigationController alloc] initWithRootViewController:myreq];
    _revealSideViewController2 = [[PPRevealSideViewController alloc] initWithRootViewController:self.navc2];
    _revealSideViewController2.fakeiOS7StatusBarColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    appd.window.rootViewController = _revealSideViewController2;
}

- (IBAction)actionOpenTrip:(id)sender
{
    OpenTripViewController *opentrip = [[OpenTripViewController alloc] init];

    self.navc3 = [[UINavigationController alloc] initWithRootViewController:opentrip];
    _revealSideViewController3 = [[PPRevealSideViewController alloc] initWithRootViewController:self.navc3];
    _revealSideViewController3.fakeiOS7StatusBarColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    appd.window.rootViewController = _revealSideViewController3;
}

- (IBAction)actionMap:(id)sender
{
    MapViewController *map = [[MapViewController alloc] init];

    self.navc4 = [[UINavigationController alloc] initWithRootViewController:map];
    _revealSideViewController4 = [[PPRevealSideViewController alloc] initWithRootViewController:self.navc4];
    _revealSideViewController4.fakeiOS7StatusBarColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    appd.window.rootViewController = _revealSideViewController4;
}

- (IBAction)actionProfile:(id)sender
{
    ProfileViewController *profilevc = [[ProfileViewController alloc] init];

    self.navc5 = [[UINavigationController alloc] initWithRootViewController:profilevc];
    _revealSideViewController5 = [[PPRevealSideViewController alloc] initWithRootViewController:self.navc5];
    _revealSideViewController5.fakeiOS7StatusBarColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    appd.window.rootViewController = _revealSideViewController5;
}

- (IBAction)actionLogout:(id)sender
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"UserType"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userID"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"email"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"password"];    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
