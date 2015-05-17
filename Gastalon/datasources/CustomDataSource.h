//
//  CustomDataSource.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RealmFactory.h"
#import "Tolo.h"
#import "EventsApi.h"

@protocol CustomDataSource<NSObject>

-(id)initWithTableView:(UITableView*)tableView andHeightCellSize:(CGFloat)size;
@optional
-(void)reloadData;
-(void)loadItems;

@end

@interface CustomDataSource : NSObject<CustomDataSource>{
    CGRect originalTableSize;
    UITableView * table;
    int countOfElements;
    CGFloat cellSize;
    UIRefreshControl * refreshControl;
    CGRect lastTableSize;
}

@end
