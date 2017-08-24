//
//  MySelfViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "MySelfViewController.h"
#import "LEOHeaderView.h"
#import "LoginViewController.h"
#import "MyOrderViewController.h"
#import "ChangePWDViewController.h"
#import "ChangePhoneViewController.h"
#import "MessageViewController.h"

@interface MySelfViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LEOHeaderView *headerView;

@end

@implementation MySelfViewController

//懒加载

- (LEOHeaderView *)headerView {
   
    if (!_headerView) {
        _headerView = [[LEOHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
        [_headerView setBackgroundImage:[UIImage imageNamed:@"图层-1"]];
        [_headerView setHeaderImage:[UIImage imageNamed:@"my_def_Default-Avatar-n"] text:@"开利星空电子商务"];
        _headerView.exclusiveTouch=YES;
        _headerView.userInteractionEnabled=YES;
      
        
    }
    return _headerView;
}

- (UITableView *)tableView {
   
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, ScreenWidth, ScreenHeight - kNavigationBarHeight-49) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.contentInset = UIEdgeInsetsMake(180 - kNavigationBarHeight, 0, 0, 0);
        _tableView.backgroundColor = [UIColor clearColor];
        //去掉多余CELL
        _tableView.tableFooterView=[[UIView alloc]init];
      
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)])
        {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])
        {
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar ps_setBackgroundColor:[UIColor clearColor]setBackgroundImage:YES];
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
//
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar ps_reset];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"common_nav_btn_message_pre"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
   
    [self.view addSubview:self.tableView];
    [self.view insertSubview:self.headerView belowSubview:self.tableView];
    
    _myArr=@[@[@"我的订单",@"我的收藏"],@[@"修改密码",@"修改手机号",@"清除缓存",@"联系我们：400-000-288",@"关于我们"],@[@"退出登录"]];
           
    [self setIsLogin:YES];
    
}
//
-(void)setIsLogin:(BOOL)isLogin{

    if (!Login) {
        //没有登录跳转登录界面
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
        
        return;
    
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   
    [self.headerView reloadWithScrollView:scrollView];
}

-(void)rightClick{

    YYLog(@"消息");
    if (!Login) {
        //没有登录跳转登录界面
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
        
        return;
        
    }else{
        
        //登录跳转消息界面
        MessageViewController *message=[[MessageViewController alloc]init];
        [message setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:message animated:YES];
        
    }
}

#pragma mark - tableView protocol methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else if(section==1){
        
        return 5;
    }else{
        
        return 1;
    }
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}

//标题尾
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==2) {
        return 0;
    }else{
    return 12;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;

//    if (section==0) {
//        
//    UILabel *footLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 5, ScreenWidth, 25)];
//    footLabel.backgroundColor=HWColor(225, 225, 225);
//    footLabel.text=@"账号管理";
//    footLabel.font=[UIFont systemFontOfSize:MYFontSize11];
//    
//    return footLabel;
//    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if (ScreenHeight==568) {
        return 41;
    }else{
    return 44;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"string"];
   
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"string"];
        cell.textLabel.text=_myArr[indexPath.section][indexPath.row];
        
    }
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section==0&&indexPath.row==0) {
        cell.imageView.image=[UIImage imageNamed:@"me_icon_wodedingdan_n"];
    }else if (indexPath.section==0&&indexPath.row==1){
        
        cell.imageView.image=[UIImage imageNamed:@"me_icon_My-collection_n"];
    }else if (indexPath.section==2) {
        cell.textLabel.textColor=HWColor(242, 86, 62);
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0&&indexPath.row==0) {
    //我的订单
    MyOrderViewController *myorder=[[MyOrderViewController alloc]init];
    [myorder setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:myorder animated:YES];
    
    }else if (indexPath.section==1&&indexPath.row==0){
    
        ChangePWDViewController *changePWD=[[ChangePWDViewController alloc]init];
        [changePWD setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:changePWD animated:YES];
    
    }else if (indexPath.section==1&&indexPath.row==1){
    
        ChangePhoneViewController *changePhone=[[ChangePhoneViewController alloc]init];
        [changePhone setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:changePhone animated:YES];
    
    }
    else if (indexPath.section==1&&indexPath.row==3){
    
        //调用系统电话
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"400-000-288"];
        UIWebView * callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
//        [callWebview release];
//        [str release];
        
    }else if (indexPath.section==2){
    
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"Login"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
    
    }
    //消除选中后的效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
