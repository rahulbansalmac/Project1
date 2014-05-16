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
    
    IBOutlet UIView *_viewDatePicker;
    
    IBOutlet UIDatePicker *_pickerDate;
    
    IBOutlet UIView *_viewTimePicker;
    
    IBOutlet UIDatePicker *_pickerTime;
    
    IBOutlet UIButton *_btnDate;
    IBOutlet UIButton *_btnTime;
    IBOutlet UIButton *_btnLimitDate;
    IBOutlet UIButton *_btnLimitTime;
    
    AppDelegate *appd;
    ASIHTTPRequest *requestGetAddress;
    MBProgressHUD *hud;
    NSString *strCurrentRequest;
    UITextField *activeTextField;
}

- (IBAction)actionOSubmit:(id)sender;
- (IBAction)actionDSubmit:(id)sender;

- (IBAction)actionSubmit:(id)sender;
- (IBAction)actionClear:(id)sender;
- (IBAction)actionPickerDateCancel:(id)sender;
- (IBAction)actionPickerDateDone:(id)sender;
- (IBAction)actionPickerTimeCancel:(id)sender;
- (IBAction)actionPickerTimeDone:(id)sender;
- (IBAction)actionOpenDatePicker:(id)sender;
- (IBAction)actionOpenTimePicker:(id)sender;

@end
