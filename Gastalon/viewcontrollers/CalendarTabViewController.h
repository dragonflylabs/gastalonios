//
//  CalendarTabViewController.h
//  Gastalon
//
//  Created by Mobile Developer on 1/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "TabViewController.h"
#import "FSCalendar.h"

@interface CalendarTabViewController : TabViewController<FSCalendarDataSource, FSCalendarDelegate>
@property (weak, nonatomic) IBOutlet FSCalendar *calendarView;
@property (weak, nonatomic) IBOutlet UITableView *calendarTableView;
- (IBAction)onAddTransactionClick:(id)sender;

@end
