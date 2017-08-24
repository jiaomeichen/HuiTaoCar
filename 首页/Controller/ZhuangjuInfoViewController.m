//
//  ZhuangjuInfoViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/11.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ZhuangjuInfoViewController.h"
#import "SDCycleScrollView.h"
#import "InfoCell.h"
//#import "ChooseColorViewController.h"
#import "FillViewController.h"
#import "ChooseColorView.h"


//#import "UMSocial.h"


@interface ZhuangjuInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate,SDCycleScrollViewDelegate,UIAlertViewDelegate>

{
    CGFloat _lastPosition;
    CGFloat oldFloat;
    
    UIView *navView;//自定义导航栏
    UIButton *keepBtn;//收藏
    UIButton *shareBtn;//分享
    UIButton *footBtn;//底部两个按钮
    UILabel *textLb;//顶部汽车详情


}

@property (nonatomic,strong)UITableView *infoTableView;//
@property (nonatomic,strong)NSMutableArray *infoArray;//数据源
@property (nonatomic,strong)UIView *infoHeader;//表头
@property (nonatomic,strong)SDCycleScrollView *sdyScrollView;//轮播图
@property (nonatomic,assign)CGFloat contentX;//艺术家偏移
@property (nonatomic,strong)UIView *buttonViewFoot;//底部两个按钮的View
@property (nonatomic, strong)UIAlertController *alertController;
@end

@implementation ZhuangjuInfoViewController

- (void)dealloc
{
    _infoHeader = nil;
    _infoTableView = nil;
    _buttonViewFoot = nil;
   
}
#pragma mark -懒加载-

- (UITableView*)infoTableView
{
    if (!_infoTableView) {
        _infoTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49) style:(UITableViewStylePlain)];
        _infoTableView.delegate = self;
        _infoTableView.dataSource = self;
        _infoTableView.showsVerticalScrollIndicator = NO;
        
        
        if ([_infoTableView respondsToSelector:@selector(setSeparatorInset:)])
        {
            [_infoTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_infoTableView respondsToSelector:@selector(setLayoutMargins:)])
        {
            [_infoTableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
    }
    return _infoTableView;
}

//表头
- (UIView*)infoHeader
{
    if (!_infoHeader) {
        
        _infoHeader = [UIView new];
        _infoHeader.userInteractionEnabled = YES;
        _infoHeader.frame = CGRectMake(0, 0, ScreenWidth,300);
    }
    return _infoHeader;
}

-(UIView *)buttonViewFoot{

    if (!_buttonViewFoot) {
        
        _buttonViewFoot=[[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
        _buttonViewFoot.backgroundColor=HWColor(225, 225, 225);
    }
    return _buttonViewFoot;
}

#pragma mark --
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //
    [self scrollViewDidScroll:self.infoTableView];
    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"透明背景"]];
    //导航
    navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DP_SCREEN_WIDTH, 64)];
    navView.backgroundColor =[[UIColor whiteColor] colorWithAlphaComponent:0];
    [self.view addSubview:navView];
    //
    [self setLefAndRight];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.infoTableView];
    
    _infoTableView.tableHeaderView=self.infoHeader;
    
    _infoTableView.tableFooterView=[[UIView alloc]init];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
   
    [self setSDCycleScrollView];
    
    [self addFootButtonView];

}
//
-(void)setLefAndRight{

    //收藏
    keepBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [keepBtn setFrame:myRect(284, 27, 30, 30)];
    [keepBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_Collection_n"] forState:UIControlStateNormal];
    [keepBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_Collection_pre"] forState:UIControlStateSelected];
    keepBtn.selected=YES;
  //  [keepBtn addTarget:self action:@selector(intoMessageCenter:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:keepBtn];
    //分享
    shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setFrame:myRect(329, 27, 30, 30)];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_share_n"] forState:UIControlStateNormal];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_share_pre"] forState:UIControlStateSelected];
    shareBtn.selected=YES;
  //  [shareBtn addTarget:self action:@selector(shareButton:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:shareBtn];
    //返回
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:myRect(15, 27, 30, 30)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_back_n"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_back_pre"] forState:UIControlStateSelected];
    //backBtn.selected=YES;
    [backBtn addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:backBtn];

}

