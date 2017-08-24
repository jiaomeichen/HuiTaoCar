//
//  CarBrandViewController.m
//  HuiTaoCar
//  汽车品牌
//  Created by user on 16/7/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "CarBrandViewController.h"
#import "MZCardCell.h"
#import "YJButton.h"
#import "MHActionSheet.h"
#import <MJRefresh.h>
#import "CityViewController.h"
#import "MyCollectionViewCell.h"
#import "TCAddresSelectViewController.h"

#import "CarInfoViewController.h"
#import "ChooseView.h"
#import "LogoModel.h"
#import "carInfoModel.h"
static const CGFloat MJDuration = 2.0;

@interface CarBrandViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property(nonatomic,strong)UIView *carHeaderView;//头部底层View
@property(nonatomic,strong)UITableView *carTableView;//
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)NSArray *nameCar;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,assign)BOOL isSelect;
@property (nonatomic,strong)NSMutableArray *dataArray;//logo
@property (nonatomic,strong)NSMutableArray *dataSource;////数据源
@end

@implementation CarBrandViewController
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
-(UITableView *)carTableView{

    if (!_carTableView) {
        //初始化UITableView
        _carTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _carTableView.delegate=self;
        _carTableView.dataSource=self;
        _carTableView.backgroundColor=HWColor(250, 250, 250);
    }
        if ([_carTableView respondsToSelector:@selector(setSeparatorInset:)])
        {
            [_carTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_carTableView respondsToSelector:@selector(setLayoutMargins:)])
        {
            [_carTableView setLayoutMargins:UIEdgeInsetsZero];
        }
        return _carTableView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Logo数据
    [self downLogo];
    //导航栏的设置
    self.navigationItem.title=@"汽车品牌";
    self.navigationItem.leftBarButtonItem=nil;
    [self.view addSubview:self.carTableView];
   
    //标题头view
    [self creatHeaderView];
    //UItableView 数据
    [self downloadCarInfo];
    //下来刷新
    [self setHeaderRefresh];
   
    //上拉加载
    [self setupRefresh];
    
}
//标题头view
-(void)creatHeaderView{
    _carHeaderView=[[UIView alloc]initWithFrame:myRect(0, 0, 375, 229)];
    _carHeaderView.backgroundColor=HWColor(234, 99, 69);
    self.carTableView.tableHeaderView=_carHeaderView;
    //品牌按钮
    [self createBtn];
    //车型 来源 现车  所在城市
    [self xuanZeView];
    //灰色的分割线---1
    UIView *huiseView=[[UIView alloc]initWithFrame:myRect(0, 133, 375, 12)];
    huiseView.backgroundColor=HWColor(240, 240, 240);
    [self.carHeaderView addSubview:huiseView];
    //灰色的分割线---2
    UIView *huiseView2=[[UIView alloc]initWithFrame:myRect(0, 217, 375, 12)];
    huiseView2.backgroundColor=HWColor(240, 240, 240);
    [self.carHeaderView addSubview:huiseView2];
    
}

//品牌按钮
-(void)createBtn{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing =10;
    layout.minimumLineSpacing = 10;
    //UICollectionView  实例化
    _collectionView = [[UICollectionView alloc] initWithFrame:myRect(0, 0, 375, 133) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //注册MyCollectionViewCell类
    [_collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"iden"];
    //默认黑色的背景颜色
    _collectionView.backgroundColor =HWColor(242, 242, 242);
    [_carHeaderView addSubview:_collectionView];
    //数据源
    _dataSource = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 1; i <40 ; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        
        [_dataSource addObject:image];
    }
    
}
-(void)downLogo{

    //网络请求
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self.manager GET:URL_Logo parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *redic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray*array=redic[@"content"];
        //数据源
        _dataArray=[[NSMutableArray alloc]init];
        for (NSDictionary *dic in array) {
            LogoModel *model=[[LogoModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [_dataArray addObject:model];
        }
        YYLog(@"%@",_dataArray);
       [_collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        YYLog(@"%@",error);
        
    }];
    
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
//设置单元格的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    YYLog(@"%ld",_dataArray.count);
   // return _dataArray.count;
    return 40;
}

//设置段数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
  
    return 1;
}

