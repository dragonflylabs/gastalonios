//
//  CategoryDataSource.m
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/28/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import "CategoryDataSource.h"
#import "CellCollectionCategory.h"

@implementation CategoryDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categories.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(55, 90);
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CellCollectionCategory * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELLCOLLECTIONCATEGORY" forIndexPath:indexPath];
    cell.lblCategory.text = @"Una categoría";
    cell.imgCategory.image = [UIImage imageNamed:@"IconAddAccount"];
    cell.ctlCategory.layer.cornerRadius = cell.ctlCategory.frame.size.width / 2;
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
