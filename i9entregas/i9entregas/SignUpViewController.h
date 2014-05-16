//
//  SignUpViewController.h
//  Entregas
//
//  Created by Rahul Bansal on 05/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IQKeyboardManager.h"
#import "AppDelegate.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"

@class AppDelegate;

@interface SignUpViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    // Driver View
    IBOutlet UIScrollView *_scrollViewDriver;

    IBOutlet UIButton *_btnDDriver;
    IBOutlet UIButton *_btnDCustomer;
    IBOutlet UIButton *_btnAddVehicles;
    
    IBOutlet UITextField *_tfDCNHNumber;
    IBOutlet UITextField *_tfDUF;
    IBOutlet UITextField *_tfRG;
    IBOutlet UITextField *_tfANTTNumber;
    
    IBOutlet UIImageView *_imgvAddVehicles;
    
    IBOutlet UIView *_viewDSubmit;
    
    // Customer View
    IBOutlet UIScrollView *_scrollViewCustomer;
    
    IBOutlet UIButton *_btnDriver;
    IBOutlet UIButton *_btnCustomer;
    IBOutlet UIButton *_btnSubmit;
    IBOutlet UIButton *_btnClear;
    
    IBOutlet UITextField *_tfCNHNumber;
    IBOutlet UITextField *_tfName;
    IBOutlet UITextField *_tfEmail;
    IBOutlet UITextField *_tfPassword;
    IBOutlet UITextField *_tfConfirmPassword;
    IBOutlet UITextField *_tfMobileNumber;
    IBOutlet UITextField *_tfCarrier;
    IBOutlet UITextField *_tfIDNextel;
    IBOutlet UITextField *_tfPostalCode;
    IBOutlet UITextField *_tfAddress;
    IBOutlet UITextField *_tfNumber;
    IBOutlet UITextField *_tfCompliment;
    IBOutlet UITextField *_tfNeighbourhood;
    IBOutlet UITextField *_tfCity;
    IBOutlet UITextField *_tfUF;
    
    IBOutlet UIView *_viewCarrier;
    IBOutlet UIPickerView *_pickerCarrier;
    
    UITextField *activeTextField;
    NSMutableArray *arrCarrier;
    UIAlertView *alertClear;
    
    AppDelegate *appd;
    MBProgressHUD *hud;
    ASIFormDataRequest *requestRegisterCustomer, *requestCarrier;
    ASIHTTPRequest *requestGetAddress;
    NSMutableArray *arrTotalVehicles;
    UIAlertView *_alertSuccess;
}

- (IBAction)actionDriverSelected:(id)sender;
- (IBAction)actionCustomerSelected:(id)sender;
- (IBAction)actionCarrierPickerOpen:(id)sender;
- (IBAction)actionClear:(id)sender;
- (IBAction)actionSubmit:(id)sender;
- (IBAction)actionCarrierPickerCancel:(id)sender;
- (IBAction)actionCarrierPickerDone:(id)sender;
- (IBAction)actionAddVehicles:(id)sender;
- (IBAction)actionSubmitPostalCode:(id)sender;

@end
