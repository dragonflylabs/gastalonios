//
//  CalendarViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/3/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"
#import <FSCalendar/FSCalendar.h>

@interface CalendarViewController : ViewController
@property (weak, nonatomic) IBOutlet FSCalendar *calendarView;

@end
