//
//  Validators.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "Validators.h"

@implementation Validators

+(BOOL)matches:(NSCharacterSet*)set andText:(NSString*)text{
    if(!text || [[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqual:@""]){
        return NO;
    }
    NSCharacterSet* s = [set invertedSet];
    NSRange r = [text rangeOfCharacterFromSet:s];
    if (r.location != NSNotFound) {
        return NO;
    }
    return YES;
}

#pragma mark Validators
+(BOOL)validAlphanumeric:(NSString*)text{
    return [self matches:[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 "] andText:text];
}

+(BOOL)validName:(NSString*)text{
    return [self matches:[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ áéíóúÁÉÍÓÚ"] andText:text];
}

+(BOOL)validNumeric:(NSString*)text{
    return [self matches:[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] andText:text];
}

+(BOOL)validEmail:(NSString*)text{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:text];
}

+(BOOL)validPassword:(NSString*)text{
    return [self matches:[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 $%&/-_.,;:{}[]()|"] andText:text];
}

+(BOOL)validDecimal:(NSString *)text{
    BOOL matches = [self matches:[NSCharacterSet characterSetWithCharactersInString:@"1234567890."] andText:text];
    BOOL rules = YES;
    if([text rangeOfString:@"."].length != 0){
        NSArray * components = [text componentsSeparatedByString:@"."];
        rules = rules && [self validAlphanumeric:[components objectAtIndex:0]] && [self validAlphanumeric:[components objectAtIndex:1]];
    }
    return matches && rules;
}

#pragma mark Formatters
+(NSString*)numberCurrencyFormatter:(double)amount{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:amount]];
}

+(NSString*)notNull:(NSString*)text{
    if (!text || text == NULL || text == nil || [text isEqual: [NSNull null]]) {
        return @"";
    }
    return text;
}
@end
