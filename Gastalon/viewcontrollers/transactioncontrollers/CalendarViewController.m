//
//  CalendarViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/3/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CalendarViewController.h"
#import "Colors.h"
#import "Statics.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calendarView.backgroundColor = [UIColor clearColor];
    self.calendarView.titleDefaultColor = GASTALON_COLOR_WHITE;
    self.calendarView.header.backgroundColor = [UIColor clearColor];
    self.calendarView.titleFont = [UIFont fontWithName:GASTALON_FONT_NAME_LIGHT size:15];
    self.calendarView.weekdayTextColor = GASTALON_COLOR;
    self.calendarView.weekdayFont = [UIFont fontWithName:GASTALON_FONT_NAME_LIGHT size:16];
    self.calendarView.headerTitleColor = GASTALON_COLOR;
    self.calendarView.headerTitleFont = [UIFont fontWithName:GASTALON_FONT_NAME_LIGHT size:20];
}

@end
