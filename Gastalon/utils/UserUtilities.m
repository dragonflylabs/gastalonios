//
//  UserUtilities.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/5/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "UserUtilities.h"

static User * user;

@implementation UserUtilities

+(User*)sharedInstance{
    if(!user){
        if ([User allObjects].count > 0) {
            user = [[User allObjects] objectAtIndex:0];
        }
    }
    return user;
}
@end
