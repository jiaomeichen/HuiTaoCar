//
//  HeaderView.h
//  HuiTaoCar
//
//  Created by user on 16/8/19.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) UIButton *selectStoreGoodsButton;
@property (nonatomic,assign)BOOL isLine;//为YES时有

+ (CGFloat)getCartHeaderHeight;


@end
