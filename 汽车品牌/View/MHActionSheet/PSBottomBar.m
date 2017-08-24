//
//  PSBottomBar.m
//  PSGenericClass
//
//  Created by Ryan_Man on 16/6/14.
//  Copyright © 2016年 Ryan_Man. All rights reserved.
//

#import "PSBottomBar.h"
#import "UIView+PS.h"
#import "LookCarViewController.h"
@implementation PSBottomBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.userInteractionEnabled = YES;
        
        UIButton * originalButton = [self instanceButton];
        originalButton.backgroundColor =HWColor(234, 183, 62);
        originalButton.x = 0;
        if (originalButton.tag == BottomBarType_Original) {
         
            //originalButton.tag = BottomBarType_Original;
            [originalButton setTitle:@"预约看车" forState:(UIControlStateNormal)];
            [self addSubview:originalButton];

        }else if(originalButton.tag == BottomBarType_Original2){
            [originalButton setTitle:@"预约安装" forState:(UIControlStateNormal)];
            [self addSubview:originalButton];
        
        }
        
        UIButton * upButton = [self instanceButton];
        upButton.tag = BottomBarType_Up;
        upButton.backgroundColor = HWColor(234, 86, 62);
        upButton.x = CGRectGetMaxX(originalButton.frame);
        [upButton setTitle:@"预约下单" forState:(UIControlStateNormal)];
        [self addSubview:upButton];
    }
    return self;
}

- (UIButton*)instanceButton
{
    UIButton * customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton.userInteractionEnabled = YES;
    customButton.y =0;
    customButton.size = CGSizeMake(self.width / 2, self.height-20);
    [customButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [customButton addTarget:self action:@selector(clickEvent:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return customButton;
}
- (void)clickEvent:(UIButton*)sender
{
    if (self.block) {
        _block ((BottomBarType)sender.tag);
        
    }
}
@end
