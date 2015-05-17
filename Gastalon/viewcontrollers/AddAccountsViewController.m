//
//  AddAccountsViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AddAccountsViewController.h"
#import "Colors.h"

@interface AddAccountsViewController ()

@end

@implementation AddAccountsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self designView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onAddSharedAccountClick:(id)sender {
    PUBLISH([EventAddSharedAccount new]);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onAddPersonalAccountClick:(id)sender {
    PUBLISH([EventAddAccount new]);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDismissClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)designView{
    self.view.layer.cornerRadius = 5.0f;
    float radius = self.btnPersonalAccount.frame.size.width / 2;
    self.btnPersonalAccount.layer.cornerRadius = radius;
    self.btnSharedAccount.layer.cornerRadius = radius;
    self.btnSharedAccount.layer.borderColor = GASTALON_COLOR_WHITE.CGColor;
    self.btnPersonalAccount.layer.borderColor = GASTALON_COLOR_WHITE.CGColor;
    self.btnPersonalAccount.layer.borderWidth = 2.0f;
    self.btnSharedAccount.layer.borderWidth = 2.0f;
}
@end
