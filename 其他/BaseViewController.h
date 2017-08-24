//
//  BaseViewController.h
//  HuiTaoCar
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void)creatLabel:(UILabel *)label setupColor:(UIColor *)color setupUIFont:(CGFloat)font setupText:(NSString *)text;
-(void)showHUD:(NSString *)title view:(UIView *)view time:(NSInteger)time;
- (BOOL)validateNumber:(NSString *) textString;//判断手机号的正则表达式
//-(void)setSDCycleScrollView:(SDCycleScrollView *)ScrollView addView:(UIView *)view;
-(void)setSDCycleScrollView:(SDCycleScrollView *)ScrollView addView:(UIView *)view from:(CGRect)from;
@end
