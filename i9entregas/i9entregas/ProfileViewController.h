//
//  ProfileViewController.h
//  i9entregas
//
//  Created by Rahul Bansal on 12/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"

@interface ProfileViewController : UIViewController
{
    MBProgressHUD *hud;
    ASIFormDataRequest *requestGetData;
}
@end
