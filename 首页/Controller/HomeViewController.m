//
//  HomeViewController.m
//  HuiTaoCar
//  首页
//  Created by user on 16/7/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchViewController.h"
#import "SDCycleScrollView.h"
#import "MZCardCell.h"
#import "YJButton.h"
#import "MJRefresh.h"
#import "TeJiaViewController.h"
#import "QuanQiuViewController.h"
#import "ZhuanJiaViewController.h"
#import "FuWuViewController.h"
#import "NeiDiViewController.h"
#import "LookCarViewController.h"
#import "TuanGouViewController.h"
#import "PeiJianViewController.h"
#import "CarBrandViewController.h"
#import "MyOrderViewController.h"
#import "MessageViewController.h"
#import "LoginViewController.h"
#import "CarInfoViewController.h"
//

#import "carInfoModel.h"
static const CGFloat MJDuration = 2.0;
@interface HomeViewController ()<UISearchBarDelegate,SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *headerView;//头部底层View
@property(nonatomic,strong)NSMutableArray *dataArray;//数据源
@property (strong, nonatomic) AFHTTPSessionManager *manager;//
@end

@implementation HomeViewController

/**懒加载*/
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
-(UITableView *)tableView{
    if (!_tableView) {
        self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
    }
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    return _tableView;
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    //导航栏
    self.navigationController.navigationBar.barTintColor=HWColor(225, 63, 48);
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_logo"]style:UIBarButtonItemStylePlain target:self action:@selector(leftButton:)];
   
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"common_nav_btn_message_pre"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButton:)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    //搜索框
    UISearchBar *searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(30, 7, 5, 26)];
    searchBar.delegate=self;
    searchBar.placeholder=@"输入车型、品牌";
    for (UIView *subview in searchBar.subviews) {
        for(UIView* grandSonView in subview.subviews){
            if ([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                //  grandSonView.layer.cornerRadius = 30;
                grandSonView.alpha = 0.0f;
            }else if([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarTextField")] ){
                grandSonView.layer.cornerRadius = 0;
                grandSonView.backgroundColor = HWColor(238, 238, 238);
            }else{
                grandSonView.alpha = 0.0f;
            }
        }
    }
    self.navigationItem.titleView=searchBar;

    //添加控件
    [self createUI];
    
    //数据请求
    [self download];
    
    //下来刷新
    [self setHeaderRefresh];
    
    //上拉加载
    [self setupRefresh];
}

-(void)createUI{
    
    //标题头view
    _headerView=[[UIView alloc]init];
    _headerView.frame=myRect(0, 0, 375, 378);
    _headerView.backgroundColor=[UIColor whiteColor];
    self.tableView.tableHeaderView=_headerView;
    //轮播图
    [self lunboView];
}

#pragma mark  UITableView +下拉刷新
-(void)setHeaderRefresh{
    
    //防止死循环
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
      
        //要处理的事件
        [weakSelf loadNewData];
   
    }];
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];

}
//下拉刷新处理事件
-(void)loadNewData{

    //buttonView  按钮底层
    UIView *buttonView=[[UIView alloc]initWithFrame:myRect(0, 188, 375, 210)];
    buttonView.backgroundColor=[UIColor whiteColor];
    [_headerView addSubview:buttonView];
    
    // 一排按钮
    NSArray *images = @[@"home_icon_tejia_n", @"home_icon_quanqiugou_n", @"home_icon_zixun_n", @"home_icon_mendian_n", @"home_icon_nowcar_n"];
    NSArray *butName=@[@"今日特价",@"全球购车",@"专家咨询",@"服务体系",@"内地现车"];
    for (int i = 0; i<5; i++) {
        YJButton *button = [[YJButton alloc] init];
        button.frame=myRect(25+(375-150)/5*i+25*i,10, (375-150)/5, 70);
        if (ScreenWidth==320) {
            button.frame=myRect(18+(375-150)/5*i+17*i,10, (375-120)/5, 70);
        }else if(ScreenWidth == 414){
        button.frame=myRect(30+(375-180)/5*i+35*i,10, (375-150)/5, 70);
        }
        button.tag = i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonView addSubview:button];
        //设置内容
        button.titleLabel.font=[UIFont systemFontOfSize:MYFontSize11];
        [button setTitle:butName[i] forState:UIControlStateNormal];
        [button setTitleColor:HWColor(40, 40, 40) forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
    }
    
    //分割线--1
    UIView *line=[[UIView alloc]initWithFrame:myRect(0, 82, 375, 0.7)];
    line.backgroundColor=HWColor(215, 215, 215);
    [buttonView addSubview:line];
    //团购
    UIButton *tuanBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    tuanBtn.frame=myRect(15, 95, 162, 70);
    tuanBtn.backgroundColor=[UIColor whiteColor];
    [tuanBtn setImage:[UIImage imageNamed:@"home_icon_tuangou_n"] forState:UIControlStateNormal];
    [tuanBtn addTarget:self action:@selector(tuangouClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:tuanBtn];
    
    //汽车配件
    UIButton *qipeiBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    qipeiBtn.frame=myRect(198, 95, 162, 70);
    qipeiBtn.backgroundColor=[UIColor whiteColor];
    [qipeiBtn setImage:[UIImage imageNamed:@"home_icon_qichepeijian_n"]forState:UIControlStateNormal];
    [qipeiBtn addTarget:self action:@selector(qipeiClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:qipeiBtn];
    
    //竖分割线
    UIView *line2=[[UIView alloc]initWithFrame:myRect(375/2,82,0.6,96)];
    line2.backgroundColor=HWColor(215, 215, 215);;
    [buttonView addSubview:line2];
    
    //灰色部分分割线
    UIView *line3=[[UIView alloc]initWithFrame:myRect(0,178,375, 12)];
    line3.backgroundColor=HWColor(240, 240, 240);;
    [buttonView addSubview:line3];
    
    //拿到当前的下拉刷新控件，结束刷新状态
    [self.tableView.mj_header endRefreshing];

}

#pragma mark  UITableView +下拉刷新
-(void)setupRefresh{
    __unsafe_unretained __typeof(self) weakSelf = self;
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
}
#pragma mark 上拉加载更多数据
- (void)loadMoreData
{
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
        // 拿到当前的上拉刷新控件，变为没有更多数据的状态
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    });
}

