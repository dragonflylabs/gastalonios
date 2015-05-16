//
//  SharedAccountViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/28/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface SharedAccountViewController : ViewController
@property (weak, nonatomic) IBOutlet UIButton *btnAddFriend;
- (IBAction)onAddFriendClick:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *profileImages;
@property (weak, nonatomic) IBOutlet UITableView *sharedAccountTableView;
@property (weak, nonatomic) IBOutlet UIControl *btnAddExpense;
@property (weak, nonatomic) IBOutlet UIControl *btnAddIncome;
- (IBAction)onAddExpenseClick:(id)sender;
- (IBAction)onAddIncomeClick:(id)sender;
- (IBAction)onBackClick:(id)sender;

- (IBAction)onProfileClick:(id)sender;

@end
