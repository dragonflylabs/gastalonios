//
//  Parser.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Parser : NSObject
+(id)parseJSONWithResponse:(id)response andClass:(Class)clss;
@end
