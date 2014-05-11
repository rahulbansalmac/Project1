//
//  NewRequestViewController.h
//  i9entregas
//
//  Created by Rahul Bansal on 11/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;

@interface NewRequestViewController : UIViewController
{
    IBOutlet UIScrollView *_scrollView;
    IBOutlet UIButton *_btnSumbit;
    
    IBOutlet UITextField *_tfNickNameAddress;
    IBOutlet UITextField *_tfOPostalCode;
    IBOutlet UITextField *_tfOCurrentAddress;
    IBOutlet UITextField *_tfONumber;
    IBOutlet UITextField *_tfOCompliment;
    IBOutlet UITextField *_tfONeighbourhood;
    IBOutlet UITextField *_tfCity;
    IBOutlet UITextField *_tfUF;
    
    IBOutlet UITextField *_tfDPostalCode;
    IBOutlet UITextField *_tfDCurrentAddress;
    IBOutlet UITextField *_tfDNumber;
    IBOutlet UITextField *_tfDCompliment;
    IBOutlet UITextField *_tfDNeighbourhood;
    IBOutlet UITextField *_tfDCity;
    IBOutlet UITextField *_tfDUF;
    
    AppDelegate *appd;
}
- (IBAction)actionOSubmit:(id)sender;
- (IBAction)actionDSubmit:(id)sender;

- (IBAction)actionSubmit:(id)sender;
- (IBAction)actionClear:(id)sender;

@end
