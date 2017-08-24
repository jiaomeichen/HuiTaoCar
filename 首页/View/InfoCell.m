//
//  InfoCell.m
//  HuiTaoCar
//
//  Created by user on 16/8/11.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "InfoCell.h"

@implementation InfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setInfoCell];
    }
    return self;
}
-(void)setInfoCell{

    _titleLabel=[[UILabel alloc]initWithFrame:myRect(15, 13,346, 33)];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont systemFontOfSize:MyNavTitleSize];
    self.titleLabel.text = @"墨西哥宝马X5部分人跟人给你打三国杀个人更爱是福建省分行及和谷歌和贵金属的国际化是国际";
    self.titleLabel.font=[UIFont boldSystemFontOfSize:MyFontSize13];
    self.titleLabel.textColor=HWColor(51, 51, 51);
    self.titleLabel.numberOfLines=2;
    [self.contentView addSubview:self.titleLabel];
    
    self.colorLabel = [[UILabel alloc]initWithFrame:myRect(15,56, 149, 12)];
    self.colorLabel.textAlignment = NSTextAlignmentLeft;
    self.colorLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.colorLabel.textColor=HWColor(102, 102, 102);
    self.colorLabel.text = @"真皮   黑/红/蓝";
    [self.contentView addSubview:self.colorLabel];
    
    //
    self.priceLabel = [[UILabel alloc]initWithFrame:myRect(15, 80,68, 15)];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.priceLabel.font=[UIFont boldSystemFontOfSize:MyFontSize16];
    self.priceLabel.text = @"￥86.5万";
    self.priceLabel.textColor=HWColor(234, 86, 62);
    [self.contentView addSubview:self.priceLabel];
    

    //
    self.benefitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.benefitBtn.frame=myRect(97, 79,61 , 16);
    [self.benefitBtn setTitle:@"特惠价格" forState:UIControlStateNormal];
    [self.benefitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.benefitBtn.titleLabel.font=[UIFont systemFontOfSize:MYFontSize11];
    self.benefitBtn.backgroundColor=HWColor(235, 100, 131);
    [self.contentView addSubview:self.benefitBtn];
    
    
    //
    self.oldpriceLbel = [[UILabel alloc]initWithFrame:myRect(15,108, 70, 11)];
    self.oldpriceLbel.textAlignment = NSTextAlignmentLeft;
    self.oldpriceLbel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.oldpriceLbel.text = @"￥ 186.41";
    self.oldpriceLbel.textColor=HWColor(153, 153, 153);
    [self.contentView addSubview:self.oldpriceLbel];
    
    //
    self.line=[[UILabel alloc]initWithFrame:myRect(15, 113, 50, 1)];
    self.line.backgroundColor=HWColor(153, 153, 153);
    [self.contentView addSubview:self.line];

    //
    self.kuaidiLabel = [[UILabel alloc]initWithFrame:myRect(15, 140, 70, 11)];
    self.kuaidiLabel.textAlignment = NSTextAlignmentLeft;
    self.kuaidiLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.kuaidiLabel.text = @"快递：免运费";
    self.kuaidiLabel.textColor=HWColor(153, 153, 153);
    [self.contentView addSubview:self.kuaidiLabel];
   
    //
    self.numLabel = [[UILabel alloc]initWithFrame:myRect(153, 140, 70, 11)];
    self.numLabel.textAlignment = NSTextAlignmentLeft;
    self.numLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.numLabel.text = @"8888人订购";
    self.numLabel.textColor=HWColor(153, 153, 153);
    [self.contentView addSubview:self.numLabel];
    
    //
    self.markLabel = [[UILabel alloc]initWithFrame:myRect(300,140,66,11)];
    self.markLabel.text=@"好评:5.0分";
    self.markLabel.font=[UIFont systemFontOfSize:MYFontSize11];
    self.markLabel.textColor=HWColor(153, 153, 153);
    [self.contentView addSubview:self.markLabel];
    


}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