//UICollectionViewCell  必须用自定义的样式，必须用注册的格式创建
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"iden" forIndexPath:indexPath];
    //cell.logoModel=_dataArray[indexPath.row];
    
    cell.imageView.image = _dataSource[indexPath.row];
    NSArray *nameCar=@[@"宝马",@"奔驰",@"丰田",@"吉普",@"保时捷",@"路虎",@"道奇",@"福特",@"沃尔沃",@"玛莎拉蒂",@"奥迪",@"法拉利",@"GMC",@"占位",@"占位",@"宾利",@"麒麟",@"大众",@"捷豹",@"卡迪拉克",@"占位",@"法拉利",@"雷克萨斯",@"雷诺",@"林肯",@"",@"迈巴赫",@"讴歌",@"占位",@"三菱",@"全球鹰",@"斯巴鲁",@"现代",@"雪佛兰",@"英菲尼迪",@"起亚",@"占位",@"铃木",@"尼桑"];
     cell.label.text = nameCar[indexPath.item];//[NSString stringWithFormat:@"宝马"];
    YYLog(@"_______%@",_dataArray);
    return cell;
}
//设置单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //单元格默认大小：50*50
    //第一个参数：设置单元格的宽
    //第二个参数：设置单元格的高
   
    if (ScreenWidth==320) {
      
        return CGSizeMake(55, 56);
   
    }else if(ScreenWidth==414){
        
        return CGSizeMake(60, 72.6);
        
    }
    else{
     
        return CGSizeMake(58, 66);
    
    }
}
//设置水平最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    if (ScreenWidth==320) {
        
        return 0.5;
        
    }else{
        
        return 0.8;
        
    }
    
}
//设置垂直最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    if (ScreenWidth==320) {
       
        return 0.5;
    
    }else{
    
        return 0.8;

    }
}
//cell与cell之间的间隔，边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //上左下右
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//单元格的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
    NSLog(@"%ld   %ld",(long)indexPath.section,(long)indexPath.item);
    
       //    indexPath.item = indexPath.row 找到某一行
    
    //刷新数据
    //[collectionView reloadData];
}



