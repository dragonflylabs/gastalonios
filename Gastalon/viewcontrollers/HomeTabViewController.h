//
//  HomeTabViewController.h
//  Gastalon
//
//  Created by Mobile Developer on 1/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "TabViewController.h"

@interface HomeTabViewController : TabViewController<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) IBOutletCollection(UIControl) NSArray *actionButtons;
@property (weak, nonatomic) IBOutlet UIView *viewButtonsContainer;
- (IBAction)onAddIncomeClick:(id)sender;
- (IBAction)onAddExpenseClick:(id)sender;
- (IBAction)onAddAccountClick:(id)sender;
- (IBAction)onAddSharedAccountClick:(id)sender;
@end
