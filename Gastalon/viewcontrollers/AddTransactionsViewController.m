//
//  AddTransactionsViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AddTransactionsViewController.h"
#import "Colors.h"

@interface AddTransactionsViewController ()

@end

@implementation AddTransactionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self designView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onAddExpenseClick:(id)sender {
}

- (IBAction)onAddIncomeClick:(id)sender {
}

- (IBAction)onDismissClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)designView{
    self.view.layer.cornerRadius = 5.0f;
    float radius = self.btnAddExpense.frame.size.width / 2;
    self.btnAddExpense.layer.cornerRadius = radius;
    self.btnAddIncome.layer.cornerRadius = radius;
    self.btnAddIncome.layer.borderColor = GASTALON_COLOR_WHITE.CGColor;
    self.btnAddExpense.layer.borderColor = GASTALON_COLOR_WHITE.CGColor;
    self.btnAddExpense.layer.borderWidth = 2.0f;
    self.btnAddIncome.layer.borderWidth = 2.0;
}
@end
