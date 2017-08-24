//
//  TableViewCell.m
//  HuiTaoCar
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setCell];
    }
    return self;
}

-(void)setCell{

    _titleLable=[[UILabel alloc]initWithFrame:CGRectMake(11, 10, 50, 30)];
    _titleLable.textColor=[UIColor blackColor];
    _titleLable.font=[UIFont systemFontOfSize:MyFontSize14];
     [self.contentView addSubview:_titleLable];
    
}

-(void)setIsLabel:(BOOL)isLabel{

    if (isLabel) {
        
        _infoLabel=[[UILabel alloc]initWithFrame:myRect(110, 10, 70, 30)];
        _infoLabel.textColor=[UIColor blackColor];
        _infoLabel.text=@"黑色";
        [self.contentView addSubview:_infoLabel];
        
    }
    
}

-(void)setIsImageView:(BOOL)isImageView{
    
    if (isImageView) {
       
        _rightImage=[[UIImageView alloc]initWithFrame:myRect(346, 14, 19, 19)];
        _rightImage.image=[UIImage imageNamed:@"common_icon_arrow1_n"];
        [self.contentView addSubview:_rightImage];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
