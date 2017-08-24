//
//  FootView.h
//  HuiTaoCar
//
//  Created by user on 16/8/19.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FootView : UIView

//全选
@property (nonatomic, strong) UIButton *selectAllButton;
//选中数目
@property (nonatomic, retain) UILabel *selectNumLabel;
//删除
@property (nonatomic, strong) UIButton *deleteButton;

//选中状态
@property (nonatomic, assign) BOOL     isNormalState;

@property (nonatomic, assign) float    money;

@property(nonatomic,strong)UIButton *button3;

@end
