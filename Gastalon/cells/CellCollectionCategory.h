//
//  CellCollectionCategory.h
//  Gastalon
//
//  Created by Daniel García Alvarado on 4/17/15.
//  Copyright (c) 2015 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellCollectionCategory : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblCategory;
@property (weak, nonatomic) IBOutlet UIImageView *imgCategory;
@property (weak, nonatomic) IBOutlet UIControl *ctlCategory;

@end
