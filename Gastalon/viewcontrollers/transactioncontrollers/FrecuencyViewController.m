//
//  FrecuencyViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "FrecuencyViewController.h"
#import "Frecuency.h"
#import "Colors.h"
#import "Statics.h"

@interface FrecuencyViewController ()

@end

@implementation FrecuencyViewController{
    NSMutableArray * frecuencies;
    NSIndexPath * lastIndexPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Frecuency * f = [Frecuency new];
    f.idFrecuency = FRECUENCY_BIMONTHLY;
    f.name = NSLocalizedString(@"FRECUENCY_BIMONTHLY", nil);
    
    Frecuency * f2 = [Frecuency new];
    f2.idFrecuency = FRECUENCY_DAILY;
    f2.name = NSLocalizedString(@"FRECUENCY_DAILY", nil);
    
    Frecuency * f3 = [Frecuency new];
    f3.idFrecuency = FRECUENCY_EACH_THREE_MONTHS;
    f3.name = NSLocalizedString(@"FRECUENCY_EACH_THREE_MONTHS", nil);
    
    Frecuency * f4 = [Frecuency new];
    f4.idFrecuency = FRECUENCY_EACH_YEAR;
    f4.name = NSLocalizedString(@"FRECUENCY_EACH_YEAR", nil);
    
    Frecuency * f5 = [Frecuency new];
    f5.idFrecuency = FRECUENCY_EVERY_TWO_WEEKS;
    f5.name = NSLocalizedString(@"FRECUENCY_EVERY_TWO_WEEKS", nil);
    
    Frecuency * f6 = [Frecuency new];
    f6.idFrecuency = FRECUENCY_MONTHLY;
    f6.name = NSLocalizedString(@"FRECUENCY_MONTHLY", nil);
    
    Frecuency * f7 = [Frecuency new];
    f7.idFrecuency = FRECUENCY_SIXTLY;
    f7.name = NSLocalizedString(@"FRECUENCY_SIXTLY", nil);
    
    Frecuency * f8 = [Frecuency new];
    f8.idFrecuency = FRECUENCY_WEEKLY;
    f8.name = NSLocalizedString(@"FRECUENCY_WEEKLY", nil);
    frecuencies = [[NSMutableArray alloc] init];
    [frecuencies addObject:f];
    [frecuencies addObject:f2];
    [frecuencies addObject:f3];
    [frecuencies addObject:f4];
    [frecuencies addObject:f5];
    [frecuencies addObject:f6];
    [frecuencies addObject:f7];
    [frecuencies addObject:f8];
    self.frecuencyTableView.delegate = self;
    self.frecuencyTableView.dataSource = self;
    self.frecuencyTableView.allowsMultipleSelection = NO;
    self.frecuencyTableView.allowsSelection = YES;
    self.frecuencyTableView.backgroundColor = [UIColor clearColor];
    self.frecuencyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.frecuencyTableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger newRow = [indexPath row];
    NSInteger oldRow = lastIndexPath ? [lastIndexPath row] : -1;
    if (newRow != oldRow)
    {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:lastIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        lastIndexPath = indexPath;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return frecuencies.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    Frecuency * frecuency = [frecuencies objectAtIndex:indexPath.row];
    cell.textLabel.text = frecuency.name;
    [cell.textLabel setFont:[UIFont fontWithName:GASTALON_FONT_NAME_LIGHT size:14]];
    cell.textLabel.textColor = GASTALON_COLOR;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)dealloc{
    self.frecuencyTableView.delegate = nil;
    self.frecuencyTableView.dataSource = nil;
}

@end
