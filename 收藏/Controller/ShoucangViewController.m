//
//  ShoucangViewController.m
//  HuiTaoCar
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ShoucangViewController.h"
#import "TCAddresSelectViewController.h"
#import "MZCardCell.h"
#import "CarModel.h"
#import "MHActionSheet.h"
#import "FootView.h"
#import "HeaderView.h"
#import "CarInfoViewController.h"

@interface ShoucangViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *shoucangtableView;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)FootView * footView;
@property(nonatomic,strong)HeaderView *headerView;

//数据源
@property (nonatomic, strong) NSMutableArray  *dataArray;
//垃圾箱按钮
@property (nonatomic, strong) UIBarButtonItem *rightButton;
//存储待删除的数据
@property (nonatomic, strong) NSMutableArray  *deleteArray;

@end

@implementation ShoucangViewController

-(UITableView *)shoucangtableView{

    if (!_shoucangtableView) {
    
        _shoucangtableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-50) style:UITableViewStylePlain];
        _shoucangtableView.delegate=self;
        _shoucangtableView.dataSource=self;
        _shoucangtableView.backgroundColor=HWColor(240, 240, 240);
        _shoucangtableView.tableFooterView=[[UIView alloc]init];
    }
    return _shoucangtableView;
}

//底部删除
-(FootView *)footView{
    if (!_footView) {
        _footView=[[FootView alloc]initWithFrame:CGRectMake(0, ScreenHeight-99, ScreenWidth, 50)];
    }
    return _footView;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title=@"我的收藏";
    self.navigationItem.leftBarButtonItem=nil;
  
    //右边按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shouchang_nav_icon_eidt_dis"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButton:)];
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
    
     [self.view addSubview:self.footView];
    self.footView.hidden=YES;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    //待删除的数据
    _deleteArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    //数据源
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 2; i ++) {
        [_dataArray addObject:[NSString stringWithFormat:@"名字：%d",i]];
    }
// _dataArray=nil;
//
//    if (_dataArray==nil) {
//        
//        [self createHeader];
//        
//        UIImageView *imageView=[[UIImageView alloc]initWithFrame:myRect(57, 205, 262, 177)];
//        imageView.image=[UIImage imageNamed:@"chouchang_background-image"];
//        [self.view addSubview:imageView];
//        UILabel *label=[[UILabel alloc]initWithFrame:myRect(110, 412, 175, 12)];
//        label.text=@"这里什么也没有... ...快去溜溜吧";
//        label.font=[UIFont systemFontOfSize:MYFontSize11];
//        [self.view addSubview:label];
//        
//    }else{
    
    
    //注册标题头
    [self.shoucangtableView registerClass:NSClassFromString(@"HeaderView") forHeaderFooterViewReuseIdentifier:@"HeaderView"];
    [self.view addSubview:self.shoucangtableView];
    [self createHeader];
}

-(void)createHeader{
    
    UIView *xuanzeView=[[UIView alloc]init];
    xuanzeView.backgroundColor=[UIColor whiteColor];//HWColor(225, 225, 225);
    
//    if (_dataArray==nil) {
//        xuanzeView.frame=myRect(0,64, 375, 84);
//        [self.view addSubview:xuanzeView];
//
//    }else{
   
        xuanzeView.frame=myRect(0, 0, 375, 84);
        _shoucangtableView.tableHeaderView=xuanzeView;
//   }
    
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
        [_button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        _button.titleLabel.font=[UIFont systemFontOfSize:MyFontSize13];
        [_button setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_n"]forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"choucang_shuaixuan_icon_arrow_s"] forState:UIControlStateSelected];
        _button.tag=1000+i;
        _button.enabled=YES;
    
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGSize imageSize = _button.imageView.frame.size;
        CGSize titleSize = _button.titleLabel.frame.size;
        _button.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, 0.0, 10 );
        _button.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width , 0.0, - titleSize.width);
        _button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
       
        [xuanzeView addSubview:_button];
        
        //线---1
        UIView *line=[[UIView alloc]initWithFrame:myRect(21+76*i+i*11, 59, 76, 1)];
        line.backgroundColor=HWColor(153, 153,153);
        [xuanzeView addSubview:line];
        //灰色的分割线---2
        UIView *huiseView2=[[UIView alloc]initWithFrame:myRect(0, 72, 375, 12)];
        huiseView2.backgroundColor=HWColor(225, 225, 225);
        [xuanzeView addSubview:huiseView2];
        
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
            
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:@"来源" style:MHSheetStyleDefault itemTitles:laiArray];
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                button.titleLabel.text = [NSString stringWithFormat:@"%@",title];
                __weak typeof(self) weakSelf = self;
                
                [weakSelf.shoucangtableView reloadData];
                
            }];
            
        }else if (button.tag==1001){
            
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:@"车型" style:MHSheetStyleDefault itemTitles:carArray];
            
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                button.titleLabel.text = [NSString stringWithFormat:@"%@",title];
                __weak typeof(self) weakSelf = self;
                [weakSelf.shoucangtableView reloadData];
                
            }];
            
        }else if (button.tag==1002){
            
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:@"现车/期车" style:MHSheetStyleDefault itemTitles:carLeiArray];
            
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                button.titleLabel.text = [NSString stringWithFormat:@"%@",title];
                __weak typeof(self) weakSelf = self;
                [weakSelf.shoucangtableView reloadData];
                
            }];
        }
    }
}