/**一排按钮的点击事件*/
-(void)btnClick:(UIButton *)btn{
    YYLog(@"一排按钮%ld",(long)btn.tag);
    if (btn.tag==0) {
        TeJiaViewController *tejia=[[TeJiaViewController alloc]init];
        [tejia setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:tejia animated:YES];
    }else if (btn.tag==1){
        QuanQiuViewController *quanqiu=[[QuanQiuViewController alloc]init];
        [quanqiu setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:quanqiu animated:YES];
    }else if (btn.tag==2){
        ZhuanJiaViewController *zhuanjia=[[ZhuanJiaViewController alloc]init];
        [zhuanjia setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:zhuanjia animated:YES];
    }else if (btn.tag==3){
        FuWuViewController *fuwu=[[FuWuViewController alloc]init];
        [fuwu setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:fuwu animated:YES];
    }else if (btn.tag==4){
        
//        CarBrandViewController *carbran=[[CarBrandViewController alloc]init];
//        [carbran setHidesBottomBarWhenPushed:YES];
//        [self.navigationController pushViewController:carbran animated:YES];
//
        MyOrderViewController *myOrder=[[MyOrderViewController alloc]init];
        [myOrder setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:myOrder animated:YES];
    
    }

}

-(void)tuangouClick{
    YYLog(@"团购了没");
    TuanGouViewController *tuangou=[[TuanGouViewController alloc]init];
    [tuangou setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:tuangou animated:YES];
}
-(void)qipeiClick{
    YYLog(@"汽配件");
    PeiJianViewController *peijian=[[PeiJianViewController alloc]init];
    [peijian setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:peijian animated:YES];
}
-(void)moveClick{
    YYLog(@"更多的");
    [SVProgressHUD showSuccessWithStatus:@"更多车型😀"];
}
-(void)lunboView{
    
    //轮播图
    NSArray *arr=@[@"home_banner",@"home_banner",@"home_banner"];
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:myRect(0, 0,375, 188)delegate:self placeholderImage:[UIImage imageNamed:@"home_banner"]];
    cycleScrollView2.infiniteLoop = YES;
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.currentPageDotColor = [UIColor redColor]; // 自定义分页控件小圆标颜色
    [_headerView addSubview:cycleScrollView2];
    //--- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [cycleScrollView2 setImageURLStringsGroup:arr];
    });
}
-(void)download{
    //网络请求
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self.manager GET:URL_Info parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *redic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *dictArray=redic[@"content"];
        _dataArray=[[NSMutableArray alloc]init];
        for (NSMutableDictionary *dict in dictArray) {
            carInfoModel * model=[[carInfoModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataArray addObject:model];
        }
        YYLog(@"%@",_dataArray);
        [_tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        YYLog(@"%@",error);
    }];
}

