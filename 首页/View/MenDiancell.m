//
//  MenDiancell.m
//  HuiTaoCar
//
//  Created by user on 16/7/27.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "MenDiancell.h"

@implementation MenDiancell

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


    self.nameLabel = [[UILabel alloc]initWithFrame:myRect(96, 15, 180, 13)];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.font = [UIFont systemFontOfSize:MyFontSize13];
    self.nameLabel.text = @"天津汇淘车4S店中山路店";
    self.nameLabel.font=[UIFont boldSystemFontOfSize:MyFontSize13];
    self.nameLabel.textColor=HWColor(51, 51, 51);
    [self.contentView addSubview:self.nameLabel];
    //
    self.titleLabel = [[UILabel alloc]initWithFrame:myRect(96, 38, 178,22)];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.titleLabel.textColor=HWColor(102, 102, 102);
    self.titleLabel.text = @"地址：石家庄高新区长江大道158号";
    [self.contentView addSubview:self.titleLabel];
    //
    self.pinpaiLabel = [[UILabel alloc]initWithFrame:myRect(96, 69,44, 9)];
    self.pinpaiLabel.textAlignment = NSTextAlignmentLeft;
    self.pinpaiLabel.font=[UIFont boldSystemFontOfSize:MYFontSize11];
    self.pinpaiLabel.text = @"经营品牌";
    self.pinpaiLabel.textColor=HWColor(102,102,102);
    [self.contentView addSubview:self.pinpaiLabel];
    //
    self.carLabel=[[UILabel alloc]initWithFrame:myRect(149, 69, 100, 9)];
    self.carLabel.textColor = HWColor(234 , 86, 62);
    self.carLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.carLabel.text = @"宝马";
    [self.contentView addSubview:self.carLabel];
    
    //
    self.dianmianImage = [[UIImageView alloc]initWithFrame:myRect(15, 14, 67, 67)];
    self.dianmianImage.backgroundColor = HWColor(234, 86 ,62);
    self.dianmianImage.image =[UIImage imageNamed:@"home_img_def"];
    [self.contentView addSubview:self.dianmianImage];
    

    //
    self.shuline=[[UIImageView alloc]initWithFrame:myRect(308, 15, 1,66)];
    self.shuline.backgroundColor=HWColor(225, 225, 225);
    self.shuline.image=[UIImage imageNamed:@"形状-2@3x.png"];
    [self.contentView addSubview:self.shuline];
    

    //
    self.addressLabel=[[UILabel alloc]initWithFrame:myRect(324, 57, 40, 10)];
    self.addressLabel.font=[UIFont systemFontOfSize:MYFontSize10];
    self.addressLabel.textColor=HWColor(153, 153, 153);
    self.addressLabel.text=@"到这里去";
    [self.contentView addSubview:self.addressLabel];
    
    self.addressimage=[[UIImageView alloc]initWithFrame:myRect(330, 27, 22, 22)];
    self.addressimage.image=[UIImage imageNamed:@"Order-details_icon_daohang_n"];
    [self.contentView addSubview:self.addressimage];
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
