//
//  CategoryIncome.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModel.h"
#import "Income.h"

@interface CategoryIncome : BaseModel

@property NSString * name;
@property NSData * icon;
@property RLMArray<Income> * incomes;
-(id)initWithIdUser:(NSString*)userID andType:(int)type andName:(NSString*)name andIcon:(NSData*)data;
@end

RLM_ARRAY_TYPE(CategoryIncome)
