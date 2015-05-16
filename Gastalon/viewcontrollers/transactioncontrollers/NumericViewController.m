//
//  NumericViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/3/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "NumericViewController.h"
#import "Validators.h"

@interface NumericViewController ()

@end

@implementation NumericViewController{
    BOOL decimalEnabled;
    NSString * number;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor * color = [UIColor whiteColor];
    for(UIButton * button in self.buttons){
        button.layer.cornerRadius = button.frame.size.width/2;
        button.layer.borderColor = color.CGColor;
        button.layer.borderWidth = 1.0f;
    }
    decimalEnabled = NO;
    number = @"";
}


- (IBAction)onNumberClick:(id)sender {
    NSString * charNumber = ((UIButton*)sender).titleLabel.text;
    EventTypedNumber * event = [EventTypedNumber new];
    if([charNumber isEqualToString:@""]){
        event.isCleaning = YES;
        number = @"";
        event.number = number;
    }else{
        number = [NSString stringWithFormat:@"%@%@", number, charNumber];
        event.number = number;
    }
    PUBLISH(event);
}
@end
