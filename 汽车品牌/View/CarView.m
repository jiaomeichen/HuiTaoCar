//
//  CarView.m
//  LBJH
//
//  Created by macbook on 16/10/10.
//  Copyright © 2016年 cttx. All rights reserved.
//

#import "CarView.h"

@implementation CarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self createUI];
       
        _carTypeArray=@[@"宝马",@"奔驰",@"丰田",@"大众",@"道奇",@"福特",@"本田",@"玛莎拉蒂",@"路虎",@"野马",@"全部"];
        _fromArray=@[@"美规",@"欧规",@"墨西哥",@"改版",@"不限"];
        _typeArray=@[@"现车",@"期车"];
    }
    return self;
}

- (void)createUI
{
    NSArray *titleNameArray=@[@"车型",@"来源",@"现车/期车",@"所在城市"];
    
    for (int i=0; i<4; i++) {
      
        UILabel *lab=[[UILabel alloc] init];
        lab.frame=CGRectMake(10+(ScreenWidth-20)/4*i, 8, (ScreenWidth-20)/4, 12);
        lab.text=titleNameArray[i];
        lab.font=[UIFont systemFontOfSize:MyFontSize13];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.textColor=HWColor(153, 153, 153);
        [self addSubview:lab];
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(10+(ScreenWidth-20)/4*i, 25, (ScreenWidth-20)/4, 15);
        [btn setTitle:@"全部" forState:0];
        [btn setTitleColor:HWColor(230, 230, 230) forState:0];
        btn.titleLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
        btn.tag=1000+i;
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        
       // btn.imageEdgeInsets=
        [btn setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_n"]forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_s"]forState:UIControlStateSelected];
       // btn.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, 0.0, 10 );
//        btn.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,btn.titleLabel.frame.size.width);
//        btn.titleEdgeInsets=UIEdgeInsetsMake(0, btn.titleLabel.frame.size.width, 0, 3);        //btn.titleLabel.adjustsFontSizeToFitWidth = YES;
//        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        UIView *lineView=[[UIView alloc] init];
        lineView.frame=CGRectMake(20+12*i+(ScreenWidth-70)/4*i,47, (ScreenWidth-70)/4, 1);
        lineView.backgroundColor=HWColor(153, 153, 153);
        [self addSubview:lineView];
    }
}

- (void)btnClick:(UIButton *)btn
{
    
    if (btn.tag==1000) {
      
        [self.selectDelegate SelectViewWithBtn:btn andWithDataArray:_carTypeArray];
    }
    
    else if (btn.tag==1001){
       
        [self.selectDelegate SelectViewWithBtn:btn andWithDataArray:_fromArray];
    }
    
    else if (btn.tag==1002){
    
        [self.selectDelegate SelectViewWithBtn:btn andWithDataArray:_typeArray];
    }
    
    else{
        
    }
}


@end
