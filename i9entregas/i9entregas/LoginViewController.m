//
//  LoginViewController.m
//  Entregas
//
//  Created by Rahul Bansal on 05/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
    appd = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    [appd setPadding:_tfEmail];
    [appd setPadding:_tfPassword];
    
    [appd setGrayBgDarkBorder:_tfEmail];
    [appd setGrayBgDarkBorder:_tfPassword];
    
    _btnLogin.layer.cornerRadius = 3.0f;
    _btnSignup.layer.cornerRadius = 3.0f;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (IBAction)actionSignUp:(id)sender
{
    [activeTextField resignFirstResponder];

    SignUpViewController *signupvc = [[SignUpViewController alloc] init];
    [self.navigationController pushViewController:signupvc animated:YES];
}

- (IBAction)actionLogin:(id)sender
{
    HomeViewController *homevc = [[HomeViewController alloc] init];
    [self.navigationController pushViewController:homevc animated:YES];
/*
    [activeTextField resignFirstResponder];
    
    if ([_tfEmail.text isEqualToString:@""] || [_tfPassword.text isEqualToString:@""])
    {
        if ([_tfEmail.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please provide a valid E-mail Address"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please provide Password"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
    else if(![self validateEmailWithString:_tfEmail.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please provide a valid E-mail address"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
        [self runAPILogin];
 */
}

- (IBAction)actionForgotPassword:(id)sender
{
    
}

- (BOOL)validateEmailWithString:(NSString*)email1
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email1];
}

#pragma mark - UITextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    textField.text = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([textField isEqual:_tfPassword])
    {
        int length = [self getLength:textField.text];
        if (length >= 6)
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

#pragma mark - API Implementation

- (void)runAPILogin
{
    NSString *str = [NSString stringWithFormat:@"%@Login",API];
    NSLog(@"%@",str);
    
    if (hud)
        [hud show:YES];
    else
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.detailsLabelText = @"Logging In...";
    requestLogin = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:str]];
    [requestLogin setPostValue:_tfEmail.text forKey:@"email"];
    [requestLogin setPostValue:_tfPassword.text forKey:@"password"];
    [requestLogin setDelegate:self];
    [requestLogin setTimeOutSeconds:200];
    [requestLogin setNumberOfTimesToRetryOnTimeout:2];
    [requestLogin startAsynchronous];
}

#pragma mark - ASIHTTPRequest Delegate

- (void) requestFinished:(ASIHTTPRequest *)request
{
    [hud hide:YES];
    
    NSLog(@"%@",[request responseString]);
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:kNilOptions error:nil];
    
    if ([[json valueForKey:@"success"] integerValue] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        
    }
}

- (void) requestFailed:(ASIHTTPRequest *)request
{
    [hud hide:YES];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Failed to connect to Internet" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
