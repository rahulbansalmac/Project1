//
//  SignUpViewController.m
//  Entregas
//
//  Created by Rahul Bansal on 05/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
    
    [[IQKeyboardManager sharedManager] setEnable:YES];

    self.navigationController.navigationBar.topItem.title = @"Back";
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:107.0/255.0 green:112.0/255.0 blue:115.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    
    for (int i = 0; i < 14; i++)
    {
        UITextField *tf = (UITextField*)[self.view viewWithTag:i + 1];
        [self setPadding:tf];
    }
    [self setPadding:_tfCarrier];

    [self initializeComponents];
    
    [self initializeVariables];
}

- (void)initializeComponents
{
    [self.view addSubview:_scrollViewDriver];
    [self.view addSubview:_scrollViewCustomer];
    
    _scrollViewDriver.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height);
    _scrollViewDriver.contentSize = CGSizeMake(_scrollViewDriver.contentSize.width, _btnSubmit.frame.origin.y + _btnSubmit.frame.size.height + 10);
    
    _scrollViewCustomer.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height);
    _scrollViewCustomer.contentSize = CGSizeMake(_scrollViewCustomer.contentSize.width, _btnSubmit.frame.origin.y + _btnSubmit.frame.size.height + 10);
    
    _btnDriver.layer.borderColor = [[UIColor colorWithRed: 81.0/255.0 green:95.0/255.0 blue:110.0/255.0 alpha:1.0] CGColor];
    _btnDriver.layer.borderWidth = 1.0f;
    
    _btnCustomer.layer.borderColor = [[UIColor colorWithRed: 81.0/255.0 green:95.0/255.0 blue:110.0/255.0 alpha:1.0] CGColor];
    _btnCustomer.layer.borderWidth = 1.0f;
    
    _btnDDriver.layer.borderColor = [[UIColor colorWithRed: 81.0/255.0 green:95.0/255.0 blue:110.0/255.0 alpha:1.0] CGColor];
    _btnDDriver.layer.borderWidth = 1.0f;
    
    _btnDCustomer.layer.borderColor = [[UIColor colorWithRed: 81.0/255.0 green:95.0/255.0 blue:110.0/255.0 alpha:1.0] CGColor];
    _btnDCustomer.layer.borderWidth = 1.0f;
    
    _btnClear.layer.cornerRadius = 3.0f;
    _btnSubmit.layer.cornerRadius = 3.0f;
}

- (void)initializeVariables
{
    arrCarrier = [[NSMutableArray alloc] initWithObjects:@"Aircel",@"Airtel", nil];
}

- (IBAction)actionDriverSelected:(id)sender
{
    _scrollViewDriver.hidden = NO;
    _scrollViewCustomer.hidden = YES;
}

- (IBAction)actionCustomerSelected:(id)sender
{
    _scrollViewCustomer.hidden = NO;
    _scrollViewDriver.hidden = YES;
}

