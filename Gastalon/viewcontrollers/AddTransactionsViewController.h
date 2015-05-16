//
//  AddTransactionsViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/29/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface AddTransactionsViewController : ViewController
@property (weak, nonatomic) IBOutlet UIView *btnAddExpense;
@property (weak, nonatomic) IBOutlet UIView *btnAddIncome;
- (IBAction)onAddExpenseClick:(id)sender;
- (IBAction)onAddIncomeClick:(id)sender;
- (IBAction)onDismissClick:(id)sender;

@end
