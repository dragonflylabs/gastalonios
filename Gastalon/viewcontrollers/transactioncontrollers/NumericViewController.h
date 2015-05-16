//
//  NumericViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/3/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"
#import "EventsApi.h"

@interface NumericViewController : ViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
- (IBAction)onNumberClick:(id)sender;
@end
