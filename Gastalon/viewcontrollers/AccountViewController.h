//
//  AccountViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/28/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface AccountViewController : ViewController
@property (weak, nonatomic) IBOutlet UIControl *btnAddExpense;
@property (weak, nonatomic) IBOutlet UIControl *btnAddIncome;
- (IBAction)onAddExpenseClick:(id)sender;
- (IBAction)onAddIncomeClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
- (IBAction)onBackClick:(id)sender;


@end
