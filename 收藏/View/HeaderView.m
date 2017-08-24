//
//  HeaderView.m
//  HuiTaoCar
//
//  Created by user on 16/8/19.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView()

@property (nonatomic, strong) UIButton *storeNameButton;

@end

@implementation HeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setHeaderUI];
    }
    return self;
}

- (void)setHeaderUI{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //
    self.selectStoreGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectStoreGoodsButton.frame = CGRectMake(15, 0, 30, 30);
    [self.selectStoreGoodsButton setImage:[UIImage imageNamed:@"shouchang__register_rb_n"]
                                 forState:UIControlStateNormal];
    [self.selectStoreGoodsButton setImage:[UIImage imageNamed:@"chouchang_register_rb_s"]
                                 forState:UIControlStateSelected];
    self.selectStoreGoodsButton.hidden=YES;
    [_selectStoreGoodsButton addTarget:self action:@selector(selectStoreGoodsButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.selectStoreGoodsButton.backgroundColor=[UIColor clearColor];
    [self addSubview:self.selectStoreGoodsButton];
    

    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
    line.backgroundColor=HWColor(225, 225, 225);
    [self addSubview:line];
    
    UIView *line2=[[UIView alloc]initWithFrame:CGRectMake(0, 30, ScreenWidth, 0.5)];
    line2.backgroundColor=HWColor(225, 225, 225);
    [self addSubview:line2];
    

    
}

//- (void)setIsLine:(BOOL)isLine
//{
//    if (isLine) {
//       
//        UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
//        line.backgroundColor=HWColor(225, 225, 225);
//        [self addSubview:line];
//        
//        UIView *line2=[[UIView alloc]initWithFrame:CGRectMake(0, 30, ScreenWidth, 0.5)];
//        line2.backgroundColor=HWColor(225, 225, 225);
//        [self addSubview:line2];
//    
//    }
//}
//

-(void)selectStoreGoodsButton:(UIButton *)send{

    send.selected=!send.selected;
    
    YYLog(@"eeeeeeeeeeee");

}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.selectStoreGoodsButton.frame = CGRectMake(8, 0, 36, 30);
   // [self.storeNameButton setFrame:CGRectMake(0, 0, 78, self.frame.size.height)];
    self.storeNameButton.frame = CGRectMake(50, 0, ScreenWidth-50, 30);
    
}

+ (CGFloat)getCartHeaderHeight{
    
    return 30;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
