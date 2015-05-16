//
//  AddTransactionViewController.h
//  Gastalon
//
//  Created by Mobile Developer on 1/10/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface AddTransactionViewController : ViewController
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, assign) int typeTransaction;
@property (weak, nonatomic) IBOutlet UIButton *btnAmount;
@property (weak, nonatomic) IBOutlet UIButton *btnAccount;

- (IBAction)onCancelClick:(id)sender;
- (IBAction)onDoneClick:(id)sender;
- (IBAction)onAccountClick:(id)sender;
- (IBAction)onCategoryClick:(id)sender;
- (IBAction)onCalendarClick:(id)sender;
- (IBAction)onNoteClick:(id)sender;
- (IBAction)onRepeatClick:(id)sender;
- (IBAction)onAmountClick:(id)sender;
@end
