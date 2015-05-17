//
//  Validators.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validators : NSObject

+(BOOL)validAlphanumeric:(NSString*)text;
+(BOOL)validName:(NSString*)text;
+(BOOL)validNumeric:(NSString*)text;
+(BOOL)validDecimal:(NSString*)text;
+(BOOL)validPassword:(NSString*)text;
+(BOOL)validEmail:(NSString*)text;
+(NSString*)notNull:(NSString*)text;
+(NSString*)numberCurrencyFormatter:(double)amount;
+(BOOL)matches:(NSCharacterSet*)set andText:(NSString*)text;
@end
