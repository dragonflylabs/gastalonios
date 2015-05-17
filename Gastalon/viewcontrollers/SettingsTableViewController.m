//
//  SettingsTableViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "HtmlViewController.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            if(indexPath.row == 0){
                
            }else if(indexPath.row == 1){
                
            }
            break;
        }
        case 1:{
            if(indexPath.row == 0){
                
            }else if(indexPath.row == 1){
                
            }else if(indexPath.row == 2){
                
            }
            break;
        }
        case 3:{
            [self logout];
            break;
        }
        default:
            break;
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SEGUEPOLICYCONTROLLER"]) {
        HtmlViewController * controller = (HtmlViewController*)[segue destinationViewController];
        controller.typeHtml = @"policy";
    }else if ([[segue identifier] isEqualToString:@"SEGUECONDITIONSCONTROLLER"]) {
        HtmlViewController * controller = (HtmlViewController*)[segue destinationViewController];
        controller.typeHtml =  @"conditions";
    }
}

-(void)logout{
    
}

@end
