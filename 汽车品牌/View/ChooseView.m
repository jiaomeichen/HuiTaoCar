//
//  ChooseView.m
//  HuiTaoCar
//
//  Created by user on 16/8/19.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ChooseView.h"
#import "TCAddresSelectViewController.h"
#import "MHActionSheet.h"
@class CarBrandViewController;
@interface ChooseView()

@property(nonatomic,strong)UIButton *button;


@end

@implementation ChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setChooseView];
    }
    return self;
}
-(void)setChooseView{

    UIView *xuanzeView=[[UIView alloc]init];//WithFrame:myRect(0, 144, 375, 73)];
    xuanzeView.backgroundColor=[UIColor whiteColor];//HWColor(225, 225, 225);
    
    [self addSubview:xuanzeView];
    
    NSArray *array=@[@"车型asdads",@"来源",@"现车/期车",@"所在城市"];
    NSArray *arrTitle=@[@"全部",@"墨西哥版",@"全部",@"全部"];
    for (int i=0; i<4; i++) {
        UILabel *label=[[UILabel alloc]init];
        label.frame=myRect(21+50*i+37*i, 17, 51, 11);
        label.font=[UIFont systemFontOfSize:MYFontSize11];
        label.textColor=HWColor(153, 153, 153);
        label.text=array[i];
        [xuanzeView addSubview:label];
        
        //按钮
        _button=[UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame=myRect(21+76*i+i*11, 43, 76, 13);
        [_button setTitle:arrTitle[i] forState:UIControlStateNormal];
        [_button setTitleColor:HWColor(102, 102, 102) forState:UIControlStateNormal];
        _button.tag=1000+i;
        //[_button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        _button.titleLabel.font=[UIFont systemFontOfSize:MyFontSize13];
        [_button setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_n"]forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_s"] forState:UIControlStateSelected];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGSize imageSize = _button.imageView.frame.size;
        CGSize titleSize = _button.titleLabel.frame.size;
        _button.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, imageSize.width );
        _button.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width , 0.0, - titleSize.width);
        _button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        [xuanzeView addSubview:_button];
        
        //线---1
        UIView *line=[[UIView alloc]initWithFrame:myRect(21+76*i+i*11, 59, 65, 1)];
        line.backgroundColor=HWColor(153, 153,153);
        [xuanzeView addSubview:line];
        
    }


}

-(void)buttonClick:(UIButton *)button{

    NSArray *carArray=@[@"宝马",@"奔驰",@"丰田",@"大众",@"道奇",@"福特",@"本田",@"玛莎拉蒂",@"路虎",@"野马",@"全部"];
    NSArray *laiArray=@[@"美规",@"欧规",@"墨西哥",@"改版",@"不限"];
    NSArray *carLeiArray=@[@"现车",@"期车"];
    
    if (button.tag==1003) {
        
//        
//        TCAddresSelectViewController *tca=[[TCAddresSelectViewController alloc]init];
//        [tca setHidesBottomBarWhenPushed:YES];
//        [self.navigationController pushViewController:tca animated:YES];
//        
    }else{
        
        if (button.tag==1000) {
            
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:@"来源" style:MHSheetStyleDefault itemTitles:laiArray];
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                _button.titleLabel.text = [NSString stringWithFormat:@"%@",title];
                __weak typeof(self) weakSelf = self;
                
             //   [weakSelf.carTableView reloadData];
                
            }];
            
        }else if (button.tag==1001){
            
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:@"车型" style:MHSheetStyleDefault itemTitles:carArray];
            
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                _button.titleLabel.text = [NSString stringWithFormat:@"%@",title];
                __weak typeof(self) weakSelf = self;
            //    [weakSelf.carTableView reloadData];
                
            }];
            
        }else if (button.tag==1002){
            
            
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:@"现车/期车" style:MHSheetStyleDefault itemTitles:carLeiArray];
            
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                _button.titleLabel.text = [NSString stringWithFormat:@"%@",title];
                __weak typeof(self) weakSelf = self;
            //    [weakSelf.carTableView reloadData];
                
            }];
            
        }
        
    }
    




}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
