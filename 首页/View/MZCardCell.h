//
//  MZCardCell.h
//  互联网金融圈
//
//  Created by LeoLiu on 16/6/15.
//  Copyright © 2016年 muzhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "carInfoModel.h"

@interface MZCardCell : UITableViewCell

@property (nonatomic)carInfoModel *carModel;

@property (nonatomic,strong)UIImageView *image;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *priceLabel;
@property (nonatomic,strong)UILabel *addressLabel;
@property (nonatomic,strong)UILabel *scoreLabel;
@property (nonatomic,strong)UIImageView *xiancheImage;
@property (nonatomic,strong)UILabel *colorLabel;
@property (nonatomic,assign)BOOL isShare;
@property (nonatomic,strong)UIButton *seeBtn;
@property (nonatomic,strong)UIButton *downloadBtn;
@property (nonatomic,strong)UIImageView *addressimage;
@property(nonatomic,strong)UIView *backgrounView;
@property(nonatomic,strong)UIButton *BtnTuan;//团购
@property(nonatomic,strong)UILabel *numberLabel;//订单号
@property(nonatomic,strong)UILabel *stateLabel;//已经预约/状态
@property(nonatomic,strong)UILabel *DepositLable;//定金
@property(nonatomic,strong)UIView *backView;//背景小圆点

@property (nonatomic,assign)BOOL isLine;//为YES时有灰条
@property (nonatomic,assign)BOOL isCount;//是否显示5分

@end