//导航栏右边的按钮
-(void)rightButton:(UIBarButtonItem *)rightButton{
    
    //将之前_deleteArray里面的数据清空
    [_deleteArray removeAllObjects];
    
    [_shoucangtableView setEditing:!_shoucangtableView.editing animated:YES];
    //
    if (_shoucangtableView.editing) {
        
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneButton:)];
        self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
        self.footView.hidden=NO;
        [self.footView.selectAllButton addTarget:self action:@selector(selectAllButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.footView.deleteButton addTarget:self action:@selector(deleteButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

-(void)selectAllButton:(UIButton *)send{
  
    if (send.selected) {
       
        for (int i = 0; i < self.dataArray.count; i ++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            
            [self.shoucangtableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
            
            [self.deleteArray addObjectsFromArray:self.dataArray];
            
        }
   
    }else{

        
    }
}

-(void)deleteButton:(UIButton *)send{

    //将要删除的数据删除
    //removeObjectsInArray:将一个数组从另一个数组里面删除
    [_dataArray removeObjectsInArray:_deleteArray];
    //刷新数据
    [_shoucangtableView reloadData];

}

-(void)doneButton:(UIBarButtonItem *)done{
    
    [_shoucangtableView setEditing:!_shoucangtableView.editing animated:YES];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shouchang_nav_icon_eidt_dis"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButton:)];
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
 
    self.footView.hidden=YES;

}


#pragma mark--UITableView的代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return [HeaderView getCartHeaderHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
   // NSMutableArray *shopArray = self.viewModel.cartData[section];
    
    HeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderView"];
  /*
    static NSString *ID = @"header";
    // 先从缓存池中找header
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    UILabel *label = nil;
    
    if (header == nil) { // 缓存池中有，自己创建
        
        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:ID];
        header.contentView.backgroundColor = HWColor(245, 245, 245);
        
        label = [[UILabel alloc] init];
        label.textColor = HWColor(67, 67, 67);
        label.frame=CGRectMake(15, 5, 70, 30);
        label.tag = 99;
        [header.contentView addSubview:label];
        
    }else{
        
        
        
        // 从缓冲池中取出来
        label = (UILabel *)[header viewWithTag:99];
    }
   
    // 设置文字
//    if (section == 0) {
//        
//        label.text = self.dataArray.count ? @"最热评论" : @"最新评论";
//        
//    }else{
//        
//        label.text = @"最新评论";
//    } 
//
    
    return header;
 */
    return headerView;
}

#pragma mark - 多选删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    //删除和插入一起返回，会出现多选删除的状态
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
    if (cell==nil) {
        
        cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
    }
    
//    CarModel *model=[[CarModel alloc]init];
//    cell.nameLabel.text=model.name;
//    cell.textLabel.text=model.xiangqing;
//    cell.colorLabel.text=model.color;
//    
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 0.143*ScreenHeight;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //当tableView处于可编辑的状态时
    if (tableView.editing) {
        
        //将选中的那一行数据放到删除的数组里面
        [_deleteArray addObject:[_dataArray objectAtIndex:indexPath.row]];
      
        YYLog(@"dddddddddddd");
        
    }else{
        
        //当tableView处于不可编辑的状态时，该干嘛干嘛
        
        YYLog(@"++++++++++gg");
        CarInfoViewController *carInfoView=[[CarInfoViewController alloc]init];
        [carInfoView setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:carInfoView animated:YES];
    
    }
    
}

//反选的操作：取消选中
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    //当tableView处于可编辑的状态时
    if (tableView.editing) {
        //将选中的那一行数据删除的数组里面移除
     //   [_deleteArray removeObject:[_dataArray objectAtIndex:indexPath.row]];
    }
}



-(void)didReceiveMemoryWarning {
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
