//
//  PeiJianViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/1.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "PeiJianViewController.h"
#import "MyCollectionViewCell.h"
#import "ZhuangJuCell.h"
#import "ZhuangjuInfoViewController.h"

@interface PeiJianViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

//数据源
@property (nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic,strong)UITableView *peijianTableView;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UIButton *button;
@end

@implementation PeiJianViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    //导航栏
    [self.navigationController.navigationBar setHidden:NO];
    self.navigationController.navigationBar.barTintColor=HWColor(228, 67, 47);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"汽车配件";
    
    _peijianTableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _peijianTableView.delegate=self;
    _peijianTableView.dataSource=self;
    _peijianTableView.backgroundColor=HWColor(240, 240, 240);
    
    if ([_peijianTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_peijianTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_peijianTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_peijianTableView setLayoutMargins:UIEdgeInsetsZero];
    }

    [self.view addSubview:_peijianTableView];
    
    [self resgistUI];
    [self createpinpai];
    [self xuanZeView];
    
}

-(void)resgistUI{
    _headerView=[[UIView alloc]initWithFrame:myRect(0, 0, 375, 229)];
    _headerView.backgroundColor=HWColor(220,220,220);
    _peijianTableView.tableHeaderView=_headerView;
    
}
//车型 来源 现车  所在城市
-(void)xuanZeView{
    
    UIView *xuanzeView=[[UIView alloc]initWithFrame:myRect(0, 144, 375, 73)];
    xuanzeView.backgroundColor=[UIColor whiteColor];//HWColor(225, 225, 225);
    [self.headerView addSubview:xuanzeView];
    
    NSArray *array=@[@"车型",@"来源",@"现车/期车",@"所在城市"];
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
        _button.titleLabel.font=[UIFont systemFontOfSize:MyFontSize13];
        [_button setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_n"]forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_s"] forState:UIControlStateSelected];
      //  [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
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

//品牌按钮
-(void)createpinpai{
    
    //数据源
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 1; i <40 ; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        
        [_dataArray addObject:image];
    }
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置水平最小间距
    layout.minimumInteritemSpacing =10;
    //设置垂直最小间距
    layout.minimumLineSpacing = 10;
    //UICollectionView  实例化
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:myRect(0, 0, 375, 133) collectionViewLayout:layout];
    //delegate
    collectionView.delegate = self;
    //dataSource
    collectionView.dataSource = self;
    //注册MyCollectionViewCell类
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"iden"];
    //默认黑色的背景颜色
    collectionView.backgroundColor =HWColor(242, 242, 242);
    [_headerView addSubview:collectionView];
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
//设置单元格的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
//设置段数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//UICollectionViewCell  必须用自定义的样式，必须用注册的格式创建
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"iden" forIndexPath:indexPath];
    
    cell.imageView.image = _dataArray[indexPath.row];
    
    NSArray *nameCar=@[@"宝马",@"奔驰",@"丰田",@"吉普",@"保时捷",@"路虎",@"道奇",@"福特",@"沃尔沃",@"玛莎拉蒂",@"奥迪",@"法拉利",@"GMC",@"占位",@"占位",@"宾利",@"麒麟",@"大众",@"捷豹",@"卡迪拉克",@"占位",@"法拉利",@"雷克萨斯",@"雷诺",@"林肯",@"",@"迈巴赫",@"讴歌",@"占位",@"三菱",@"全球鹰",@"斯巴鲁",@"现代",@"雪佛兰",@"英菲尼迪",@"起亚",@"占位",@"铃木",@"尼桑"];
    
    cell.label.text = nameCar[indexPath.item];//[NSString stringWithFormat:@"宝马"];
    
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
    return 0.8;
}
//设置垂直最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.8;
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
    [collectionView reloadData];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 0.143*ScreenHeight;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZhuangJuCell *cell=[tableView dequeueReusableCellWithIdentifier:@"string"];
    if (cell==nil) {
        cell=[[ZhuangJuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"string"];
        
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    YYLog(@"跳转详情");
    ZhuangjuInfoViewController *info=[[ZhuangjuInfoViewController alloc]init];
    [self.navigationController pushViewController:info animated:YES];
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
