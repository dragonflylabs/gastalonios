//
//  SharedAccountViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/28/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "SharedAccountViewController.h"
#import "Colors.h"
#import "ProfileView.h"
#import "CCMPopupTransitioning.h"

@interface SharedAccountViewController ()
@property (weak) UIViewController *popupController;
@end

@implementation SharedAccountViewController

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
    self.sharedAccountTableView.layer.cornerRadius = 3.0f;
    float addFriendRadius = self.btnAddFriend.frame.size.height / 2;
    self.btnAddFriend.layer.cornerRadius = addFriendRadius;
    self.btnAddFriend.layer.borderWidth = 1.0f;
    self.btnAddFriend.layer.borderColor = GASTALON_COLOR_WHITE.CGColor;
}

- (IBAction)onAddExpenseClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDTRANSACTIONCONTROLLER"];
}

- (IBAction)onAddIncomeClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDTRANSACTIONCONTROLLER"];
}

- (IBAction)onBackClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onProfileClick:(id)sender {
    UIViewController *presentingController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PROFILECONTROLLER"];
    
    CCMPopupTransitioning *popup = [CCMPopupTransitioning sharedInstance];
    popup.destinationBounds = CGRectMake(0, 0, 280, 280);
    popup.presentedController = presentingController;
    popup.presentingController = self;
    popup.backgroundViewColor = [UIColor blackColor];
    popup.backgroundBlurRadius = 10;
    popup.backgroundViewAlpha = 0.6;
    popup.dismissableByTouchingBackground = YES;
    popup.dynamic = YES;
    self.popupController = presentingController;
    [self presentViewController:presentingController animated:YES completion:nil];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //[self.navigationController setNavigationBarHidden:NO];
}

- (IBAction)onAddFriendClick:(id)sender {
    [self showModalControllerWithIdentifier:@"ADDFRIENDSCONTROLLER"];
}
@end
