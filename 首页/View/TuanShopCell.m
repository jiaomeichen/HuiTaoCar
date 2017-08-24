//
//  TuanShopCell.m
//  HuiTaoCar
//
//  Created by user on 16/7/31.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "TuanShopCell.h"
#import "LoginViewController.h"
@implementation TuanShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code



}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self tableCell];
    }
    return self;
}
-(void)tableCell{

    self.nameLabel = [[UILabel alloc]initWithFrame:myRect(130, 10, 97, 13)];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.font = [UIFont systemFontOfSize:MyFontSize13];
    self.nameLabel.text = @"墨西哥宝马X5";
    self.nameLabel.font=[UIFont boldSystemFontOfSize:MyFontSize13];
    self.nameLabel.textColor=HWColor(51, 51, 51);
    [self.contentView addSubview:self.nameLabel];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:myRect(130, 33, 149, 30)];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.titleLabel.textColor=HWColor(102, 102, 102);
    self.titleLabel.text = @"2016 3.0T 四驱 汽油版 5座是否可使肌肤看电视就看见了电视剧来看大门口撒没打开萨满的卡美森撒发放到是否健康圣诞节大结局的顾客挤公交";
    self.titleLabel.numberOfLines=2;
//    CGSize maximumLabelSize = CGSizeMake(140, 33);//labelsize的最大值
//    CGSize expectSize = [self.titleLabel sizeThatFits:maximumLabelSize];
//    self.titleLabel.frame=myRect(130, 33, expectSize.width,expectSize.height);
    [self.contentView addSubview:self.titleLabel];
    
    
    self.priceLabel = [[UILabel alloc]initWithFrame:myRect(130, 75,100, 12)];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    //self.priceLabel.font = [UIFont systemFontOfSize:MyFontSize13];
    self.priceLabel.font=[UIFont boldSystemFontOfSize:MyFontSize13];
    self.priceLabel.text = @"￥86.5 万";
    self.priceLabel.textColor=HWColor(234, 86, 62);
    [self.contentView addSubview:self.priceLabel];
    
    //蓝色背景图片
    self.baomingImage = [[UIImageView alloc]initWithFrame:myRect(277, 0, 99, 95)];
    self.baomingImage.image =[UIImage imageNamed:@"Group-purchase_btn_lijiyuyue_bg"];
    [self.contentView addSubview:_baomingImage];
    

    self.zhanImage = [[UIImageView alloc]initWithFrame:myRect(15, 10, 101, 76)];
    self.zhanImage.backgroundColor = HWColor(234, 86  ,62);
    self.zhanImage.image =[UIImage imageNamed:@"home_img_def"];
    [self.contentView addSubview:self.zhanImage];
    
    
    self.peopleLabel=[[UILabel alloc]initWithFrame:myRect(290, 28, 37, 11)];
    self.peopleLabel.text=@"已报名";
    self.peopleLabel.textColor=[UIColor whiteColor];
    //   self.peopleLabel.text substringWithRange:[2,4]
    self.peopleLabel.font=[UIFont systemFontOfSize:MYFontSize12];
    [self.contentView addSubview:self.peopleLabel];
    
    self.numPeopel=[[UILabel alloc]initWithFrame:myRect(327, 28,32, 11)];
    self.numPeopel.text=@"9999";
    self.numPeopel.textColor=[UIColor yellowColor];
    //   self.peopleLabel.text substringWithRange:[2,4]
    self.numPeopel.font=[UIFont systemFontOfSize:MYFontSize12];
    [self.contentView addSubview:self.numPeopel];
    
    self.renLabel=[[UILabel alloc]initWithFrame:myRect(359,28,12, 11)];
    self.renLabel.text=@"人";
    self.renLabel.textColor=[UIColor whiteColor];
    //   self.peopleLabel.text substringWithRange:[2,4]
    self.renLabel.font=[UIFont systemFontOfSize:MYFontSize12];
    [self.contentView addSubview:self.renLabel];
    

    
    self.appointmenBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.appointmenBtn.frame=myRect(293, 53, 70, 25);
    [self.appointmenBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    [self.appointmenBtn setTitleColor:HWColor(72, 162, 225) forState:UIControlStateNormal];
    [self.appointmenBtn addTarget:self action:@selector(appointmenButton) forControlEvents:UIControlEventTouchUpInside];

    self.appointmenBtn.font=[UIFont systemFontOfSize:MyFontSize13];
    self.appointmenBtn.backgroundColor=HWColor(243, 227, 51);
    self.appointmenBtn.layer.cornerRadius=10;
    self.appointmenBtn.layer.borderColor=[HWColor(28, 92, 189)CGColor];
    self.appointmenBtn.layer.borderWidth=1.5;
    [self.contentView addSubview:self.appointmenBtn];


}

-(void)appointmenButton{
   
    if (Login) {
    
    [self setIsAppointmen:YES];
    
    }else{
      
        [[NSNotificationCenter defaultCenter] postNotificationName:@"post" object:nil];
            
    }
}
- (void)setIsAppointmen:(BOOL)isAppointmen

{
    if (isAppointmen) {
     
        //
        self.appointmenBtn.hidden=YES;
        self.baomingImage.hidden=YES;
        self.numPeopel.hidden=YES;
        self.renLabel.hidden=YES;
        //
        self.peopleLabel.textColor=[UIColor blackColor];
        self.peopleLabel.frame=myRect(290, 50, 80, 11);
        //
        self.baomingImage=[[UIImageView alloc]initWithFrame:myRect(267, 0, 92, 79)];
        self.baomingImage.image=[UIImage imageNamed:@"Group-purchase_img_yibaoming"];
        [self.contentView addSubview:self.baomingImage];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
