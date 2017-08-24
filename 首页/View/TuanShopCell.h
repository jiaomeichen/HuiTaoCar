//
//  TuanShopCell.h
//  HuiTaoCar
//
//  Created by user on 16/7/31.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuanShopCell : UITableViewCell
@property (nonatomic,strong)UIImageView *zhanImage;

@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *priceLabel;
@property (nonatomic,strong)UILabel *peopleLabel;
@property (nonatomic,strong)UILabel *numPeopel;
@property (nonatomic,strong)UILabel *renLabel;
@property (nonatomic,strong)UIImageView *baomingImage;
@property (nonatomic,strong)UIButton *appointmenBtn;

@property (nonatomic,assign)BOOL isAppointmen;
@property (nonatomic,assign)BOOL isLine;//为YES时有灰条

@end
