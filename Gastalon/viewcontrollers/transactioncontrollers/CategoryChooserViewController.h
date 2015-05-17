//
//  CategoryChooserViewController.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "ViewController.h"
#import "CategoryDataSource.h"

@interface CategoryChooserViewController : ViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionCategories;
@property (nonatomic, strong) CategoryDataSource * dataSource;
-(void)setup;
@end
