//
//  TabViewController.h
//  Gastalon
//
//  Created by Mobile Developer on 1/7/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"

@interface TabViewController : ViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnAdd;
-(void)designMenuItemsAccount;
-(void)openMenu;
@end
