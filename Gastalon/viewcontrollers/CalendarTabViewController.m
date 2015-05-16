//
//  CalendarTabViewController.m
//  Gastalon
//
//  Created by Mobile Developer on 1/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CalendarTabViewController.h"
#import "Colors.h"
#import "Statics.h"
#import "CCMPopupTransitioning.h"

@interface CalendarTabViewController ()
@property(nonatomic)UIViewController* popupController;
@end
@implementation CalendarTabViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self designView];
}

-(void)designView{
    self.calendarView.backgroundColor = [UIColor clearColor];
    self.calendarView.titleDefaultColor = GASTALON_COLOR_WHITE;
    self.calendarView.header.backgroundColor = [UIColor clearColor];
    self.calendarView.titleFont = [UIFont fontWithName:GASTALON_FONT_NAME_LIGHT size:15];
    self.calendarView.weekdayTextColor = GASTALON_COLOR;
    self.calendarView.weekdayFont = [UIFont fontWithName:GASTALON_FONT_NAME_LIGHT size:16];
    self.calendarView.headerTitleColor = GASTALON_COLOR;
    self.calendarView.headerTitleFont = [UIFont fontWithName:GASTALON_FONT_NAME_LIGHT size:20];
}


- (IBAction)onAddTransactionClick:(id)sender {
    UIViewController *presentingController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ADDTRANSACTIONSCONTROLLER"];
    
    CCMPopupTransitioning *popup = [CCMPopupTransitioning sharedInstance];
    popup.destinationBounds = CGRectMake(0, 0, 280, 280);
    popup.presentedController = presentingController;
    popup.presentingController = self;
    popup.backgroundViewColor = [UIColor blackColor];
    popup.backgroundBlurRadius = 10;
    popup.backgroundViewAlpha = 0.6;
    popup.dynamic = YES;
    self.popupController = presentingController;
    [self presentViewController:presentingController animated:YES completion:nil];
}
@end
