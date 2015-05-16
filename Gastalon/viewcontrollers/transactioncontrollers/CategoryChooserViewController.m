//
//  CategoryChooserViewController.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/3/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CategoryChooserViewController.h"

@interface CategoryChooserViewController ()

@end

@implementation CategoryChooserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self reloadData];
}

-(void)setup{
    self.dataSource = [[CategoryDataSource alloc] init];
    self.collectionCategories.backgroundColor = [UIColor clearColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setMinimumInteritemSpacing:5.0f];
    [flowLayout setMinimumLineSpacing:20.0f];
    [self.collectionCategories setCollectionViewLayout:flowLayout];
    self.collectionCategories.dataSource = self.dataSource;
    self.collectionCategories.delegate = self.dataSource;
}

-(void)reloadData{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    for(int i = 0; i < 45; i++){
        [array addObject:@(i)];
    }
    [self.dataSource setCategories:array];
    [self.collectionCategories reloadData];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    self.collectionCategories.delegate = nil;
    self.collectionCategories.dataSource = nil;
}

@end
