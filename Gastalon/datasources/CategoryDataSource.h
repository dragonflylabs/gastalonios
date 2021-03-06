//
//  CategoryDataSource.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 5/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryDataSource : NSObject<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic, strong) NSMutableArray * categories;
@end
