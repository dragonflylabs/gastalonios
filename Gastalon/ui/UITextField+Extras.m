//
//  UITextField+Extras.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/5/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "UITextField+Extras.h"

@implementation UITextField (Extras)

-(NSString*)cleanText{
    if(!self.text)
        return @"";
    self.text = [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return self.text;
}

@end
