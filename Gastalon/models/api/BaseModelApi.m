//
//  BaseModelApi.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "BaseModelApi.h"

@implementation BaseModelApi

-(id)initWithStatus:(int)status andMessage:(NSString*)message andErrors:(NSString*)errors{
    self = [super init];
    if(self){
        self.errors = errors;
        self.message = message;
        self.status = status;
    }
    return self;
}
@end
