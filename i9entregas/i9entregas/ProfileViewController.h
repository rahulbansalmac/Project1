//
//  ProfileViewController.h
//  i9entregas
//
//  Created by Rahul Bansal on 12/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"

@interface ProfileViewController : UIViewController
{
    IBOutlet UILabel *_lblName;
    IBOutlet UILabel *_lblAddress;
    IBOutlet UILabel *_lblCNHNo;
    IBOutlet UILabel *_lblPassword;
    IBOutlet UILabel *_lblMobileNo;
    IBOutlet UILabel *_lblCarrier;
    IBOutlet UILabel *_lblIDNextel;
    IBOutlet UILabel *_lblPostalCode;
    
    IBOutlet UIImageView *_imgvHeader;
    
    MBProgressHUD *hud;
    ASIHTTPRequest *requestGetData;
}

- (IBAction)actionBack:(id)sender;

@end
