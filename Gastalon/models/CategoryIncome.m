//
//  CategoryIncome.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CategoryIncome.h"

@implementation CategoryIncome

-(id)initWithIdUser:(NSString*)userID andType:(int)type andName:(NSString*)name andIcon:(NSData*)data{
    self = [super initWithIdUser:userID andType:type];
    if(self){
        self.name = name;
        self.icon = data;
    }
    return self;
}

@end
