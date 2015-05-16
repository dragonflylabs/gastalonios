//
//  AccountChooserViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/3/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AccountChooserViewController.h"
#import "Statics.h"
#import "Colors.h"
#import "CCMPopupTransitioning.h"

@interface AccountChooserViewController ()
@property(nonatomic)UIViewController* popupController;
@end

@implementation AccountChooserViewController{
    BOOL isSharedSelected;
    NSMutableArray * accounts;
    NSMutableArray * sharedAccounts;
    NSIndexPath * lastIndexPathAccounts;
    NSIndexPath * lastIndexPathSharedAccounts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isSharedSelected = NO;
    self.accountsTableView.delegate = self;
    self.accountsTableView.dataSource = self;
    self.accountsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.accountsTableView.backgroundColor = [UIColor clearColor];
    [self reloadData];
}

-(void)reloadData{
    accounts = [[NSMutableArray alloc] init];
    sharedAccounts = [[NSMutableArray alloc] init];
    for(int i = 0; i < 20; i++){
        [accounts addObject:@(i)];
        [sharedAccounts addObject:@(i)];
    }
    if(!isSharedSelected){
        [self.btnAddAccount setAlpha:accounts.count > 0 ? 0 : 1];
        [self.accountsTableView setAlpha:accounts.count > 0 ? 1 : 0];
    }else{
        [self.btnAddAccount setAlpha:sharedAccounts.count > 0 ? 0 : 1];
        [self.accountsTableView setAlpha:sharedAccounts.count > 0 ? 1 : 0];
    }
    [self.accountsTableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return isSharedSelected ? sharedAccounts.count : accounts.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"CELLACCOUNTCHOOSER";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text = isSharedSelected ? @"Shared Account" : @"Local Account";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger newRow = [indexPath row];
    NSInteger oldRow = isSharedSelected ? (lastIndexPathSharedAccounts ? [lastIndexPathSharedAccounts row] : -1) : lastIndexPathAccounts ? [lastIndexPathAccounts row] : -1;
    if (newRow != oldRow)
    {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:isSharedSelected ? lastIndexPathSharedAccounts : lastIndexPathAccounts];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        if(isSharedSelected)
            lastIndexPathSharedAccounts = indexPath;
        else
            lastIndexPathAccounts = indexPath;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (IBAction)onAccountTypeChange:(UISegmentedControl*)sender {
    if([sender selectedSegmentIndex] == 0){
        isSharedSelected = NO;
    }else if([sender selectedSegmentIndex] == 1){
        isSharedSelected = YES;
    }
    [self reloadData];
}

- (IBAction)onAddAccountClick:(id)sender {
    UIViewController *presentingController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ADDACCOUNTSCONTROLLER"];
    
    CCMPopupTransitioning *popup = [CCMPopupTransitioning sharedInstance];
    popup.destinationBounds = CGRectMake(0, 0, 280, 280);
    popup.presentedController = presentingController;
    popup.presentingController = self;
    popup.backgroundViewColor = [UIColor blackColor];
    popup.backgroundBlurRadius = 10;
    popup.backgroundViewAlpha = 0.6;
    popup.dynamic = YES;
    self.popupController = presentingController;
    [self presentViewController:presentingController animated:YES completion:nil];
}
@end
