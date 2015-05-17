//
//  AlarmLocalIncome.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModel.h"
#import "Income.h"

@interface AlarmLocalIncome : BaseModel

@property NSDate * dateTime;
@property BOOL gained;
@property double amount;
@property Income * income;
-(id)initWithIdUser:(NSString*)userID andType:(int)type andDateTime:(NSDate*)date isGained:(BOOL)isGained andAmount:(double)amount;
@end

RLM_ARRAY_TYPE(AlarmLocalIncome)
