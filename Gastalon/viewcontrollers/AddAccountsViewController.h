//
//  AddAccountsViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface AddAccountsViewController : ViewController
- (IBAction)onAddSharedAccountClick:(id)sender;
- (IBAction)onAddPersonalAccountClick:(id)sender;
- (IBAction)onDismissClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *btnPersonalAccount;
@property (weak, nonatomic) IBOutlet UIView *btnSharedAccount;


@end