#pragma mark--<UITableViewDelegate>代理
//设置标题头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    header.backgroundColor=HWColor(250, 250, 250);
    //位置大小无效：默认标题头的大小
    UILabel *label = [[UILabel alloc] initWithFrame:myRect(15, 0, 70, 30)];
    label.text = @"热门车型";
    label.textColor=HWColor(234, 86, 62);
    label.font = [UIFont systemFontOfSize:MyNavTitleSize];
    label.backgroundColor = HWColor(250, 250, 250);
    [header addSubview:label];
    //
    //更多按钮
    UIButton *moveBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    moveBtn.frame=myRect(375-90, 0, 90, 30);
    [moveBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moveBtn setImage:[UIImage imageNamed:@"common_icon_arrow_n"] forState:UIControlStateNormal];
    [moveBtn setImage:[UIImage imageNamed:@"common_icon_arrow_n"] forState:UIControlStateHighlighted];
    
    //文字左图片右的设置
    [moveBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -19, 0, 5)];
    [moveBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 60, 0, 10)];
    moveBtn.titleLabel.font=[UIFont systemFontOfSize:MyFontSize13];
    [moveBtn setTitleColor:HWColor(102,102,102) forState:UIControlStateNormal];
    [moveBtn addTarget:self action:@selector(moveClick) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:moveBtn];
    //
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 30, ScreenWidth,0.5)];
    line.backgroundColor=HWColor(220, 220, 220);
    [header addSubview:line];
    //返回view
    return header;
}
//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio{
    YYLog(@"0000000000000000________%lu",(unsigned long)_dataArray.count);
   // return _dataArray.count;
    return 6;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
    if (cell==nil) {
        cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
    }
   // cell.carModel=_dataArray[indexPath.row];
    cell.backgroundView.backgroundColor=[UIColor clearColor];
    [cell setIsCount:NO];
    return cell;
}
//设置cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0.143*ScreenHeight;
}
//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CarInfoViewController*xiangqing=[[CarInfoViewController alloc]init];
    [xiangqing setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:xiangqing animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark-<UISearchBarDelegate代理>
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    SearchViewController *search=[[SearchViewController alloc]init];
    [search setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:search animated:YES];
    return NO;
}

-(void)leftButton:(UIBarButtonItem *)button{
    YYLog(@"logo");
}

-(void)rightButton:(UIBarButtonItem *)button{

    if (!Login) {
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
        return;
    }else{

        MessageViewController *message=[[MessageViewController alloc]init];
        [message setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:message animated:YES];
        YYLog(@"消息");
    }
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
