//
//  ProfileViewController.m
//  i9entregas
//
//  Created by Rahul Bansal on 12/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
    
    _imgvHeader.frame = CGRectMake(0, -20, 320, 64);
    
    self.navigationController.navigationBarHidden = YES;
    [self runAPIGetProfile];
}

- (IBAction)actionBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - API Implementation

- (void)runAPIGetProfile
{
    if (hud)
        [hud show:YES];
    else
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    hud.detailsLabelText = @"Loading...";

    NSString *str = [NSString stringWithFormat:@"%@getprofile&userid=%@&rtype=%@",API,[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"],[[NSUserDefaults standardUserDefaults] objectForKey:@"UserType"]];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"]);
    requestGetData = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:str]];
    [requestGetData setDelegate:self];
    [requestGetData setTimeOutSeconds:200];
    [requestGetData setNumberOfTimesToRetryOnTimeout:2];
    [requestGetData startAsynchronous];
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
        _lblName.text = [[json valueForKey:@"message"] valueForKey:@"full_name"];
        _lblAddress.text = [[json valueForKey:@"message"] valueForKey:@"address"];
        _lblCNHNo.text = [[json valueForKey:@"message"] valueForKey:@"cnh_number"];
        _lblMobileNo.text = [[json valueForKey:@"message"] valueForKey:@"address"];
        _lblCarrier.text = [[json valueForKey:@"message"] valueForKey:@"carrier1"];
        _lblIDNextel.text = [[json valueForKey:@"message"] valueForKey:@"idnextel"];
        _lblPostalCode.text = [[json valueForKey:@"message"] valueForKey:@"postal_code"];
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
