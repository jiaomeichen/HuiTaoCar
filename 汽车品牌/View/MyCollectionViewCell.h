//
//  MyCollectionViewCell.h
//  Day13-UICollectionView
//
//  Created by user on 16/8/26.
//  Copyright (c) 2016年 Meakelra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogoModel.h"
@interface MyCollectionViewCell : UICollectionViewCell

@property (nonatomic)LogoModel *logoModel;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel     *label;

@end
