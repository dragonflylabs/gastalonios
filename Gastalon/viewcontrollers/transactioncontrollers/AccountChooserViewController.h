//
//  AccountChooserViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/3/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface AccountChooserViewController : ViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *accountsTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *accountsSegmentedControl;
- (IBAction)onAccountTypeChange:(UISegmentedControl*)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnAddAccount;
- (IBAction)onAddAccountClick:(id)sender;
@end
