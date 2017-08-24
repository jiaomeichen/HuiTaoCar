//
//  CarInfoViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/23.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "CarInfoViewController.h"
#import "MZCardCell.h"
#import "SDCycleScrollView.h"
#import "HMSegmentedControl.h"
#import "LookCarViewController.h"
#import "OrderViewController.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>
//友盟
@interface CarInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,SDCycleScrollViewDelegate,UIWebViewDelegate>
{
    UIButton *footBtn;//底部两个button
    UILabel *textLb;//顶部汽车详情
    UIButton *keepBtn;//收藏
    UIButton *shareBtn;//分享
    UIView *infoView;//汽车详情web底层view
    UIView *peizhiView;//配置
    UIView *view3;//第三个
    UIImageView *_imageView;
    NSString *_isFollow;
    CGFloat oldFloat;
    CGFloat _lastPosition;

}
@property (nonatomic,strong)HMSegmentedControl *messageSeg;
@property (nonatomic,strong)UITableView *carInfoTableview;
@property (nonatomic,strong)UIView *carHeaderView;
@property (nonatomic,strong)UIView *carFootView;
@property (nonatomic,strong)UIView *buttonFootView;
@property (nonatomic, strong) UIView *navView;
@property (nonatomic,assign) CGFloat contentX;//艺术家偏移
@property (nonatomic,strong)UIScrollView *scrollView;//
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong) NSString *shareUrl;

@end

@implementation CarInfoViewController

-(UITableView *)carInfoTableview{
    if (!_carInfoTableview) {
        _carInfoTableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _carInfoTableview.delegate=self;
        _carInfoTableview.dataSource=self;
        _carInfoTableview.tag = 3550;
        
        if ([_carInfoTableview respondsToSelector:@selector(setSeparatorInset:)])
        {
            [_carInfoTableview setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_carInfoTableview respondsToSelector:@selector(setLayoutMargins:)])
        {
            [_carInfoTableview setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return _carInfoTableview;
}
-(UIView *)carHeaderView{

    if (!_carHeaderView) {
        _carHeaderView=[[UIView alloc]initWithFrame:myRect(0, 0, 375,250)];
        
    }
    return _carHeaderView;
}
-(UIView *)carFootView{
    if (!_carFootView) {
        _carFootView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        
    }
    return _carFootView;
}
-(UIView *)buttonFootView{

    if (!_buttonFootView) {
        _buttonFootView=[[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
        _buttonFootView.backgroundColor=HWColor(235, 235, 235);
    }
    return _buttonFootView;
}
- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:infoView.bounds];
       // _webView.dataDetectorTypes = UIDataDetectorTypeAll;
    }
    return _webView;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setHidden:YES];
    [self scrollViewDidScroll:self.carInfoTableview];
    
    self.carInfoTableview.contentOffset = CGPointMake(0, oldFloat);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"透明背景"]];
    
    [self.view addSubview:self.carInfoTableview];
    [self.view addSubview:self.buttonFootView];
    self.carInfoTableview.contentOffset = CGPointMake(0, 0);
    self.carInfoTableview.tableHeaderView=self.carHeaderView;
    self.carInfoTableview.tableFooterView=self.carFootView;
    //导航栏
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DP_SCREEN_WIDTH, 64)];
    _navView.backgroundColor =[[UIColor redColor] colorWithAlphaComponent:0];
    [self.view addSubview:_navView];
    //标题
    textLb=[[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth-70)/2, 25, 70, 35)];
    textLb.text=@"汽车详情";
    textLb.hidden=YES;
    [_navView addSubview:textLb];
    
    //收藏
     keepBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [keepBtn setFrame:myRect(284, 25, 30, 30)];
    [keepBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_Collection_n"] forState:UIControlStateNormal];
    [keepBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_Collection_pre"] forState:UIControlStateSelected];
    keepBtn.selected=YES;
    [keepBtn addTarget:self action:@selector(intoMessageCenter:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:keepBtn];
    
    //分享
     shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setFrame:myRect(329, 25, 30, 30)];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_share_n"] forState:UIControlStateNormal];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_share_pre"] forState:UIControlStateSelected];
    shareBtn.selected=YES;
    [shareBtn addTarget:self action:@selector(shareButton:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:shareBtn];
    
    //返回
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:myRect(15, 25, 30, 30)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_back_n"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_back_pre"] forState:UIControlStateHighlighted];
    //backBtn.selected=YES;
    [backBtn addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:backBtn];
   
    ////轮播图
    [self setSDCycleScrollView];
    //网页
    [self creatWebView];
    //底部按钮
    [self creatFootBtn];
}

//轮播图
-(void)setSDCycleScrollView{
    
    //轮播图
    SDCycleScrollView *cycleScrollView = [[SDCycleScrollView  alloc]init];
    [self setSDCycleScrollView:cycleScrollView addView:_carHeaderView from:_carHeaderView.bounds];

}

