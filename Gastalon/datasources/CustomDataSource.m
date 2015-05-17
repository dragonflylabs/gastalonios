//
//  CustomDataSource.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CustomDataSource.h"
#import "Colors.h"

@implementation CustomDataSource

-(id)initWithTableView:(UITableView*)tableView andHeightCellSize:(CGFloat)size{
    self = [super init];
    if(self){
        table = tableView;
        originalTableSize = tableView.frame;
        cellSize = size;
        countOfElements = 0;
        refreshControl = [[UIRefreshControl alloc] init];
        refreshControl.backgroundColor = GASTALON_COLOR;
        refreshControl.tintColor = [UIColor whiteColor];
        
        [refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
        [tableView addSubview:refreshControl];
        lastTableSize = tableView.frame;
    }
    return self;
}

-(void)loadItems{
    
}

-(void)reloadData{
    [self loadItems];
    if(countOfElements * cellSize <= lastTableSize.size.height){
        table.frame = CGRectMake(table.frame.origin.x,
                                 table.frame.origin.y,
                                 table.frame.size.width,
                                 countOfElements * cellSize);
        //table.scrollEnabled = NO;
    }else{
        table.frame = originalTableSize;
        //table.scrollEnabled = YES;
    }
    [table reloadData];
    if (refreshControl) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"Last_Update", nil),[formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        refreshControl.attributedTitle = attributedTitle;
        [refreshControl endRefreshing];
    }
    lastTableSize = table.frame;
}

@end
