//
//  AlarmLocalExpense.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "AlarmLocalExpense.h"

@implementation AlarmLocalExpense

-(id)initWithIdUser:(NSString*)userID andType:(int)type andDateTime:(NSDate*)date isPayed:(BOOL)isPayed andAmount:(double)amount{
    self = [super initWithIdUser:userID andType:type];
    if(self){
        self.amount = amount;
        self.dateTime = date;
        self.payed = isPayed;
    }
    return self;
}
@end
