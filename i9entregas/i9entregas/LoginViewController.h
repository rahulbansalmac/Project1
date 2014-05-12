//
//  LoginViewController.h
//  Entregas
//
//  Created by Rahul Bansal on 05/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUpViewController.h"
#import "ASIFormDataRequest.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "NewRequestViewController.h"
#import "HomeViewController.h"

@class AppDelegate;

@interface LoginViewController : UIViewController
{
    IBOutlet UITextField *_tfEmail;    
    IBOutlet UITextField *_tfPassword;
    IBOutlet UIButton *_btnLogin;
    IBOutlet UIButton *_btnSignup;
    
    AppDelegate *appd;
    ASIFormDataRequest *requestLogin;
    MBProgressHUD *hud;
    UITextField *activeTextField;
}

- (IBAction)actionSignUp:(id)sender;
- (IBAction)actionLogin:(id)sender;
- (IBAction)actionForgotPassword:(id)sender;

@end