//底部按钮
-(void)creatFootBtn{

    NSArray *nameArray=@[@"预约看车",@"预约下单"];
    
    for (int i=0; i<2; i++) {
    
        footBtn=[UIButton buttonWithType:UIButtonTypeCustom];
       
        if (ScreenWidth==320) {
           
             footBtn.frame=CGRectMake(10+160*i, 5, 140, 38);
      
        }else if (ScreenWidth==414){
        
             footBtn.frame=CGRectMake(15+200*i, 5, 183, 38);
        
        }
        else{
            
            footBtn.frame=CGRectMake(10+187*i, 5, 169, 38);
        }
        
        footBtn.tag=3000+i;
        [footBtn setTitle:nameArray[i] forState:UIControlStateNormal];
        footBtn.layer.cornerRadius=10;
        [footBtn addTarget:self action:@selector(footBunClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonFootView addSubview:footBtn];
        
        if (footBtn.tag==3000) {
      
            footBtn.backgroundColor=HWColor(234, 186, 62);
   
        }else if(footBtn.tag==3001){
    
            footBtn.backgroundColor=HWColor(234, 86, 62);
   
        }
    }
}

-(void)creatWebView{
    
    self.messageSeg = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 50)];
    self.messageSeg.sectionTitles = @[@"汽车信息",@"配置",@"汽车信息"];
    self.messageSeg.selectedSegmentIndex = 0;
    self.messageSeg.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:15]};
    self.messageSeg.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    self.messageSeg.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.messageSeg.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    //self.messageSeg.selectionIndicatorHeight = 4;
    self.messageSeg.selectionIndicatorColor = HWColor(202, 64, 79);
    //
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/3, 8,1, 35)];
    line1.backgroundColor = HWColor(220, 220, 220);
    [self.messageSeg addSubview:line1];
    //
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/3*2, 8, 1, 35)];
    line2.backgroundColor = HWColor(220, 220, 220);
    [self.messageSeg addSubview:line2];
    //
    UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(0, 49, ScreenWidth, 1)];
    line3.backgroundColor = HWColor(220, 220, 220);
    [self.messageSeg addSubview:line3];
    //
    [self.carFootView addSubview:self.messageSeg];
    __weak typeof(self) weakSelf = self;
    
    [self.messageSeg setIndexChangeBlock:^(NSInteger index) {
        
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(ScreenWidth * index, 0, ScreenWidth, 200) animated:YES];
        
    }];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, ScreenWidth, ScreenHeight-49)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = HWColor(0, 0, 249);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(ScreenWidth*3,ScreenHeight-49);
    self.scrollView.delegate = self;
    //[self.scrollView scrollRectToVisible:CGRectMake(ScreenWidth*3, 0, ScreenWidth, ScreenHeight-49) animated:NO];
    [self.carFootView addSubview:self.scrollView];
    //
    infoView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49)];
    infoView.backgroundColor=[UIColor whiteColor];
    /***************************************************************/
    NSURL *url = [NSURL URLWithString:@"http://www.tabao.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //网页加载请求
    [_webView loadRequest:request];
    _webView.delegate = self;
    [infoView addSubview:self.webView];
    YYLog(@"来到了这里");
    [self.scrollView addSubview:infoView];
    /**************************************************************/
    
    //
    peizhiView=[[UIView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight-49)];
    peizhiView.backgroundColor=[UIColor blackColor];
    NSURL *url2 = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
    //网页加载请求
    [_webView loadRequest:request2];
    _webView.delegate = self;
    [peizhiView addSubview:self.webView];
    
    [self.scrollView addSubview:peizhiView];
    //
    view3=[[UIView alloc]initWithFrame:CGRectMake(ScreenWidth*2,0, ScreenWidth, ScreenHeight)];
    view3.backgroundColor=[UIColor orangeColor];
    
    NSURL *url3 = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request3 = [NSURLRequest requestWithURL:url3];
    //网页加载请求
    [_webView loadRequest:request3];
    _webView.delegate = self;
    [view3 addSubview:self.webView];
    
    [self.scrollView addSubview:view3];
    

}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        [self.messageSeg setSelectedSegmentIndex:page animated:YES];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    if (scrollView.contentOffset.y > 70) {
       
        [UIView animateWithDuration:0.4 animations:^{
            
            _navView.backgroundColor = [HWColor(220,220, 220) colorWithAlphaComponent:1];
            
            textLb.hidden=NO;
       
        } completion:^(BOOL finished) {
            
        }];
   
    }else if (scrollView.contentOffset.y > 50){
    
    _navView.backgroundColor = [HWColor(220,220, 220) colorWithAlphaComponent:0.5];
        textLb.hidden=NO;
    
    }
    
    
    else{
        [UIView animateWithDuration:0.4 animations:^{
           
            _navView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
           
            textLb.hidden=YES;
       
        } completion:^(BOOL finished) {
            
            
        }];
    }
    
    if (scrollView.tag==1750) {
        _contentX = scrollView.contentOffset.x;
    }
    if (scrollView.tag==3550) {
        oldFloat = scrollView.contentOffset.y;
        
    }
 
    
}


#pragma mark---
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 12;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"car"];
    if (cell==nil) {
        cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"car"];
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return  0.143*ScreenHeight;
}

#pragma mark - UIWebViewDelegate
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //请求失败
    NSLog(@"%@",error);
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"结束请求");
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"开始请求");
    
}

//返回按钮
-(void)backButton:(UIButton *)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    YYLog(@"返回。。");
    
}
//分享按钮
-(void)shareButton:(UIButton *)shareBtn{
    
    YYLog(@"分享给你们。。");
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
    }];
}

-(void)intoMessageCenter:(UIButton *)messageBtn{

    YYLog(@"点击了我呀！！收藏了昂。。。哈哈");


}
-(void)footBunClick:(UIButton *)footbutton{

    if (footbutton.tag==3000) {
       
        LookCarViewController *look=[[LookCarViewController alloc]init];
        [look setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:look animated:YES];
    }else if (footbutton.tag==3001){
    
        YYLog(@"下单");
        OrderViewController *order=[[OrderViewController alloc]init];
        [order setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:order animated:YES];
    }
}
//
-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
[self.navigationController.navigationBar setHidden:NO];
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
