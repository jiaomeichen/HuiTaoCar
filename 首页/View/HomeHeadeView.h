//
//  HomeHeadeView.h
//  HuiTaoCar
//
//  Created by user on 16/10/14.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeHeadeView;

@protocol SelectHeadeViewDelegate<NSObject>

-(void)SelectHeaderViewDelegat:(UIButton *)bt pushWithViewController:(UIViewController *)ViewController;

@end

@interface HomeHeadeView : UIView
/**按钮*/
@property(nonatomic,strong)UIButton *moveBtn;
/**标题头*/
@property(nonatomic,strong)UILabel *titleLabel;
//
@property(nonatomic,assign)id<SelectHeadeViewDelegate>delegate;

@end
