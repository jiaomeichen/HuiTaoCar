//
//  ZhuangJuCell.h
//  HuiTaoCar
//
//  Created by user on 16/8/10.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhuangJuCell : UITableViewCell
@property (nonatomic,strong)UIImageView *image;//占位图
@property (nonatomic,strong)UILabel *nameLabel;//墨西哥宝马X5
@property (nonatomic,strong)UILabel *titleLabel;//真皮  黑红蓝
@property (nonatomic,strong)UILabel *priceLabel;//价格
@property (nonatomic,strong)UILabel *pingjiaLabel;//评价
@property (nonatomic,strong)UILabel *numLabel;//人次
@property(nonatomic,strong)UIButton *tejiaBtn;
@property(nonatomic,strong)UIButton *baoyouBtn;

@property (nonatomic,assign)BOOL isShare;
@property (nonatomic,strong)UIButton *seeBtn;
@property (nonatomic,strong)UIButton *downloadBtn;


@property (nonatomic,assign)BOOL isLine;//为YES时有灰条
@property (nonatomic,assign)BOOL isCount;//是否显示5分

@end
