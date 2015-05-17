//
//  AccountsTabViewController.m
//  Gastalon
//
//  Created by Mobile Developer on 1/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AccountsTabViewController.h"
#import "AccountsDataSource.h"
#import "SharedAccountsDataSource.h"
#import "Account.h"
#import "CCMPopupTransitioning.h"

@interface AccountsTabViewController ()

@end

@implementation AccountsTabViewController{
    AccountsDataSource * accountsDataSource;
    SharedAccountsDataSource * sharedAccountsDataSource;
    BOOL isSharedAccount;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self designView];
    accountsDataSource = [[AccountsDataSource alloc] initWithTableView:self.accountsTableView andHeightCellSize:100.0];
    self.accountsTableView.dataSource = accountsDataSource;
    self.accountsTableView.delegate = accountsDataSource;
    sharedAccountsDataSource = [[SharedAccountsDataSource alloc] initWithTableView:self.sharedAccountsTableView andHeightCellSize:71.0];
    self.sharedAccountsTableView.dataSource = sharedAccountsDataSource;
    self.sharedAccountsTableView.delegate = sharedAccountsDataSource;
    [accountsDataSource reloadData];
    [sharedAccountsDataSource reloadData];
    [self designMenuItemsAccount];
    isSharedAccount = NO;
}

-(void)designView{
    self.accountsTableView.layer.cornerRadius = 3.0f;
    self.sharedAccountsTableView.layer.cornerRadius = 3.0f;
}

- (IBAction)onAccountTypeChange:(UISegmentedControl*)sender {
    if([sender selectedSegmentIndex] == 0){
        isSharedAccount = NO;
        [self.sharedAccountsTableView setAlpha:0];
        [self.accountsTableView setAlpha:1];
    }else if([sender selectedSegmentIndex] == 1){
        isSharedAccount = YES;
        [self.sharedAccountsTableView setAlpha:1];
        [self.accountsTableView setAlpha:0];
    }
}

- (IBAction)onAddAccountClick:(id)sender {
    if(!isSharedAccount){
        [self showModalControllerWithIdentifier:@"ADDACCOUNTCONTROLLER"];
    }else{
        [self showModalControllerWithIdentifier:@"ADDSHAREDACCOUNTNAVIGATIONCONTROLLER"];
    }
}

SUBSCRIBE(EventAddSharedAccount) {
    [sharedAccountsDataSource reloadData];
}

SUBSCRIBE(EventAddAccount){
    [accountsDataSource reloadData];
}

SUBSCRIBE(EventAccountClicked){
    if(!event.account.isShared)
        [self showControllerWithIdentifier:@"ACCOUNTVIEWCONTROLLER"];
    else
        [self showControllerWithIdentifier:@"SHAREDACCOUNTVIEWCONTROLLER"];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}
@end
