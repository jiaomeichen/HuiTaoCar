//
//  YJButton.m
//  HuiTaoCar
//
//  Created by user on 16/7/14.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "YJButton.h"
#import "UIView+XMGExtension.h"
@implementation YJButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setup{

    self.titleLabel.textAlignment=NSTextAlignmentCenter;
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        [self setup];
    }
    return self;

}
-(void)awakeFromNib{

    [self setup];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}









@end
