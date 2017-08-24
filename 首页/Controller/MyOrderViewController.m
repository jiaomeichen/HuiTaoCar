//
//  MyOrderViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/15.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MZCardCell.h"
#import "OrderInfoViewController.h"
@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *orderTableView;

@end

@implementation MyOrderViewController
#pragma mark -懒加载-
//- (UITableView*)orderTableView
//{
//    if (!_orderTableView) {
//        _orderTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:(UITableViewStylePlain)];
//        _orderTableView.delegate = self;
//        _orderTableView.dataSource = self;
//        _orderTableView.showsVerticalScrollIndicator = NO;
//        
//        if ([_orderTableView respondsToSelector:@selector(setSeparatorInset:)])
//        {
//            [_orderTableView setSeparatorInset:UIEdgeInsetsZero];
//        }
//        if ([_orderTableView respondsToSelector:@selector(setLayoutMargins:)])
//        {
//            [_orderTableView setLayoutMargins:UIEdgeInsetsZero];
//        }
//        
//    }
//    return _orderTableView;
//}
//
//
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor=HWColor(234, 86, 62);

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的订单";
    _orderTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:(UITableViewStylePlain)];
    _orderTableView.delegate = self;
    _orderTableView.dataSource = self;
    _orderTableView.showsVerticalScrollIndicator = NO;
    if ([_orderTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_orderTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_orderTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_orderTableView setLayoutMargins:UIEdgeInsetsZero];
    }

    [self.view addSubview:_orderTableView];
}
#pragma mark--UITableViewDelegate代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
    if (cell==nil) {
        cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
        
    }
    cell.addressimage.hidden=YES;
    cell.addressLabel.hidden=YES;
    cell.xiancheImage.hidden=YES;
    [cell setIsCount:YES];
   
    if (indexPath.row%2==0) {
        [cell.BtnTuan setTitle:@"装具" forState:UIControlStateNormal];
        cell.BtnTuan.backgroundColor=HWColor(38,151,175);
        cell.backView.backgroundColor=HWColor(38,151,175);
    }
       return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 167;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    OrderInfoViewController *orederInfo=[[OrderInfoViewController alloc]init];
    [self.navigationController pushViewController:orederInfo animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

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
