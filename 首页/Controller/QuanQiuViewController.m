//
//  QuanQiuViewController.m
//  HuiTaoCar
//
//  Created by user on 16/7/27.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "QuanQiuViewController.h"
#import "MyCollectionViewCell.h"

@interface QuanQiuViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

{
    
    NSMutableArray *dataArray;
    UIButton *button;
    UITableViewCell *cell1;
    
    UITextField *colorFD;//颜色要求
    UITextField *priceFD;//价格区间
    UITextField *infoFD;//信息
    UITextField *nameFD;//联系人
    UITextField *numFD;//手机号
    UITextField *corfFD;//验证码
    
}

@property (nonatomic,strong)UIView *HeaderglobalView;
@property (nonatomic,strong)UIView *FootGlobalView;
@property (nonatomic,strong)UITableView *globalTableView;

@end

@implementation QuanQiuViewController

-(UITableView *)globalTableView{
    
    if (!_globalTableView) {
        _globalTableView=[[UITableView alloc]initWithFrame:CGRectMake( 0, 0, ScreenWidth,ScreenHeight) style:UITableViewStylePlain];
        _globalTableView.delegate=self;
        _globalTableView.dataSource=self;
        _globalTableView.backgroundColor=HWColor(240, 240, 240);
    }
    if ([_globalTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_globalTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_globalTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_globalTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    return _globalTableView;
}



-(UIView *)HeaderglobalView{

    if (!_HeaderglobalView) {
        _HeaderglobalView=[[UIView alloc]initWithFrame:myRect(0, 0, 375, 226)];
        _HeaderglobalView.backgroundColor=HWColor(240, 240, 240);
    }
    return _HeaderglobalView;
}
-(UIView *)FootGlobalView{

    if (!_FootGlobalView) {
        _FootGlobalView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
        
        UIButton *keepBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        keepBtn.frame=myRect(60, 30, 256, 45);
        [keepBtn setTitle:@"保存" forState:UIControlStateNormal];
        [keepBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        keepBtn.backgroundColor=HWColor(234, 86, 62);
        [keepBtn addTarget:self action:@selector(keepButton) forControlEvents:UIControlEventTouchUpInside];
        [self.FootGlobalView addSubview:keepBtn];
     
    }
    return _FootGlobalView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.navigationItem.title=@"全球定制";
    
    [self.view addSubview:self.globalTableView];
    self.globalTableView.tableHeaderView=self.HeaderglobalView;
    self.globalTableView.tableFooterView=self.FootGlobalView;

    //
    [self setCollectionView];
    //
    [self xuanZeView];
    
}

//品牌按钮
-(void)setCollectionView{
    
    //数据源
    dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 1; i <40 ; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        
        [dataArray addObject:image];
    }
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置水平最小间距
    layout.minimumInteritemSpacing =10;
    //设置垂直最小间距
    layout.minimumLineSpacing = 10;
    //UICollectionView  实例化
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:myRect(0, 0, 375, 133) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    //注册MyCollectionViewCell类
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"iden"];
    //默认黑色的背景颜色
    collectionView.backgroundColor =HWColor(242, 242, 242);
    [_HeaderglobalView addSubview:collectionView];
    
}
//车型 来源 现车  所在城市
-(void)xuanZeView{
    
    UIView *xuanzeView=[[UIView alloc]initWithFrame:myRect(0,143, 375, 73)];
    xuanzeView.backgroundColor=[UIColor whiteColor];//HWColor(225, 225, 225);
    [self.HeaderglobalView addSubview:xuanzeView];
    
    NSArray *array=@[@"车型",@"来源",@"现车/期车",@"所在城市"];
    NSArray *arrTitle=@[@"全部",@"墨西哥版",@"全部",@"全部"];
    for (int i=0; i<4; i++) {
        UILabel *label=[[UILabel alloc]init];
        label.frame=myRect(21+71.25*i+20*i, 17, 71.25, 13);
        label.font=[UIFont systemFontOfSize:MyFontSize13];
        label.textColor=HWColor(153, 153, 153);
        label.text=array[i];
        [xuanzeView addSubview:label];
        
        //按钮
        button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=myRect(21+76*i+i*11, 43, 76, 13);
        [button setTitle:arrTitle[i] forState:UIControlStateNormal];
        [button setTitleColor:HWColor(102, 102, 102) forState:UIControlStateNormal];
        button.tag=1000+i;
        //[_button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        button.titleLabel.font=[UIFont systemFontOfSize:MYFontSize12];
        [button setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_n"]forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_s"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGSize imageSize = button.imageView.frame.size;
        CGSize titleSize = button.titleLabel.frame.size;
        button.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, imageSize.width );
        button.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width , 0.0, - titleSize.width);
        button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        [xuanzeView addSubview:button];
        
        //线---1
        UIView *line=[[UIView alloc]initWithFrame:myRect(21+76*i+i*11,59, 65, 1)];
        line.backgroundColor=HWColor(153, 153,153);
        [xuanzeView addSubview:line];
       
        if (ScreenWidth==320) {
            
            label.frame=myRect(15+71.25*i+13*i, 15, 71.25, 13);
            button.frame=myRect(15+80*i+i*8, 43, 80, 20);
            button.titleLabel.font=[UIFont systemFontOfSize:MyFontSize13];
            
        }else{
            
            label.frame=myRect(21+71.25*i+20*i, 15, 71.25, 13);
            //button.frame=myRect(15+80*i+i*10, 43, 80, 20);
            button.frame=myRect(21+78*i+i*12, 43, 76, 13);
            button.titleLabel.font=[UIFont systemFontOfSize:MyFontSize14];
        }
    }
}