//轮播图
-(void)setSDCycleScrollView{
   
    SDCycleScrollView *cycleScrollView = [[SDCycleScrollView alloc]init];
    [self setSDCycleScrollView:cycleScrollView addView:self.infoHeader from:self.infoHeader.bounds];
    
}

-(void)addFootButtonView{

    NSArray *nameArray=@[@"预约安装",@"寄送购买"];
    
    for (int i=0; i<2; i++) {
        
        footBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        if (ScreenWidth==320) {
            
            footBtn.frame=CGRectMake(10+160*i, 5, 140, 38);
            
        }else if (ScreenWidth==414){
            
            footBtn.frame=CGRectMake(15+200*i, 5, 183, 38);
            
        }else{
            
            footBtn.frame=CGRectMake(10+187*i, 5, 169, 38);
        }
        
        footBtn.tag=3000+i;
        [footBtn setTitle:nameArray[i] forState:UIControlStateNormal];
        footBtn.layer.cornerRadius=5;
        [footBtn addTarget:self action:@selector(footBunClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonViewFoot addSubview:footBtn];
        
        if (footBtn.tag==3000) {
            
            footBtn.backgroundColor=HWColor(234, 186, 62);
            
        }else if(footBtn.tag==3001){
            
            footBtn.backgroundColor=HWColor(234, 86, 62);
            
        }
    }

    [self.view addSubview:self.buttonViewFoot];
}

-(void)footBunClick:(UIButton *)send{

    if (send.tag==3000) {
       
        //填写订单--预约安装
        FillViewController *fill=[[FillViewController alloc]init];
        [self.navigationController pushViewController:fill animated:YES];
        
    }else{
        
        //填写订单--下单购买
        FillViewController *fill=[[FillViewController alloc]init];
        [self.navigationController pushViewController:fill animated:YES];
    
    }
}

-(void)backClick{

    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark - UITableViewCell
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
    return 168;
    }else{
    
        return 46;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    if (section==0) {
      
        return 0;
    }else{
   
        return 12;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section==0) {
        
    InfoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
    if (cell==nil) {
        cell=[[InfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
    }
    
    return cell;

    }
    
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
    
    if (cell==nil) {

        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
        if (indexPath.section==1) {
        
        cell.textLabel.text=@"选择   颜色分类";
        cell.textLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
        //
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:myRect(342, (cell.frame.size.height-19)/2, 19, 19)];
        imageView.image=[UIImage imageNamed:@"common_icon_arrow1_n"];
        [cell.contentView addSubview:imageView];
      
        }
       
        if (indexPath.section==2) {
            
            cell.textLabel.text=@"图文详情";
            cell.textLabel.textColor=HWColor(234,86,62);
            cell.textLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
            UIView *colorLine=[[UIView alloc]initWithFrame:CGRectMake(0, 44, ScreenWidth, 2)];
            colorLine.backgroundColor=HWColor(234,86,62);
            [cell.contentView addSubview:colorLine];
            
        }
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    if (indexPath.section==1) {
//        ChooseColorViewController *chooseView=[[ChooseColorViewController alloc]init];
//        [self.navigationController pushViewController:chooseView animated:YES];
        
        ChooseColorView *view=[[ChooseColorView alloc]initWithFrame:myRect(0, 667, 375, 330)];
        
        
       [self.view addSubview:view];
        
        
//        ColorViewController *color=[[ColorViewController alloc]init];
//        if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
//            
//            color.modalPresentationStyle=UIModalPresentationOverCurrentContext;
//            
//        }else{
//            
//            self.modalPresentationStyle=UIModalPresentationCurrentContext;
//            
//        }
//
//        // color.modalPresentationStyle=UIModalPresentationCurrentContext;
//        [self presentViewController:color animated:YES completion:^{
//            
//        }];
//        
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView.contentOffset.y > 70) {
        
        [UIView animateWithDuration:0.4 animations:^{
            
            navView.backgroundColor = [HWColor(225,225,225) colorWithAlphaComponent:1];
            
            textLb.hidden=NO;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }else if (scrollView.contentOffset.y > 50){
        
        navView.backgroundColor = [HWColor(225,225,225) colorWithAlphaComponent:0.5];
        textLb.hidden=NO;
        
    }else{
        
        [UIView animateWithDuration:0.4 animations:^{
            
            navView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
            
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
-(void)backButton:(UIButton *)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    YYLog(@"返回。。");
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

   // [ChooseColorView setAnimationsEnabled:YES];

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
