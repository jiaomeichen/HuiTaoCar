//
//  InfoCell.h
//  HuiTaoCar
//
//  Created by user on 16/8/11.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;//标题
@property(nonatomic,strong)UILabel *colorLabel;//真皮   颜色
@property(nonatomic,strong)UILabel *priceLabel;//价格
@property(nonatomic,strong)UILabel *oldpriceLbel;//旧的价格
@property(nonatomic,strong)UILabel *kuaidiLabel;//快递
@property(nonatomic,strong)UILabel *numLabel;//销量
@property(nonatomic,strong)UILabel *markLabel;//评分
@property(nonatomic,strong)UIButton *benefitBtn;//优惠价格
@property(nonatomic,strong)UIView *line;//线
@end