-(void)buttonClick:(UIButton *)send{

    YYLog(@"sssssssssssss");
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    cell1=[tableView dequeueReusableCellWithIdentifier:@"golbal"];
    
    if (cell1==nil) {
        cell1=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"golbal"];
        
        cell1.selectionStyle=UITableViewCellSelectionStyleNone;
        NSArray  * textArray=@[@[@"特殊要求",@"外观颜色",@"价格区间",@"备注信息"],@[@"联系人信息",@"联系人",@"手机号",@"验证码"]];
        cell1.textLabel.text=textArray[indexPath.section][indexPath.row];
        cell1.textLabel.font= [UIFont systemFontOfSize:MyNavTitleSize];

        if (indexPath.section==0&&indexPath.row==1) {
           
            colorFD=[[UITextField alloc]initWithFrame:CGRectMake(95, 0, ScreenWidth-95, cell1.frame.size.height)];
            colorFD.placeholder=@"请输入颜色要求，最多30字";
            colorFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell1.contentView addSubview:colorFD];
            
            
        }else if (indexPath.section==0&&indexPath.row==2){
          
            priceFD=[[UITextField alloc]initWithFrame:CGRectMake(95, 0, ScreenWidth-95, cell1.frame.size.height)];
            priceFD.placeholder=@"70到80万间的豪车";
            priceFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell1.contentView addSubview:priceFD];
        
        }else if (indexPath.section==0&&indexPath.row==3){
          
            infoFD=[[UITextField alloc]initWithFrame:CGRectMake(95, 0, ScreenWidth-95, cell1.frame.size.height)];
            infoFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            infoFD.placeholder=@"请输入颜色要求，最多30字";
            [cell1.contentView addSubview:infoFD];
            
        }else if (indexPath.section==1&&indexPath.row==1){
            
            nameFD=[[UITextField alloc]initWithFrame:CGRectMake(95, 0, ScreenWidth-95, cell1.frame.size.height)];
            nameFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            nameFD.placeholder=@"请输入联系人的姓名";
            [cell1.contentView addSubview:nameFD];
            
            
        }else if (indexPath.section==1&&indexPath.row==2){
            
            numFD=[[UITextField alloc]initWithFrame:CGRectMake(95, 0, ScreenWidth-95, cell1.frame.size.height)];
            numFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            numFD.placeholder=@"请输联系人手机号";
            [cell1.contentView addSubview:numFD];
            
            
        }else if (indexPath.section==1&&indexPath.row==3){
            
            colorFD=[[UITextField alloc]initWithFrame:CGRectMake(95, 0, ScreenWidth-95, cell1.frame.size.height)];
            colorFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            colorFD.placeholder=@"请输入验证码";
            [cell1.contentView addSubview:colorFD];
            
        }
    }
    return cell1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   
    if (section==1) {
      
        return 0;
    
    }else{
    
        return 10;
    }
}

-(void)keepButton{

    YYLog(@"保存了  主银。。。");
    [self showHUD:@"保存" view:self.view time:1];
}


#pragma mark - UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
//设置单元格的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
    return dataArray.count;
    
}

//设置段数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
  
    return 1;
    
}

//UICollectionViewCell  必须用自定义的样式，必须用注册的格式创建
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"iden" forIndexPath:indexPath];
    
    cell.imageView.image = dataArray[indexPath.row];
  
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
