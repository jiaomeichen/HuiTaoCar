//
//  TiCarTableViewCell.m
//  HuiTaoCar
//
//  Created by user on 16/9/12.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "TiCarTableViewCell.h"

@implementation TiCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setTiCarTableViewCell];
    }
    return self;
}
-(void)setTiCarTableViewCell{

    //
    self.nameLabel = [[UILabel alloc]initWithFrame:myRect(96, 15, 180, 13)];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.font = [UIFont systemFontOfSize:MyFontSize13];
    self.nameLabel.text = @"天津汇淘车4S店中山路店";
    self.nameLabel.font=[UIFont boldSystemFontOfSize:MyFontSize13];
    self.nameLabel.textColor=HWColor(51, 51, 51);
    [self.contentView addSubview:self.nameLabel];
    //
    self.Image = [[UIImageView alloc]initWithFrame:myRect(15, 14, 67, 67)];
    self.Image.backgroundColor = HWColor(234, 86 ,62);
    self.Image.image =[UIImage imageNamed:@"形状-1"];
    [self.contentView addSubview:self.Image];
    

    self.addressLabel = [[UILabel alloc]initWithFrame:myRect(96, 38, 178,50)];
    self.addressLabel.textAlignment = NSTextAlignmentLeft;
    self.addressLabel.numberOfLines=0;
    self.addressLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.addressLabel.textColor=HWColor(102, 102, 102);
    self.addressLabel.text = @"地址：石家庄高新区长江大道158号方式及附件四高级设计师的机构is的竣工文件给我rjgoiihogihg";
    [self.contentView addSubview:self.addressLabel];

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
