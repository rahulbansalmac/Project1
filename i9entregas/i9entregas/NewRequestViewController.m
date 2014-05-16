//
//  NewRequestViewController.m
//  i9entregas
//
//  Created by Rahul Bansal on 11/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import "NewRequestViewController.h"

@interface NewRequestViewController ()

@end

@implementation NewRequestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    strCurrentRequest = [[NSString alloc] init];
    
    appd = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.title = @"New Request";
    self.navigationController.navigationBar.topItem.title = @"Back";
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:107.0/255.0 green:112.0/255.0 blue:115.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    [self.view addSubview:_scrollView];
    _scrollView.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height);
    _scrollView.contentSize = CGSizeMake(_scrollView.contentSize.width, _btnSumbit.frame.origin.y + _btnSumbit.frame.size.height + 10);
    
    for (int i = 0; i < 31; i++)
    {
        UITextField *tf = (UITextField*)[_scrollView viewWithTag:i + 1];
        [appd setGrayBgDarkBorder:tf];
        [appd setPadding:tf];
    }
}

- (IBAction)actionOSubmit:(id)sender
{
    [_tfOPostalCode resignFirstResponder];
    
    if (!(_tfOPostalCode.text.length == 8))
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Postal Code must be of 8 digits"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        _tfOPostalCode.text = [_tfOPostalCode.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
        NSString *str = [NSString stringWithFormat:@"%@-%@",[_tfOPostalCode.text substringToIndex:5],[_tfOPostalCode.text substringFromIndex:5]];
        
        strCurrentRequest = @"OriginAddress";
        
        [self runAPIGetAddress:str];
    }
}

- (IBAction)actionDSubmit:(id)sender
{
    [_tfDPostalCode resignFirstResponder];
    
    if (!(_tfDPostalCode.text.length == 8))
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Postal Code must be of 8 digits"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        _tfDPostalCode.text = [_tfDPostalCode.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
        NSString *str = [NSString stringWithFormat:@"%@-%@",[_tfDPostalCode.text substringToIndex:5],[_tfDPostalCode.text substringFromIndex:5]];
        
        strCurrentRequest = @"DestinationAddress";
        
        [self runAPIGetAddress:str];
    }
}

- (IBAction)actionSubmit:(id)sender
{
    
}

- (IBAction)actionClear:(id)sender
{
    
}

- (IBAction)actionPickerDateCancel:(id)sender
{
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    _viewDatePicker.frame = CGRectMake(0, 600, _viewDatePicker.frame.size.width, _viewDatePicker.frame.size.height);
    [UIView commitAnimations];
}

- (IBAction)actionPickerDateDone:(id)sender
{
    [self actionPickerDateCancel:Nil];
}

- (IBAction)actionPickerTimeCancel:(id)sender
{
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    _viewTimePicker.frame = CGRectMake(0, 600, _viewTimePicker.frame.size.width, _viewTimePicker.frame.size.height);
    [UIView commitAnimations];
}

- (IBAction)actionPickerTimeDone:(id)sender
{
    [self actionPickerTimeCancel:Nil];
}

- (IBAction)actionOpenDatePicker:(id)sender
{
    [self.view bringSubviewToFront:_viewDatePicker];
    
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    _viewDatePicker.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - _viewDatePicker.frame.size.height, _viewDatePicker.frame.size.width, _viewDatePicker.frame.size.height);
    [UIView commitAnimations];
}

- (IBAction)actionOpenTimePicker:(id)sender
{
    [self.view bringSubviewToFront:_viewTimePicker];
    
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    _viewTimePicker.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - _viewTimePicker.frame.size.height, _viewTimePicker.frame.size.width, _viewTimePicker.frame.size.height);
    [UIView commitAnimations];
}

#pragma mark - API Implementation

