//
//  AlarmServerIncome.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/12/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModel.h"
#import "Income.h"

@interface AlarmServerIncome : BaseModel

@property NSDate * dateTime;
@property BOOL payed;
@property double amount;
@property Income * income;
@property NSString * accountGuid;

-(id)initWithIdUser:(NSString*)userID andType:(int)type andDateTime:(NSDate*)date isPayed:(BOOL)isPayed andAmount:(double)amount andIncome:(Income*)income andAccountGuid:(NSString*)guid;
@end

RLM_ARRAY_TYPE(AlarmServerIncome)