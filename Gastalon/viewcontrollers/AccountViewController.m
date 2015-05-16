//
//  AccountViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/28/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AccountViewController.h"
#import "Colors.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self designView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)designView{
    float radius = self.btnAddExpense.frame.size.width / 2;
    self.btnAddExpense.layer.cornerRadius = radius;
    self.btnAddExpense.layer.borderColor = GASTALON_COLOR_WHITE.CGColor;
    self.btnAddIncome.layer.borderColor = GASTALON_COLOR_WHITE.CGColor;
    self.btnAddExpense.layer.borderWidth = 1.5f;
    self.btnAddIncome.layer.borderWidth = 1.5f;
    self.btnAddIncome.layer.cornerRadius = radius;
    self.mainTableView.layer.cornerRadius = 3.0f;
}

- (IBAction)onAddExpenseClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDTRANSACTIONCONTROLLER"];
}

- (IBAction)onAddIncomeClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDTRANSACTIONCONTROLLER"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)onBackClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
