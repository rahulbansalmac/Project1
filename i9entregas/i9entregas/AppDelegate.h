//
//  AppDelegate.h
//  i9entregas
//
//  Created by Rahul Bansal on 10/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

#define API @"http://i9entregas.com.br/delievery_tracking/api.php?method="

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;

- (void)setGrayBgDarkBorder:(id)sender;
- (void)setPadding:(UITextField*)textField;

@end
