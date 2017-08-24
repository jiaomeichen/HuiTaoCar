//
//  ChooseColorViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/31.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ChooseColorViewController.h"
#import "YJTagFrame.h"
#import "YJTagView.h"
#import "FillViewController.h"
#import "ChooseColorView.h"

#define BACKGROUNDCOLOR [UIColor colorWithRed:239.0/255.0 green:34.0/255.0 blue:109.0/255.0 alpha:1.0]

@interface ChooseColorViewController ()<UITableViewDelegate,UITableViewDataSource,YJTagViewDelegate>

{
    CGFloat _lastPosition;
    CGFloat oldFloat;
    UIView *_navView;

    UIButton *footBtn;//底部两个button
    UILabel *titleLb;//顶部汽车详情
    UIButton *keepBtn;//收藏
    UIButton *shareBtn;//分享
    NSString *string;//储存选择的颜色
    NSArray *array;
    UILabel *colorLabel;
}

@property (nonatomic,strong)UITableView *ChooseColorTableView;
@property (nonatomic,strong)UIView *ChooseColorHeaderView;
@property (nonatomic,strong)UIView *ChooseColorFootView;
@property (nonatomic,strong)UIView *FootView;
@property (nonatomic, strong)UIView *navView;
@property (nonatomic,assign)CGFloat contentX;//艺术家偏移

@end

@implementation ChooseColorViewController

- (void)dealloc
{
    _ChooseColorFootView = nil;
    _ChooseColorHeaderView = nil;
    _ChooseColorTableView = nil;
    _FootView=nil;
}

-(UITableView *)ChooseColorTableView{
    if (!_ChooseColorTableView) {
        _ChooseColorTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _ChooseColorTableView.delegate=self;
        _ChooseColorTableView.dataSource=self;
    }

    return _ChooseColorTableView;
}

-(UIView *)ChooseColorHeaderView{

    if (!_ChooseColorHeaderView) {
        _ChooseColorHeaderView=[[UIView alloc]initWithFrame:myRect(0, 0, 375, 310)];
       // _ChooseColorHeaderView.userInteractionEnabled = YES;
    }
    return _ChooseColorHeaderView;
}
//footView
-(UIView *)ChooseColorFootView{

    if (!_ChooseColorFootView) {
        _ChooseColorFootView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,303)];
        _ChooseColorFootView.userInteractionEnabled=YES;
    }
    return _ChooseColorFootView;
}
//底部两个按钮view
-(UIView *)FootView{

    if (!_FootView) {
        _FootView=[[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
        _FootView.backgroundColor=HWColor(225, 225, 225);
    }
    return _FootView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];

}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self scrollViewDidScroll:self.ChooseColorTableView];
    [self.view addSubview:self.ChooseColorTableView];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"透明背景"]];
    //导航
    _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,DP_SCREEN_WIDTH, 64)];
    _navView.backgroundColor =[[UIColor whiteColor] colorWithAlphaComponent:0];
    [self.view addSubview:_navView];
    //
    self.ChooseColorTableView.tableHeaderView=self.ChooseColorHeaderView;
    self.ChooseColorTableView.tableFooterView=self.ChooseColorFootView;
    //收藏
    keepBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [keepBtn setFrame:CGRectMake(284, 27, 30, 30)];
    [keepBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_Collection_n"] forState:UIControlStateNormal];
    [keepBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_Collection_pre"] forState:UIControlStateSelected];
    keepBtn.selected=YES;
    [keepBtn addTarget:self action:@selector(intoMessageCenter:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:keepBtn];
    
    //分享
    shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setFrame:CGRectMake(329, 27, 30, 30)];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_share_n"] forState:UIControlStateNormal];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_share_pre"] forState:UIControlStateSelected];
    shareBtn.selected=YES;
    [shareBtn addTarget:self action:@selector(shareButton:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:shareBtn];
    
    //返回
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(15, 27, 30, 30)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_back_n"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Order-details_nav_icon_back_pre"] forState:UIControlStateSelected];
    [backBtn addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:backBtn];
    
    SDCycleScrollView *cycleScrollView2 = [[SDCycleScrollView alloc]init];
    [self setSDCycleScrollView:cycleScrollView2 addView:self.ChooseColorHeaderView from:myRect(0,0,375, 250)];
    //
    [self setCellView];
    
    //选择颜色view
    [self chooseColor];
    
    //底部两个按钮
    [self setFootView];
    }

