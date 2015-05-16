//
//  CategoryExpense.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 3/30/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CategoryExpense.h"

@implementation CategoryExpense

-(id)initWithIdUser:(NSString*)userID andType:(int)type andName:(NSString*)name andIcon:(NSData*)data{
    self = [super initWithIdUser:userID andType:type];
    if(self){
        self.name = name;
        self.icon = data;
    }
    return self;
}

@end
