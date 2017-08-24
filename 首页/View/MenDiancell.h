//
//  MenDiancell.h
//  HuiTaoCar
//
//  Created by user on 16/7/27.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenDiancell : UITableViewCell
@property (nonatomic,strong)UIImageView *dianmianImage;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *pinpaiLabel;
@property (nonatomic,strong)UILabel *carLabel;
@property (nonatomic,strong)UILabel *scoreLabel;
@property (nonatomic,strong)UIImageView *xiancheImage;
@property (nonatomic,strong)UILabel *colorLabel;
@property (nonatomic,strong)UIImageView *shuline;
@property (nonatomic,assign)BOOL isShare;
@property (nonatomic,strong)UIButton *seeBtn;
@property (nonatomic,strong)UIButton *downloadBtn;
@property (nonatomic,strong)UIImageView *addressimage;
@property (nonatomic,strong)UILabel *addressLabel;


@end
