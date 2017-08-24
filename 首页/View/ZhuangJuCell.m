//
//  ZhuangJuCell.m
//  HuiTaoCar
//
//  Created by user on 16/8/10.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ZhuangJuCell.h"

@implementation ZhuangJuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSubviews];
    }
    return self;
}
- (void)setSubviews
{
    
    //
    self.image = [[UIImageView alloc]initWithFrame:myRect(15, 11, 100, 75)];
    self.image.backgroundColor = HWColor(234, 86  ,62);
    self.image.image =[UIImage imageNamed:@"home_img_def"];
    [self.contentView addSubview:self.image];
    
    //
    self.nameLabel = [[UILabel alloc]initWithFrame:myRect(130, 10, 97, 13)];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.font = [UIFont systemFontOfSize:MyFontSize13];
    self.nameLabel.text = @"墨西哥宝马X5";
    self.nameLabel.font=[UIFont boldSystemFontOfSize:MyFontSize13];
    self.nameLabel.textColor=HWColor(51, 51, 51);
    [self.contentView addSubview:self.nameLabel];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:myRect(130, 33, 149, 11)];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.titleLabel.textColor=HWColor(102, 102, 102);
    self.titleLabel.text = @"真皮   黑/红/蓝";
    [self.contentView addSubview:self.titleLabel];
    
    //
    self.tejiaBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.tejiaBtn.frame=myRect(130, 49, 27, 14);
    [self.tejiaBtn setTitle:@"特价" forState:UIControlStateNormal];
    [self.tejiaBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.tejiaBtn.titleLabel.font=[UIFont systemFontOfSize:MYFontSize10];
    self.tejiaBtn.backgroundColor=HWColor(235, 100, 131);
    [self.contentView addSubview:self.tejiaBtn];
    
    //
    self.baoyouBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.baoyouBtn.frame=myRect(161, 49, 27, 14);
    [self.baoyouBtn setTitle:@"包邮" forState:UIControlStateNormal];
    [self.baoyouBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.baoyouBtn.titleLabel.font=[UIFont systemFontOfSize:MYFontSize10];
    self.baoyouBtn.backgroundColor=HWColor(236, 168, 6);
    [self.contentView addSubview:self.baoyouBtn];
    

    
    //
    self.priceLabel = [[UILabel alloc]initWithFrame:myRect(130, 74,63, 11)];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.priceLabel.font=[UIFont boldSystemFontOfSize:MyFontSize13];
    self.priceLabel.text = @"￥86.5 万";
    self.priceLabel.textColor=HWColor(234, 86, 62);
    [self.contentView addSubview:self.priceLabel];
    
    //
    self.numLabel = [[UILabel alloc]initWithFrame:myRect(195, 74, 100, 11)];
    self.numLabel.textAlignment = NSTextAlignmentLeft;
    self.numLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.numLabel.text = @"8888人订购";
    self.numLabel.textColor=HWColor(153, 153, 153);
    [self.contentView addSubview:self.numLabel];

    //
    self.pingjiaLabel = [[UILabel alloc]initWithFrame:myRect(300,74,66,11)];
    self.pingjiaLabel.text=@"好评:5.0分";
    self.pingjiaLabel.font=[UIFont systemFontOfSize:MYFontSize11];
    self.pingjiaLabel.textColor=HWColor(153, 153, 153);
    [self.contentView addSubview:self.pingjiaLabel];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
