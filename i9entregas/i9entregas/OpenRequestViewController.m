//
//  OpenRequestViewController.m
//  i9entregas
//
//  Created by Rahul Bansal on 12/05/14.
//  Copyright (c) 2014 Rahul Bansal. All rights reserved.
//

#import "OpenRequestViewController.h"

@interface OpenRequestViewController ()

@end

@implementation OpenRequestViewController

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
    
    self.navigationItem.hidesBackButton = NO;
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:107.0/255.0 green:112.0/255.0 blue:115.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    [self createCustomLeftBarButton];
    
    [self createCustomRightBarButton];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self runAPIGetRequest];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"Open Request";
}

- (void)createCustomRightBarButton
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.numberOfLines = 0;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [button setTitle:NSLocalizedString(@"New\nRequest", nil) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionNewRequest) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)createCustomLeftBarButton
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:@"side_menu"];
    button.frame = CGRectMake(0, 0, 28, 20);
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionSlide) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)actionSlide
{
    SideViewController *sideView = [[SideViewController alloc] initWithNibName:@"SideViewController" bundle:nil ];
    [self.revealSideViewController pushViewController:sideView onDirection:PPRevealSideDirectionLeft withOffset:150.0 animated:YES];
    PP_RELEASE(sideView);
}

- (void)actionNewRequest
{
    NewRequestViewController *newreq = [[NewRequestViewController alloc] init];
    [self.navigationController pushViewController:newreq animated:YES];
}

#pragma mark - API Implementation

- (void)runAPIGetRequest
{
    if (hud)
        [hud show:YES];
    else
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    hud.detailsLabelText = @"Loading...";
    
    NSString *str = [NSString stringWithFormat:@"%@get_request_customer",API];
    requestGetRequest = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:str]];
    [requestGetRequest setPostValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"userID"] forKey:@"userid"];
    [requestGetRequest setDelegate:self];
    [requestGetRequest setTimeOutSeconds:200];
    [requestGetRequest setNumberOfTimesToRetryOnTimeout:2];
    [requestGetRequest startAsynchronous];
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView1 heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell1";
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:1];
    }
    
    UILabel *_lblRequestNo = (UILabel*)[cell.contentView viewWithTag:1];
//    UILabel *_lblSourceDestination = (UILabel*)[cell.contentView viewWithTag:2];
//    UILabel *_lblContactNo = (UILabel*)[cell.contentView viewWithTag:3];
//    UILabel *_lblDate = (UILabel*)[cell.contentView viewWithTag:4];
    
    _lblRequestNo.text = [NSString stringWithFormat:@"Request %d",indexPath.row + 1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
