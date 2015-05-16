//
//  AlarmLocalExpense.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModel.h"
#import "Expense.h"

@interface AlarmLocalExpense : BaseModel

@property NSDate * dateTime;
@property BOOL payed;
@property double amount;
@property Expense * expense;
-(id)initWithIdUser:(NSString*)userID andType:(int)type andDateTime:(NSDate*)date isPayed:(BOOL)isPayed andAmount:(double)amount;
@end

RLM_ARRAY_TYPE(AlarmLocalExpense)
