//
//  ChooseColorView.h
//  HuiTaoCar
//
//  Created by user on 16/9/18.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJTagView.h"

@interface ChooseColorView : UIView<YJTagViewDelegate>

@property(nonatomic,strong)UIView *view;

//是否可以通过下滑手势关闭视图, 默认为YES
@property (nonatomic, assign) BOOL useGesturer;

//是否正在显示
@property (nonatomic, getter = isShowing) BOOL show;
//图片
@property(nonatomic,strong)UIImageView *imageView;

//
@property(nonatomic,strong)UILabel *price;
@property(nonatomic,strong)UILabel *color;
@property(nonatomic,strong)UILabel *text;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIImageView *imageView2;
@property(nonatomic,strong)UIView *xian;
@property(nonatomic,strong)NSArray *array;//颜色数组


@end
