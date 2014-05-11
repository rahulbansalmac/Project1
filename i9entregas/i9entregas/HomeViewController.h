//
//  HomeViewController.h
//  i9entregas
//
//  Created by Rahul Bansal on 11/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenRequestViewController.h"
#import "MyRequestViewController.h"
#import "OpenTripViewController.h"
#import "MapViewController.h"
#import "ProfileViewController.h"
#import "BaseViewController.h"
#import "PPRevealSideViewController.h"
#import "AppDelegate.h"

@class AppDelegate;

@interface HomeViewController : UIViewController
{
    PPRevealSideViewController *_revealSideViewController;
}

- (IBAction)actionOpenRequest:(id)sender;
- (IBAction)actionMyRequest:(id)sender;
- (IBAction)actionOpenTrip:(id)sender;
- (IBAction)actionMap:(id)sender;
- (IBAction)actionProfile:(id)sender;
- (IBAction)actionLogout:(id)sender;

@end
