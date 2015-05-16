//
//  CategoryExpense.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/30/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "BaseModel.h"
#import "Expense.h"

@interface CategoryExpense : BaseModel
@property NSString * name;
@property NSData * icon;
@property RLMArray<Expense> * expenses;
-(id)initWithIdUser:(NSString*)userID andType:(int)type andName:(NSString*)name andIcon:(NSData*)data;
@end

RLM_ARRAY_TYPE(CategoryExpense)
