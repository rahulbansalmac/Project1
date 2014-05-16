//
//  AppDelegate.m
//  i9entregas
//
//  Created by Rahul Bansal on 10/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    LoginViewController *lvc = [[LoginViewController alloc] init];
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:lvc];
    
    self.window.rootViewController = self.navigationController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setGrayBgDarkBorder:(id)sender
{
    if ([sender isKindOfClass:[UITextField class]])
    {
        UITextField *tf = (UITextField*)sender;
        
        tf.backgroundColor = [UIColor colorWithRed:229.0/255.0 green:230.0/255.0 blue:232.0/255.0 alpha:1.0];
        tf.layer.borderColor = [[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0] CGColor];
        tf.layer.borderWidth = 1.0f;
        tf.layer.cornerRadius = 3.0f;
    }
    else if ([sender isKindOfClass:[UIImageView class]])
    {
        UIImageView *imgv = (UIImageView*)sender;
        
        imgv.layer.borderColor = [[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0] CGColor];
        imgv.layer.borderWidth = 1.0f;
        imgv.layer.cornerRadius = 3.0f;
    }
    else if ([sender isKindOfClass:[UIView class]])
    {
        UIView *view = (UIView*)sender;
        view.layer.borderColor = [[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0] CGColor];
        view.layer.borderWidth = 1.0f;
        view.layer.cornerRadius = 3.0f;
    }
}

- (void)setPadding:(UITextField*)textField
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

@end
