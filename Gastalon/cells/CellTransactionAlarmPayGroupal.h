//
//  CellTransactionAlarmPayGroupal.h
//  Gastalon
//
//  Created by Yolanda Martínez on 27/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicCell.h"
#import "AlarmServerExpense.h"

@interface CellTransactionAlarmPayGroupal : BasicCell
@property(nonatomic, strong) AlarmServerExpense* alarm;
@end