- (IBAction)actionClear:(id)sender
{
    alertClear = [[UIAlertView alloc] initWithTitle:nil message:@"Are you sure you want to clear all the fields ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertClear show];
}

- (IBAction)actionSubmit:(id)sender
{
    for (int i = 0; i < 14; i++)
    {
        UITextField *tf = (UITextField*)[self.view viewWithTag:i + 1];
        
        if ([tf.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please provide all the data"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];

            return;
        }
    }
    if ([_tfCarrier.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please choose a Carrier"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];

        return;
    }
    
    if(![self validateEmailWithString:_tfEmail.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please provide a valid E-mail address"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
        return;
    }
    if (![_tfPassword.text isEqualToString:_tfConfirmPassword.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Password and Confirm Password do not match"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
        return;
    }
    
    [self runAPIRegister];
}

- (IBAction)actionCarrierPickerOpen:(id)sender
{
    [activeTextField resignFirstResponder];
    
    _viewCarrier.frame = CGRectMake(_viewCarrier.frame.origin.x, 600, _viewCarrier.frame.size.width, _viewCarrier.frame.size.height);
    [self.view addSubview:_viewCarrier];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    _viewCarrier.frame = CGRectMake(_viewCarrier.frame.origin.x, [[UIScreen mainScreen] bounds].size.height - _viewCarrier.frame.size.height, _viewCarrier.frame.size.width, _viewCarrier.frame.size.height);
    [UIView commitAnimations];
}

- (IBAction)actionCarrierPickerCancel:(id)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    _viewCarrier.frame = CGRectMake(_viewCarrier.frame.origin.x, 600, _viewCarrier.frame.size.width, _viewCarrier.frame.size.height);
    [UIView commitAnimations];

    [self performSelector:@selector(removeCarrierView) withObject:nil afterDelay:0.5];
}

- (void)removeCarrierView
{
    [_viewCarrier removeFromSuperview];
}

- (IBAction)actionCarrierPickerDone:(id)sender
{
    [self actionCarrierPickerCancel:nil];
    
    _tfCarrier.text = [arrCarrier objectAtIndex:[_pickerCarrier selectedRowInComponent:0]];
}

- (void)setPadding:(UITextField*)textField
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

- (BOOL)validateEmailWithString:(NSString*)email1
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email1];
}

#pragma mark - API Implementation

- (void)runAPIValidateCNHNumber
{
    
}

- (void)runAPIRegister
{
    if (hud)
        [hud show:YES];
    else
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    hud.detailsLabelText = @"Signing Up...";
    NSString *str = [NSString stringWithFormat:@"%@signup",API];
    NSLog(@"%@",str);
    
    requestRegisterCustomer = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:str]];
    [requestRegisterCustomer setPostValue:@"C" forKey:@"rtype"];
    [requestRegisterCustomer setPostValue:_tfName.text forKey:@"fullname"];
    [requestRegisterCustomer setPostValue:_tfEmail.text forKey:@"email"];
    [requestRegisterCustomer setPostValue:_tfPassword.text forKey:@"password"];
    [requestRegisterCustomer setPostValue:_tfIDNextel.text forKey:@"idnextel"];
    [requestRegisterCustomer setPostValue:_tfPostalCode.text forKey:@"postal_code"];
    [requestRegisterCustomer setPostValue:_tfAddress.text forKey:@"address"];
    [requestRegisterCustomer setPostValue:_tfNumber.text forKey:@"number"];
    [requestRegisterCustomer setPostValue:_tfCompliment.text forKey:@"complement"];
    [requestRegisterCustomer setPostValue:_tfNeighbourhood.text forKey:@"neighborhood"];
    [requestRegisterCustomer setPostValue:_tfCity.text forKey:@"city"];
    [requestRegisterCustomer setPostValue:_tfUF.text forKey:@"uf"];
    [requestRegisterCustomer setDelegate:self];
    [requestRegisterCustomer setTimeOutSeconds:200];
    [requestRegisterCustomer setNumberOfTimesToRetryOnTimeout:2];
    [requestRegisterCustomer startAsynchronous];
}

#pragma mark - ASIHTTPRequest Delegate

- (void) requestFinished:(ASIHTTPRequest *)request
{
    [hud hide:YES];
    
    NSLog(@"%@",[request responseString]);
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:kNilOptions error:nil];
    
    if ([request isEqual:requestRegisterCustomer])
    {
        if ([[json valueForKey:@"success"] integerValue] == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
            NSLog(@"Success");
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
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
    if ([textField isEqual:_tfCNHNumber])
    {
        int length = [self getLength:textField.text];
        if (length >= 11)
        {
            if(range.length == 0)
                return NO;
        }
    }
    if ([textField isEqual:_tfPassword] || [textField isEqual:_tfConfirmPassword] || [textField isEqual:_tfNumber])
    {
        int length = [self getLength:textField.text];
        if (length >= 6)
        {
            if(range.length == 0)
                return NO;
        }
    }
    if ([textField isEqual:_tfPostalCode])
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

#pragma mark - PickerView Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([pickerView isEqual:_pickerCarrier])
    {
        return [arrCarrier count];
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView isEqual:_pickerCarrier])
        return [arrCarrier objectAtIndex:row];
    return 0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([pickerView isEqual:_pickerCarrier])
        _tfCarrier.text = [arrCarrier objectAtIndex:row];
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if ([alertView isEqual:alertClear])
    {
        if (buttonIndex == 1)
        {
            for (int i = 0; i < 14; i++)
            {
                UITextField *tf = (UITextField*)[self.view viewWithTag:i + 1];
                tf.text = @"";
            }
            _tfCarrier.text = @"";
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
