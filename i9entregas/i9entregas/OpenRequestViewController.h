//
//  OpenRequestViewController.h
//  i9entregas
//
//  Created by Rahul Bansal on 12/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPRevealSideViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "NewRequestViewController.h"
#import "SideViewController.h"

@interface OpenRequestViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *_tableView;
    IBOutlet UITextField *_tfSearch;
    
    PPRevealSideViewController *_revealSideViewController;
    MBProgressHUD *hud;
    ASIFormDataRequest *requestGetRequest;
}
@end
