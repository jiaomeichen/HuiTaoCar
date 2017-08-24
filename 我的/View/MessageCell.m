//
//  MessageCell.m
//  HuiTaoCar
//
//  Created by user on 16/8/23.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
    }return self;
}

- (void)addSubviews
{
    //时间UILabel
    _dateLabel = [[UILabel alloc]initWithFrame:myRect((ScreenWidth-150)/2,15 , 150, 23)];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    _dateLabel.font = [UIFont systemFontOfSize:MYFontSize12];
    _dateLabel.backgroundColor=HWColor(126, 127, 126);
    _dateLabel.layer.masksToBounds=YES;
    _dateLabel.layer.cornerRadius=10;
    _dateLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_dateLabel];
   
    //
    UIView *messageView = [[UIView alloc]initWithFrame:myRect(15, 52, 345, 126)];
    messageView.layer.cornerRadius = 4;
    messageView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:messageView];
    
    //
    _artImg = [[UIImageView alloc]initWithFrame:myRect(11, 16, 88, 66)];
    _artImg.image=[UIImage imageNamed:@"home_img_def"];
    _artImg.clipsToBounds = YES;
    [messageView addSubview:self.artImg];
   
    //
    _nameLabel=[[UILabel alloc]initWithFrame:myRect(110, 15, 136, 15)];
    _nameLabel.text=@"墨西哥版宝马X7特价";
    _nameLabel.font=[UIFont boldSystemFontOfSize:MyFontSize14];
    _nameLabel.textColor=HWColor(51, 51, 51);
    [messageView addSubview:_nameLabel];
    //
    self.infoLabel = [[UILabel alloc]initWithFrame:myRect(110,38,227, 47)];
    self.infoLabel.font = [UIFont systemFontOfSize:12.0f];
    self.infoLabel.textColor = [UIColor grayColor];
    self.infoLabel.text=@"按时间段是解放军报都结冰的时间表及所得税卡罗积分看发烧不骄傲是打算考啊发发沙发上大多数都三十多分";
    self.infoLabel.textAlignment = NSTextAlignmentLeft;
    self.infoLabel.numberOfLines = 0;
    [messageView addSubview:self.infoLabel];
    
    //
    UIView *lineView = [[UIView alloc]initWithFrame:myRect(11,92, 325, 1)];
    lineView.backgroundColor = HWColor(240, 240, 240);
    [messageView addSubview:lineView];
    
    //
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:myRect(250,104, 55, 11)];
    detailLabel.textAlignment = NSTextAlignmentLeft;
    detailLabel.textColor = [UIColor grayColor];
    detailLabel.font = [UIFont systemFontOfSize:MyFontSize13];
    detailLabel.text = @"查看详情";
    [messageView addSubview:detailLabel];
    
    //右箭头
    UIImageView *arrowImg = [[UIImageView alloc]initWithFrame:myRect(316,100,19,19)];
    arrowImg.image = [UIImage imageNamed:@"common_icon_arrow1_n"];
    [messageView addSubview:arrowImg];
    
    //
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1000];
    self.dateLabel.text = [formatter stringFromDate:date];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
