//
//  CellTransactionAlarmPay.h
//  Gastalon
//
//  Created by Yolanda Martínez on 27/03/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicCell.h"
#import "AlarmLocalExpense.h"
#import "Account.h"
#import "CategoryExpense.h"

@interface CellTransactionAlarmPay : BasicCell
@property(nonatomic, strong) AlarmLocalExpense * alarm;
@end
