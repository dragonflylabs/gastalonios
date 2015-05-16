//
//  AccountsTabViewController.h
//  Gastalon
//
//  Created by Mobile Developer on 1/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "TabViewController.h"

@interface AccountsTabViewController : TabViewController<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *accountsTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *accountsSegmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *sharedAccountsTableView;
- (IBAction)onAccountTypeChange:(UISegmentedControl*)sender;
- (IBAction)onAddAccountClick:(id)sender;


@end
