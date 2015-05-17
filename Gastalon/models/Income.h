//
//  Income.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModel.h"

@interface Income : BaseModel

@property double amount;
@property BOOL periodically;
@property NSString * note;
@property NSMutableArray * images;
@property BOOL gained;
@property NSString* accountID;
@property NSString* categoryID;
-(id)initWithIdUser:(NSString*)userID andType:(int)type andAmount:(double)amount isPeriodically:(BOOL)isPeriodically andNote:(NSString*)note isGained:(BOOL)isGained andAccountID:(NSString*)accountID andCategoryID:(NSString*)categoryID;
@end

RLM_ARRAY_TYPE(Income)
