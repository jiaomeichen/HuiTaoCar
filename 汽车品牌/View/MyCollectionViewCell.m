//
//  MyCollectionViewCell.m
//  Day13-UICollectionView
//
//  Created by user on 16/8/26.
//  Copyright (c) 2016年 Meakelra. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self createUI];
    }
    return self;
}
- (void)createUI{
    
    _imageView = [[UIImageView alloc] initWithFrame:myRect(18, 11, 24, 24)];
    //将imageView添加到collectionViewCell上面
    [self.contentView addSubview:_imageView];
    //
    _label = [[UILabel alloc] initWithFrame:myRect(5, 44, 45, 11)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = HWColor(40, 40, 40);
    _label.font = [UIFont systemFontOfSize:MYFontSize11];
    _label.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:_label];

}
//模型赋值
-(void)setLogoModel:(LogoModel *)logoModel{

    _logoModel=logoModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_logoModel.logoString]];
    YYLog(@"=======%@",_logoModel.logoString);
    self.label.text=@"福特";
}

@end
