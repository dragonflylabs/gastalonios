//
//  AlarmServerIncome.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AlarmServerIncome.h"

@implementation AlarmServerIncome
-(id)initWithIdUser:(NSString*)userID andType:(int)type andDateTime:(NSDate*)date isPayed:(BOOL)isPayed andAmount:(double)amount andIncome:(Income *)income andAccountGuid:(NSString *)guid{
    self = [super initWithIdUser:userID andType:type];
    if(self){
        self.amount = amount;
        self.dateTime = date;
        self.payed = isPayed;
        self.income = income;
        self.accountGuid = guid;
    }
    return self;
}

@end