//
//  AboutTableViewController.m
//  Signal
//
//  Created by Dylan Bourgeois on 05/01/15.
//  Copyright (c) 2015 Open Whisper Systems. All rights reserved.
//

#import "AboutTableViewController.h"
#import "UIUtil.h"

@interface AboutTableViewController ()

@property (strong, nonatomic) UITableViewCell * versionCell;
@property (strong, nonatomic) UITableViewCell * supportCell;

@property (strong, nonatomic) UILabel * versionLabel;

@property (strong, nonatomic) UILabel * footerView;

@end

@implementation AboutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(void)loadView
{
    [super loadView];
    
    self.title = @"About";
    
    //Version
    self.versionCell = [[UITableViewCell alloc]init];
    self.versionCell.textLabel.text = @"Version";
    
    self.versionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 75, 30)];
    self.versionLabel.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    self.versionLabel.textColor = [UIColor lightGrayColor];
    self.versionLabel.font = [UIFont ows_lightFontWithSize:16.0f];
    self.versionLabel.textAlignment = NSTextAlignmentRight;
    
    self.versionCell.accessoryView = self.versionLabel;
    self.versionCell.userInteractionEnabled = NO;
    
    //Support
    self.supportCell = [[UITableViewCell alloc]init];
    self.supportCell.textLabel.text = @"Support";
    self.supportCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //Footer
    self.footerView = [[UILabel alloc]init];
    self.footerView.text = @"Copyright ©OpenWhisperSystems \n Licensed under the GPLv3";
    self.footerView.textColor = [UIColor darkGrayColor];
    self.footerView.font = [UIFont ows_lightFontWithSize:15.0f];
    self.footerView.numberOfLines = 2;
    self.footerView.textAlignment = NSTextAlignmentCenter;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 1;
        case 1: return 1;
        default: return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0: return @"Information";
        case 1: return @"Help";
        default: return nil;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0: return self.versionCell;
        case 1: return self.supportCell;
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://support.whispersystems.org"]];
            break;
            
        default:
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return section == 1 ? self.footerView : nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section == 1 ? 60.0f : 0;
}

@end
