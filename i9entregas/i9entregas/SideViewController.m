//
//  SideViewController.m
//  i9entregas
//
//  Created by Rahul Bansal on 13/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import "SideViewController.h"

@interface SideViewController ()

@end

@implementation SideViewController

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
}

- (IBAction)actionOpenRequest:(id)sender
{
//    PPRevealSideViewController *ppr = (PPRevealSideViewController*)appd.window.rootViewController;
//    
//    UINavigationController *navc = (UINavigationController*)ppr.rootViewController;
//    
//    OpenRequestViewController *openreq = [[OpenRequestViewController alloc] init];
//    
//    navc.
//    
//    self.navc = [[UINavigationController alloc] initWithRootViewController:openreq];
//    _revealSideViewController = [[PPRevealSideViewController alloc] initWithRootViewController:self.navc];
//    
//    
//    appd.window.rootViewController = _revealSideViewController;
    
    [self.revealSideViewController popViewControllerAnimated:YES];
}

- (IBAction)actionMyRequest:(id)sender
{
    
}

- (IBAction)actionMyTrips:(id)sender
{
    
}

- (IBAction)actionMap:(id)sender
{
    
}

- (IBAction)actionProfile:(id)sender
{
    
}

- (IBAction)actionLogout:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
