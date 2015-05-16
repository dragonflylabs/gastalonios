//
//  AddTransactionViewController.m
//  Gastalon
//
//  Created by Mobile Developer on 1/10/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AddTransactionViewController.h"
#import "OperationTypes.h"
#import "AccountChooserViewController.h"
#import "CalendarViewController.h"
#import "NotesViewController.h"
#import "NumericViewController.h"
#import "FrecuencyViewController.h"
#import "CategoryChooserViewController.h"

@interface AddTransactionViewController ()
@property UIViewController  *currentDetailViewController;
@property (nonatomic, strong) AccountChooserViewController * accountVC;
@property (nonatomic, strong) CalendarViewController * calendarVC;
@property (nonatomic, strong) CategoryChooserViewController * categoryVC;
@property (nonatomic, strong) NotesViewController * notesVC;
@property (nonatomic, strong) NumericViewController * numericVC;
@property (nonatomic, strong) FrecuencyViewController * frecuencyVC;

@end

@implementation AddTransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.accountVC = (AccountChooserViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"ACCOUNTCHOOSERCONTROLLER"];
    self.calendarVC = (CalendarViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"CALENDARCHOOSERCONTROLLER"];
    self.frecuencyVC = (FrecuencyViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"FRECUENCYCONTROLLER"];
    self.categoryVC = (CategoryChooserViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"CATEGORYCHOOSERCONTROLLER"];
    self.notesVC = (NotesViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"NOTESCONTROLLER"];
    self.numericVC = (NumericViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"NUMERICCONTROLLER"];
    [self presentDetailController:self.numericVC];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)onCancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDoneClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

- (IBAction)onAccountClick:(id)sender {
    [self presentDetailController:self.accountVC];
}

- (IBAction)onCategoryClick:(id)sender {
    [self presentDetailController:self.categoryVC];
}

- (IBAction)onCalendarClick:(id)sender {
    [self presentDetailController:self.calendarVC];
}

- (IBAction)onNoteClick:(id)sender {
    [self presentDetailController:self.notesVC];
}

- (IBAction)onRepeatClick:(id)sender {
    [self presentDetailController:self.frecuencyVC];
}

- (IBAction)onAmountClick:(id)sender {
    [self presentDetailController:self.numericVC];
}

- (void)presentDetailController:(UIViewController*)detailVC{
    if(self.currentDetailViewController){
        [self removeCurrentDetailViewController];
    }
    [self addChildViewController:detailVC];
    detailVC.view.frame = [self frameForDetailController];
    [self.contentView addSubview:detailVC.view];
    self.currentDetailViewController = detailVC;
    [detailVC didMoveToParentViewController:self];
}

- (void)removeCurrentDetailViewController{
    [self.currentDetailViewController willMoveToParentViewController:nil];
    [self.currentDetailViewController.view removeFromSuperview];
    [self.currentDetailViewController removeFromParentViewController];
}

- (CGRect)frameForDetailController{
    CGRect detailFrame = self.contentView.bounds;
    return detailFrame;
}

SUBSCRIBE(EventTypedNumber){
    if(event.isCleaning){
        _btnAmount.titleLabel.text = @"";
    }else{
        _btnAmount.titleLabel.text = event.number;
    }
}
@end