//车型 来源 现车  所在城市
-(void)xuanZeView{

//    ChooseView*xuanzeView=[[ChooseView alloc]initWithFrame:myRect(0, 144, 375, 73)];
    
    UIView*xuanzeView=[[UIView alloc]initWithFrame:myRect(0, 144, 375, 73)];
    xuanzeView.backgroundColor=[UIColor whiteColor];//HWColor(225, 225, 225);
    [self.carHeaderView addSubview:xuanzeView];
 
    NSArray *array=@[@"车型",@"来源",@"现车/期车",@"所在城市"];
    NSArray *arrTitle=@[@"全部",@"墨西哥版",@"全部",@"全部"];
    for (int i=0; i<4; i++) {
        UILabel *label=[[UILabel alloc]init];
        label.frame=myRect(21+50*i+37*i, 17, 55, 11);
        label.font=[UIFont systemFontOfSize:MYFontSize12];
        label.textColor=HWColor(153, 153, 153);
        label.text=array[i];
        [xuanzeView addSubview:label];
        
        //按钮
        _button=[UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame=myRect(21+76*i+i*11, 43, 76, 13);
        [_button setTitle:arrTitle[i] forState:UIControlStateNormal];
        [_button setTitleColor:HWColor(102, 102, 102) forState:UIControlStateNormal];
        _button.tag=1000+i;
        [_button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        _button.titleLabel.font=[UIFont systemFontOfSize:MyFontSize13];
        //_button.titleLabel.adjustsFontSizeToFitWidth = YES;
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
        UIView *line=[[UIView alloc]initWithFrame:myRect(21+76*i+i*11, 59, label.frame.size.width, 1)];
        line.backgroundColor=HWColor(153, 153,153);
        [xuanzeView addSubview:line];
        
    }

}


-(void)buttonClick:(UIButton *)button{
    
    NSArray *carArray=@[@"宝马",@"奔驰",@"丰田",@"大众",@"道奇",@"福特",@"本田",@"玛莎拉蒂",@"路虎",@"野马",@"全部"];
    NSArray *laiArray=@[@"美规",@"欧规",@"墨西哥",@"改版",@"不限"];
    NSArray *carLeiArray=@[@"现车",@"期车"];
    
    
    if (button.tag==1003) {
        
        TCAddresSelectViewController *tca=[[TCAddresSelectViewController alloc]init];
        [tca setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:tca animated:YES];
        
        
    }else{
        
        if (button.tag==1000) {
            
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:@"车型" style:MHSheetStyleDefault itemTitles:carArray];
            
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
               
                button.titleLabel.text = [NSString stringWithFormat:@"%@",title];
                button.selected=!_isSelect;
                __weak typeof(self) weakSelf = self;
                [weakSelf.carTableView reloadData];
                
            }];
            
        }else if (button.tag==1001){
            
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:@"来源" style:MHSheetStyleDefault itemTitles:laiArray];
            
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                
                button.titleLabel.text = [NSString stringWithFormat:@"%@",title];
              button.selected=!_isSelect;
                __weak typeof(self) weakSelf = self;
                [weakSelf.carTableView reloadData];
                
            }];
            
        }else if (button.tag==1002){
            
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:@"现车/期车" style:MHSheetStyleDefault itemTitles:carLeiArray];
            button.selected=!_isSelect;
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                button.titleLabel.text = [NSString stringWithFormat:@"%@",title];
                __weak typeof(self) weakSelf = self;
                [weakSelf.carTableView reloadData];
                
            }];
        }
    }
}


#pragma mark  UITableView +下拉刷新
-(void)setHeaderRefresh{
    
    //防止死循环
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.carTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        //要处理的事件
        [weakSelf loadNewData];
        
    }];
    // 马上进入刷新状态
    [self.carTableView.mj_header beginRefreshing];
    
}

//下拉刷新处理事件----更新数据
-(void)loadNewData{
    
    YYLog(@"刷新");
    [self.carTableView.mj_header endRefreshing];
}

#pragma mark  UITableView +下拉刷新
-(void)setupRefresh{
    
    __unsafe_unretained __typeof(self) weakSelf = self;
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.carTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf loadMoreData];
    
    }];
}

#pragma mark 上拉加载更多数据
- (void)loadMoreData
{
    // 1.添加假数据
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.carTableView reloadData];
        [self.collectionView reloadData];
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.carTableView.mj_footer endRefreshing];
        // 拿到当前的上拉刷新控件，变为没有更多数据的状态
        [self.carTableView.mj_footer endRefreshingWithNoMoreData];
    });
}
-(void)downloadCarInfo{


    //网络请求
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self.manager GET:URL_Info parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *redic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray*dataArray=redic[@"content"];
        //数据源
        _dataSource=[[NSMutableArray alloc]init];
        for (NSDictionary *dic in dataArray) {
            
            carInfoModel *model=[[carInfoModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [_dataSource addObject:model];
        }
        
        [_carTableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        YYLog(@"%@",error);
        
    }];


}
#pragma mark--UITableView的代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //return _dataSource.count;
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
    if (cell==nil) {
        
        cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
    }
    //cell.carModel=_dataSource[indexPath.row];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 0.143*ScreenHeight;
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //消除选中后的效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CarInfoViewController *xiangqing=[[CarInfoViewController alloc]init];
    [xiangqing setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:xiangqing animated:YES];
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
