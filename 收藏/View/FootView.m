//
//  FootView.m
//  HuiTaoCar
//
//  Created by user on 16/8/19.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "FootView.h"

//static NSInteger const BalanceButtonTag = 120;

static NSInteger const DeleteButtonTag = 121;

static NSInteger const SelectButtonTag = 122;
 
@interface UIImage (JS)

+ (UIImage *)imageWithColor:(UIColor *)color ;

@end

@implementation UIImage (JS)

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end

@implementation FootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBarUI];
    }
    return self;
}

- (void)setBarUI{
    
    self.backgroundColor = [UIColor clearColor];
    /* 背景 */
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.userInteractionEnabled = NO;
    effectView.frame = self.bounds;
    [self addSubview:effectView];
    
    CGFloat wd = ScreenWidth*2/7;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
    lineView.backgroundColor  = HWColor(210, 210, 210);
    [self addSubview:lineView];
    
    /* 删除 */
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
    [button1 setTitle:@"删除" forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"shouchang_tab_delete_n"] forState:UIControlStateNormal];
    [button1 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 15)];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    [button1 setFrame:CGRectMake(ScreenWidth-wd, 0, wd, self.frame.size.height)];
    //button1.enabled = NO;
    //button1.hidden = YES;
    button1.tag = DeleteButtonTag;
    [self addSubview:button1];
    _deleteButton = button1;
    
    /* 全选 */
    _button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button3 setTitle:@"全选"
             forState:UIControlStateNormal];
    [_button3 setTitleColor:[UIColor blackColor]
                  forState:UIControlStateNormal];
    [_button3 setImage:[UIImage imageNamed:@"shouchang__register_rb_n"]
             forState:UIControlStateNormal];
    [_button3 setImage:[UIImage imageNamed:@"chouchang_register_rb_s"]
             forState:UIControlStateSelected];
    [_button3 addTarget:self action:@selector(selectAllBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_button3 setFrame:CGRectMake(0, 0, 78, self.frame.size.height)];
    [_button3 setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    _button3.tag = SelectButtonTag;
    [self addSubview:_button3];
    _selectAllButton = _button3;
   
    /* 选择数目 */
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(wd, 0, ScreenWidth-wd*2-5, self.frame.size.height)];
    label1.text = [NSString stringWithFormat:@"共选择:888",@(00.00)];
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:MyNavTitleSize];
    label1.textAlignment = NSTextAlignmentRight;
    [self addSubview:label1];
    _selectNumLabel = label1;

}

-(void)selectAllBtn:(UIButton *)send{

    _selectAllButton.selected=!send.selected;

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
