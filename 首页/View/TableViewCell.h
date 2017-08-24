//
//  TableViewCell.h
//  HuiTaoCar
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *infoLabel;
@property(nonatomic,strong)UILabel *addressLb;
@property(nonatomic,strong)UIImageView *rightImage;


@property (nonatomic,assign)BOOL istextField;
@property (nonatomic,assign)BOOL isImageView;
@property (nonatomic,assign)BOOL isLabel;
@end
