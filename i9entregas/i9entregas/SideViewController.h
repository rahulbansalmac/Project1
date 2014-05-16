//
//  SideViewController.h
//  i9entregas
//
//  Created by Rahul Bansal on 13/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "PPRevealSideViewController.h"

@interface SideViewController : UIViewController
{
    AppDelegate *appd;    
}

- (IBAction)actionOpenRequest:(id)sender;
- (IBAction)actionMyRequest:(id)sender;
- (IBAction)actionMyTrips:(id)sender;
- (IBAction)actionMap:(id)sender;
- (IBAction)actionProfile:(id)sender;
- (IBAction)actionLogout:(id)sender;

@end
