//
//  YuYueCell.m
//  HuiTaoCar
//
//  Created by user on 16/7/28.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "YuYueCell.h"

@implementation YuYueCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createCell];
    }
    return self;
}

-(void)createCell{

    self.titleLable=[[UILabel alloc]initWithFrame:myRect(15, 17, 90, 13)];
    self.titleLable.font=[UIFont systemFontOfSize:MyNavTitleSize];
    self.titleLable.textColor=HWColor(40, 40, 40);
    [self.contentView addSubview:self.titleLable];
    //
    self.textTF=[[UITextField alloc]initWithFrame:myRect(101, 0, 274, 46)];
    self.textTF.textColor=HWColor(153, 153, 153);
    self.textTF.placeholder=@"请填写您对颜色的要求";
    self.textTF.font=[UIFont systemFontOfSize:MyNavTitleSize];
    self.textTF.textColor=[UIColor blackColor];
    [self.contentView addSubview:self.textTF];
       
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