- (void)runAPIGetAddress:(NSString*)postalCode
{
    NSString *str1 = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?address=%@&sensor=true",postalCode];
    NSLog(@"%@",str1);
    
    requestGetAddress = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:str1]];
    [requestGetAddress setDelegate:self];
    [requestGetAddress setTimeOutSeconds:200];
    [requestGetAddress setNumberOfTimesToRetryOnTimeout:2];
    [requestGetAddress startAsynchronous];
}

#pragma mark - ASIHTTPRequest Delegate

- (void) requestFinished:(ASIHTTPRequest *)request
{
    [hud hide:YES];
    
    NSLog(@"%@",[request responseString]);
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:kNilOptions error:nil];
    
    if ([request isEqual:requestGetAddress])
    {
        NSArray *arrResults = [json valueForKey:@"results"];
        
        if (arrResults.count > 0)
        {
            NSDictionary *dict1 = [arrResults objectAtIndex:0];
            NSArray *arrAddressComp = [dict1 valueForKey:@"address_components"];
            
            for (NSDictionary *dict in arrAddressComp)
            {                
                if ([[[dict valueForKey:@"types"] objectAtIndex:0] isEqualToString:@"administrative_area_level_2"])
                {
                    if ([strCurrentRequest isEqualToString:@"OriginAddress"])
                        _tfCity.text = [dict valueForKey:@"short_name"];
                    else
                        _tfDCity.text = [dict valueForKey:@"short_name"];
                }
                
                if ([[[dict valueForKey:@"types"] objectAtIndex:0] isEqualToString:@"administrative_area_level_1"])
                {
                    if ([strCurrentRequest isEqualToString:@"OriginAddress"])
                        _tfUF.text = [dict valueForKey:@"short_name"];
                    else
                        _tfDUF.text = [dict valueForKey:@"short_name"];
                }
            }
            
            if ([strCurrentRequest isEqualToString:@"OriginAddress"])
            {
                _tfOCurrentAddress.text = [dict1 valueForKey:@"formatted_address"];
                
                _tfOCurrentAddress.userInteractionEnabled = NO;
                _tfCity.userInteractionEnabled = NO;
                _tfUF.userInteractionEnabled = NO;
            }
            else
            {
                _tfDCurrentAddress.text = [dict1 valueForKey:@"formatted_address"];
                
                _tfDCurrentAddress.userInteractionEnabled = NO;
                _tfDCity.userInteractionEnabled = NO;
                _tfDUF.userInteractionEnabled = NO;
            }
        }
        else
        {
            if ([strCurrentRequest isEqualToString:@"OriginAddress"])
            {
                _tfOCurrentAddress.userInteractionEnabled = YES;
                _tfCity.userInteractionEnabled = YES;
                _tfUF.userInteractionEnabled = YES;
            }
            else
            {
                _tfDCurrentAddress.userInteractionEnabled = YES;
                _tfDCity.userInteractionEnabled = YES;
                _tfDUF.userInteractionEnabled = YES;
            }
        }
    }
}

- (void) requestFailed:(ASIHTTPRequest *)request
{
    [hud hide:YES];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Failed to connect to Internet" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}


#pragma mark - UITextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeTextField = textField;
    
}

- (void)resignKeyboard
{
    [activeTextField resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    textField.text = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([textField isEqual:_tfONumber] || [textField isEqual:_tfDNumber])
    {
        int length = [self getLength:textField.text];
        if (length >= 6)
        {
            if(range.length == 0)
                return NO;
        }
    }
    if ([textField isEqual:_tfOPostalCode] || [textField isEqual:_tfDPostalCode])
    {
        int length = [self getLength:textField.text];
        if (length >= 8)
        {
            if(range.length == 0)
                return NO;
        }
    }
    if ([textField isEqual:_tfUF])
    {
        int length = [self getLength:textField.text];
        if (length >= 2)
        {
            if(range.length == 0)
                return NO;
        }
    }
    return YES;
}

- (int)getLength:(NSString*)mobileNumber
{
    int length = [mobileNumber length];
    
    return length;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