-(void)setCellView{
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:myRect(15, 230, 100, 75)];
    imageview.image=[UIImage imageNamed:@"Hui-taocar.com500x500"];
    imageview.layer.borderWidth=1;
    imageview.layer.borderColor=[[UIColor blackColor] CGColor];
    [self.ChooseColorHeaderView addSubview:imageview];

    //
    UILabel *label=[[UILabel alloc]initWithFrame:myRect(136, 265, 98, 17)];
    [self creatLabel:label setupColor:HWColor(234, 86, 62) setupUIFont:MyFontSize17 setupText:@"￥86.7"];
        [self.ChooseColorHeaderView addSubview:label];
    
    colorLabel=[[UILabel alloc]initWithFrame:myRect(136, 290, 98, 17)];
    [self creatLabel:colorLabel setupColor:HWColor(200, 200, 200) setupUIFont:MyFontSize17 setupText:[NSString stringWithFormat:@"%@",string]];
    [self.ChooseColorHeaderView addSubview:colorLabel];
    
    UIButton *deleteBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    deleteBtn.frame=myRect(335, 270, 22, 22);
    [deleteBtn setImage:[UIImage imageNamed:@"购物车-删除按钮"] forState:UIControlStateNormal];
    deleteBtn.layer.cornerRadius=10;
    deleteBtn.layer.borderWidth=1;
    deleteBtn.layer.borderColor=[[UIColor blackColor]CGColor ];
    [self.ChooseColorHeaderView addSubview:deleteBtn];
}

-(void)chooseColor{

    UILabel *titleLB=[[UILabel alloc]initWithFrame:CGRectMake(15, 20, 70, 15)];
    [self creatLabel:titleLB setupColor:[UIColor grayColor] setupUIFont:MyFontSize14 setupText:@"颜色分类"];
    [self.ChooseColorFootView addSubview:titleLB];
    
    array = @[@"code4app",@"轻音少女",@"花季少女",@"我们仍未知道那天所看见的花的名字",@"华语",@"花有重开日",@"空之境界"];
    
    YJTagFrame *frame = [[YJTagFrame alloc] init];
    frame.tagsMinPadding = 10;
    frame.tagsMargin = 10;
    frame.tagsLineSpacing = 10;
    frame.tagsArray = array;
    //
    YJTagView *tagView = [[YJTagView alloc] initWithFrame:CGRectMake(0,45, ScreenWidth, frame.tagsHeight)];
    tagView.clickbool = YES;
    tagView.borderSize = 0.5;
    tagView.clickborderSize = 0.5;
    tagView.tagsFrame = frame;
    tagView.clickBackgroundColor = BACKGROUNDCOLOR;
    tagView.clickTitleColor = BACKGROUNDCOLOR;
    tagView.clickStart = 0;
    tagView.clickString = @"华语";//单选  tagView.clickStart 为0
    tagView.delegate = self;
    
    [self.ChooseColorFootView addSubview:tagView];

}

//设置底部两个按钮
-(void)setFootView{

        NSArray *nameArray=@[@"预约安装",@"下单购买"];
        
        for (int i=0; i<2; i++) {
            
            footBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            if (ScreenWidth==320) {
                
                footBtn.frame=CGRectMake(10+160*i, 5, 140, 38);
                
            }else{
                
                footBtn.frame=CGRectMake(10+187*i, 5, 169, 38);
            }
            
            footBtn.tag=3000+i;
            [footBtn setTitle:nameArray[i] forState:UIControlStateNormal];
            footBtn.layer.cornerRadius=5;
            [footBtn addTarget:self action:@selector(footBunClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.FootView addSubview:footBtn];
            
            if (footBtn.tag==3000) {
                
                footBtn.backgroundColor=HWColor(234, 186, 62);
                
            }else if(footBtn.tag==3001){
                
                footBtn.backgroundColor=HWColor(234, 86, 62);
                
            }
        }
        
        [self.view addSubview:self.FootView];
 
}

//收藏按钮
-(void)intoMessageCenter:(UIButton *)btn{



}

//分享按钮
-(void)shareButton:(UIButton *)send{


}
//监听底部按钮
-(void)footBunClick:(UIButton *)button{

    if (button.tag==3000) {
        
        //预约安装
        
    }else{
    
        //填写订单
        FillViewController *fill=[[FillViewController alloc]init];
        [self.navigationController pushViewController:fill animated:YES];
        
    }

}
#pragma mark 选中
-(void)YJTagView:(NSArray *)tagArray{
    
    YYLog(@"%@",tagArray);
    
    
}
-(void)YJTag:(int)tag{

    YYLog(@"0000%d",tag);

[self creatLabel:colorLabel setupColor:HWColor(200, 200, 200) setupUIFont:MyFontSize17 setupText:array[tag]];
}

#pragma mark-UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"color"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"color"];
    }
    
    cell.backgroundColor=[UIColor blackColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 1;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView.contentOffset.y > 70) {
        
        [UIView animateWithDuration:0.4 animations:^{
            
            _navView.backgroundColor = [HWColor(234, 86, 62) colorWithAlphaComponent:1];
            
            //textLb.hidden=NO;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }else if (scrollView.contentOffset.y > 50){
        
        _navView.backgroundColor = [HWColor(234, 86, 62) colorWithAlphaComponent:0.5];
       // textLb.hidden=NO;
        
    }
    
    
    else{
        [UIView animateWithDuration:0.4 animations:^{
            
            _navView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
            
           // textLb.hidden=YES;
            
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
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    

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
