//
//  HomeHeadeView.m
//  HuiTaoCar
//
//  Created by user on 16/10/14.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "HomeHeadeView.h"
#import "SellingViewController.h"
@implementation HomeHeadeView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
     
        [self createHeader];
        
        
    }
    return self;
}

/**标题头的UI*/
-(void)createHeader{

   // NSArray *arr=@[@"热销车型",@"一口价",@"特惠车型",@"团购车型"];
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 100, 30)];
    _titleLabel.text=@"热销车型";
    _titleLabel.textColor=HWColor(234, 86, 62);
    _titleLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
    [self addSubview:_titleLabel];
 
    /**按钮*/
    _moveBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_moveBtn setImage:[UIImage imageNamed:@"common_icon_arrow_n"] forState:UIControlStateNormal];
    //文字左图片右的设置
    [_moveBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -19, 0, 20)];
    [_moveBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 50, 0, 30)];
    _moveBtn.titleLabel.font=[UIFont systemFontOfSize:MYFontSize11];
    [_moveBtn setTitleColor:HWColor(102,102,102) forState:UIControlStateNormal];
    
    [_moveBtn addTarget:self action:@selector(moveClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_moveBtn];
    
}

-(void)moveClick:(UIButton *)btn{

    SellingViewController *selling=[[SellingViewController alloc]init];
    [self.delegate SelectHeaderViewDelegat:btn pushWithViewController:selling];

}


@end
