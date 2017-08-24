//
//  BaseViewController.m
//  HuiTaoCar
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"
//#import "LoginViewController.h"
@interface BaseViewController ()<SDCycleScrollViewDelegate>

@end

@implementation BaseViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    //设置导航栏
   // [self createDaohang];
    self.navigationController.navigationBar.barTintColor=HWColor(228, 67, 47);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //隐藏自带的返回按钮
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"My-order_nav_icon_back_n"]style:UIBarButtonItemStylePlain target:self action:@selector(backBtn:)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    
}
//返回
-(void)backBtn:(UIBarButtonItem *)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
//轮播图

-(void)setSDCycleScrollView:(SDCycleScrollView *)ScrollView addView:(UIView *)view from:(CGRect)from

{
    
    NSArray *arr=@[@"Order-details_barnner_def",@"Order-details_barnner_def",@"Order-details_barnner_def"];
    ScrollView = [SDCycleScrollView cycleScrollViewWithFrame:myRect(0, 0,375,25)delegate:self placeholderImage:[UIImage imageNamed:@"home_banner"]];
    
    ScrollView.infiniteLoop = YES;
    ScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    ScrollView.currentPageDotColor = [UIColor redColor]; // 自定义分页控件小圆标
    [ScrollView setImageURLStringsGroup:arr];
    ScrollView.contentMode = UIViewContentModeScaleAspectFill;
    ScrollView.clipsToBounds = YES;
    
    //ScrollView.frame = view.bounds;
    ScrollView.frame = from;
    [view addSubview:ScrollView];
    
}

//uilabel   属性的设置
-(void)creatLabel:(UILabel *)label setupColor:(UIColor *)color setupUIFont:(CGFloat)font setupText:(NSString *)text{
    
    UILabel *label1=[[UILabel alloc]init];
    label1=label;
    label1.textColor=color;
    label1.font=[UIFont systemFontOfSize:font];
    label1.text=text;
    // return label1;
}

//去掉左边少15像素的问题
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
//提示框
-(void)showHUD:(NSString *)title view:(UIView *)view time:(NSInteger)time{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = title;
    hud.label.textColor=HWColor(234, 86, 62);
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:time];
}

//判断手机号-----正则表达式
- (BOOL)validateNumber:(NSString *) textString
{
    NSString* number=@"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:textString];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
