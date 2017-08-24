//
//  ChooseColorView.m
//  HuiTaoCar
//
//  Created by user on 16/9/18.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ChooseColorView.h"
#import "YJTagFrame.h"
#import "FillViewController.h"

#define BACKGROUNDCOLOR [UIColor colorWithRed:239.0/255.0 green:34.0/255.0 blue:109.0/255.0 alpha:1.0]

@implementation ChooseColorView


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor whiteColor];
      
        [self animationFrame];
        _imageView=[[UIImageView alloc]initWithFrame:myRect(20, -10, 100, 75)];
        _imageView.backgroundColor=[UIColor blackColor];
        _imageView.layer.borderWidth=5;
        _imageView.layer.borderColor=[HWColor(230, 230, 230) CGColor];
        [self addSubview:_imageView];
        
        
        _price=[[UILabel alloc]initWithFrame:myRect(136, 15, 158, 25)];
        _price.text=@"￥86.41";
        _price.font=[UIFont systemFontOfSize:MyFontSize17];
        _price.textColor=HWColor(234, 86, 62);
        [self addSubview:_price];
        
        _color=[[UILabel alloc]initWithFrame:myRect(136, 45, 158, 20)];
        _color.text=@"已选择“黑颜色”";
        _color.font=[UIFont systemFontOfSize:MyFontSize16];
        _color.textColor=HWColor(102,102, 102);
        [self addSubview:_color];
        
        _xian=[[UIView alloc]initWithFrame:myRect(0, 75, 375, 1)];
        _xian.backgroundColor=HWColor(230, 230, 230);
        [self addSubview:_xian];
    
        _text=[[UILabel alloc]initWithFrame:myRect(20, 85, 158, 20)];
        _text.text=@"颜色分类";
        _text.font=[UIFont systemFontOfSize:MyFontSize16];
        _text.textColor=HWColor(102,102, 102);
        [self addSubview:_text];
        
        
        _backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"color_icon_close_n"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"color_icon_close_pre"] forState:UIControlStateHighlighted];
        [_backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        
        _backBtn.frame=myRect(338, 30, 22, 22);
        [self addSubview:_backBtn];
        
        [self chooseColor];
    }
    
    return self;
}


-(void)backClick{
    
    YYLog(@"点击X");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    self.frame=myRect(0, 680, 375, 330);
    [UIView commitAnimations];
    
}

-(void)animationFrame{

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    self.frame=myRect(0, 288, 375, 330);
    
    [UIView animateWithDuration:2 delay:2 usingSpringWithDamping:1 initialSpringVelocity:2 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        
    } completion:^(BOOL finished) {
        
        
        
    }];

    [UIView commitAnimations];

}

-(void)chooseColor{
    
    
    _array = @[@"code4app",@"轻音少女",@"花季少女",@"我们仍未知道那天所看见的花的名字",@"华语",@"花有重开日",@"空之境界"];
    
    YJTagFrame *frame = [[YJTagFrame alloc] init];
    frame.tagsMinPadding = 10;
    frame.tagsMargin = 10;
    frame.tagsLineSpacing = 10;
    frame.tagsArray = _array;
    //
    YJTagView *tagView = [[YJTagView alloc] initWithFrame:CGRectMake(0,110, ScreenWidth, frame.tagsHeight)];
    tagView.clickbool = YES;
    tagView.borderSize = 0.5;
    tagView.clickborderSize = 0.5;
    tagView.tagsFrame = frame;
    tagView.clickBackgroundColor = BACKGROUNDCOLOR;
    tagView.clickTitleColor = BACKGROUNDCOLOR;
    tagView.clickStart = 0;
    tagView.clickString = @"华语";//单选  tagView.clickStart 为0
    tagView.delegate = self;
    
    [self addSubview:tagView];
    
}

#pragma mark 选中
-(void)YJTagView:(NSArray *)tagArray{
    
    YYLog(@"%@",tagArray);
    
    
}
-(void)YJTag:(int)tag{
    
    YYLog(@"0000%d",tag);
    
  //  [self creatLabel:colorLabel setupColor:HWColor(200, 200, 200) setupUIFont:MyFontSize17 setupText:array[tag]];
}


@end
