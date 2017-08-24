//
//  MZCardCell.m
//  互联网金融圈
//
//  Created by LeoLiu on 16/6/15.
//  Copyright © 2016年 muzhong. All rights reserved.
//

#import "MZCardCell.h"

@implementation MZCardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}
- (void)createSubviews
{
    self.backgrounView=[[UIView alloc]initWithFrame:myRect(0,0, 375, 95)];
    [self.contentView addSubview:self.backgrounView];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:myRect(130, 10, 190, 32)];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.font = [UIFont systemFontOfSize:MyFontSize13];
    self.nameLabel.numberOfLines=0;
    self.nameLabel.text=@"墨西哥宝马X5";
    self.nameLabel.font=[UIFont boldSystemFontOfSize:MyFontSize13];
    self.nameLabel.textColor=HWColor(51, 51, 51);
    [self.backgrounView addSubview:self.nameLabel];
    
    self.colorLabel = [[UILabel alloc]initWithFrame:myRect(130, 45, 40, 10)];
    self.colorLabel.textAlignment = NSTextAlignmentLeft;
    self.colorLabel.font = [UIFont systemFontOfSize:MYFontSize10];
    self.colorLabel.text = @"黑/红/蓝";
    self.colorLabel.textColor=HWColor(102, 102, 102);
    [self.backgrounView addSubview:self.colorLabel];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:myRect(130, 60, 149, 11)];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.titleLabel.textColor=HWColor(102, 102, 102);
    self.titleLabel.text = @"2016 3.0T 四驱 汽油版 5座";
    [self.backgrounView addSubview:self.titleLabel];
        
    self.priceLabel = [[UILabel alloc]initWithFrame:myRect(130, 75,63, 12)];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.priceLabel.font=[UIFont boldSystemFontOfSize:MyFontSize13];
    self.priceLabel.text = @"￥86.5 万";
    self.priceLabel.textColor=HWColor(234, 86, 62);
    [self.backgrounView addSubview:self.priceLabel];
    
  

    self.addressimage = [[UIImageView alloc]init];
    self.addressimage.image =[UIImage imageNamed:@"home_msg_dingwei_n"];
    self.addressLabel=[[UILabel alloc]init];
    //self.addressLabel.textAlignment = NSTextAlignmentRight;
    self.addressLabel.textColor = HWColor(153, 153, 153);
    self.addressLabel.font = [UIFont systemFontOfSize:MYFontSize11];
    self.addressLabel.text = @"北京";
    
    if (self.addressLabel.text.length<4) {
        
        
        self.addressLabel.frame=myRect(338, 12, 25, 11);
        self.addressimage.frame=myRect(320,12,11,14);

    
    }else{
        
        self.addressLabel.frame=myRect(316, 12,45, 11);
        self.addressimage.frame=myRect(301,12,10,12);
        
    }
    [self.backgrounView addSubview:self.addressimage];
    [self.backgrounView addSubview:self.addressLabel];
    
    self.xiancheImage = [[UIImageView alloc]initWithFrame:myRect(306,64,55,23)];
    self.xiancheImage.image=[UIImage imageNamed:@"honme_msg_xianche"];
    [self.backgrounView addSubview:self.xiancheImage];
    
    //头像图
    self.image = [[UIImageView alloc]initWithFrame:myRect(15, 10, 101, 76)];
    self.image.backgroundColor = HWColor(234, 86  ,62);
    self.image.image = [UIImage imageNamed:@"home_img_def"];
    [self.backgrounView addSubview:self.image];
    
}

- (void)setIsCount:(BOOL)isCount
{
    if (isCount) {
       
        self.BtnTuan=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.BtnTuan setTitle:@"团购" forState:UIControlStateNormal];
        self.BtnTuan.frame=myRect(15, 10, 61, 21);
        self.BtnTuan.backgroundColor=HWColor(245,93,34);
        self.BtnTuan.layer.cornerRadius=10;
        self.BtnTuan.titleLabel.font=[UIFont systemFontOfSize:MYFontSize11];
        [self.contentView addSubview:self.BtnTuan];
        
        self.backView=[[UIView alloc]initWithFrame:myRect(80, 17, 8, 8)];
        self.backView.backgroundColor=[UIColor orangeColor];
        self.backView.layer.cornerRadius=4;
        [self.contentView addSubview:self.backView];
        
        self.numberLabel=[[UILabel alloc]initWithFrame:myRect(92, 15, 140, 11)];
        self.numberLabel.text=@"订单号：3242545123545";
        self.numberLabel.font=[UIFont systemFontOfSize:MYFontSize11];
        self.numberLabel.textColor=HWColor(153, 153, 153);
        [self.contentView addSubview:self.numberLabel];
        
        self.stateLabel=[[UILabel alloc]initWithFrame:myRect(305, 15, 60, 12)];
        self.stateLabel.textAlignment=NSTextAlignmentRight;
        self.stateLabel.textColor=HWColor(234, 84, 62);
        self.stateLabel.font=[UIFont systemFontOfSize:MYFontSize11];
        self.stateLabel.text=@"已预约报名";
        [self.contentView addSubview:self.stateLabel];
        
        self.DepositLable=[[UILabel alloc]initWithFrame:myRect(255, 145, 105, 12)];
        self.DepositLable.textAlignment=NSTextAlignmentRight;
        self.DepositLable.font=[UIFont systemFontOfSize:MYFontSize11];
        self.DepositLable.text=@"已支付定金：999元";
        [self.contentView addSubview:self.DepositLable];
        
//        self.nameLabel.frame=myRect(130, 50, 97, 13);
//        self.titleLabel.frame=myRect(130,74, 149, 11);
//        self.priceLabel.frame=myRect(130, 115,63, 12);
//        self.image.frame=myRect(15, 51, 101, 76);
//        self.colorLabel.frame=myRect(130,90, 40, 10);
        
        self.backgrounView.frame= myRect(0,39, 375, 95);
        self.backgrounView.backgroundColor=HWColor(247, 247, 247);
       
       
    }
}
- (void)setIsLine:(BOOL)isLine
{
    if (isLine) {
        UIView *gapView = [[UIView alloc]initWithFrame:CGRectMake(0, 85, ScreenWidth, 5)];
        gapView.backgroundColor = kBgColor;
        gapView.layer.borderWidth = 0.5;
        gapView.layer.borderColor = HWColor(240, 240, 240).CGColor;
        [self.contentView addSubview:gapView];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    for (UIView * view in self.subviews) {
       
        if ([view isKindOfClass:NSClassFromString(@"UITableViewCellEditControl")])
        
        {
            
            UIImageView * image = (UIImageView *)[view.subviews firstObject];
            
            if (self.selected) {
             
                image.image = [UIImage imageNamed:@"chouchang_register_rb_s"];
            
            }else{
            
                image.image = [UIImage imageNamed:@"shouchang__register_rb_n"];
            
            }
        }
     
        NSString *string = [[NSString alloc]init];
        
    }
}
- (void)setCarModel:(carInfoModel *)carModel
{
    _carModel=carModel;
    self.nameLabel.text =carModel.productName;
    self.priceLabel.text =[NSString stringWithFormat:@"%@",_carModel.lowestSalePrice];
    
    [self.image sd_setImageWithURL:[NSURL URLWithString:_carModel.imageUrl]placeholderImage:[UIImage imageNamed:@"home_img_def"]];
   
    
}

@end
