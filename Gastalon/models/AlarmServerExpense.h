//
//  AlarmServerExpense.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/12/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModel.h"
#import "Expense.h"

@interface AlarmServerExpense : BaseModel

@property NSDate * dateTime;
@property BOOL payed;
@property double amount;
@property Expense * expense;
@property NSString * accountGuid;

-(id)initWithIdUser:(NSString*)userID andType:(int)type andDateTime:(NSDate*)date isPayed:(BOOL)isPayed andAmount:(double)amount andExpense:(Expense*)expense andAccountGuid:(NSString*)guid;
@end

RLM_ARRAY_TYPE(AlarmServerExpense)
