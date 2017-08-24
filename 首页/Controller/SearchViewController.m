//
//  SearchViewController.m
//  HuiTaoCar
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "SearchViewController.h"
#import "YJTagFrame.h"
#import "YJTagView.h"
#define BACKGROUNDCOLOR [UIColor colorWithRed:239.0/255.0 green:34.0/255.0 blue:109.0/255.0 alpha:1.0]

@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource,YJTagViewDelegate>
{
    UITableViewCell *cell;

}
@property (nonatomic,strong)UITableView *searchTableView;
@property (nonatomic,strong)UIView *searchHeaderView;

@end

@implementation SearchViewController

-(UITableView *)searchTableView{
    if (!_searchTableView) {
        _searchTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _searchTableView.delegate=self;
        _searchTableView.dataSource=self;
        _searchTableView.backgroundColor=HWColor(240, 240, 240);
        _searchTableView.showsVerticalScrollIndicator=NO;
        
    }
    if ([_searchTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_searchTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_searchTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_searchTableView setLayoutMargins:UIEdgeInsetsZero];
    }

    return  _searchTableView;
}

-(UIView *)searchHeaderView{

    if (!_searchHeaderView) {
        _searchHeaderView=[[UIView alloc]initWithFrame:myRect(0, 0, 375, 200)];
    }
    return  _searchHeaderView;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor=HWColor(242,242,242);
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(15, 7, 50, 26)];
    searchBar.placeholder = @"搜索车型、品牌、价格、配置";
    
    for (UIView *subview in searchBar.subviews) {
        for(UIView* grandSonView in subview.subviews){
            if ([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                grandSonView.alpha = 0.0f;
            }else if([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarTextField")] ){
                grandSonView.layer.cornerRadius = 0;
                grandSonView.backgroundColor = [UIColor whiteColor];
            }else{
                grandSonView.alpha = 0.0f;
            }
        }
    }
    self.navigationItem.titleView = searchBar;
    //右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.rightBarButtonItem.tintColor =HWColor(51, 51, 51);
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem=nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.searchTableView];
    self.searchTableView.tableFooterView=[[UIView alloc]init];
}

#pragma mark---代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
       
        return 170;
        
    }else{
    
        return ScreenHeight-170;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section==0) {
        
        return 0;
  
    }else{
    
        return 10;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    cell=[tableView dequeueReusableCellWithIdentifier:@"search"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"search"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.section==0) {
      
        UILabel *carLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 21, 100, 13)];
        [self creatLabel:carLabel setupColor:HWColor(234, 86, 62) setupUIFont:MyFontSize17 setupText:@"汽车品牌"];
        [cell.contentView addSubview:carLabel];
        //
        [self setCollectionView:indexPath.section];
        
    }else if (indexPath.section==1){
    
        UILabel *hotLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 21,100,13)];
        [self creatLabel:hotLabel setupColor:HWColor(234, 86, 62) setupUIFont:MyFontSize17 setupText:@"热销推荐"];
        [cell.contentView addSubview:hotLabel];
        //
        [self setCollectionView:indexPath.section];
    }

    return cell;
}

-(void)setCollectionView:(NSInteger)index{

  
    NSArray *array = @[@"宝马",@"奔驰",@"保时捷",@"法拉利",@"凯迪拉克",@"阿斯顿马丁",@"雪佛兰"];
     NSArray *array2 = @[@"宝马520",@"奔驰MG",@"保时捷911",@"法拉利",@"凯迪拉克",@"阿斯顿马丁",@"野马"];
    YJTagFrame *frame = [[YJTagFrame alloc] init];
    frame.tagsMinPadding = 10;
    frame.tagsMargin = 10;
    frame.tagsLineSpacing = 10;
    
    if (index==0) {
        
         frame.tagsArray = array;
        
    }else{
        
        frame.tagsArray = array2;
    
    }
   
    YJTagView *tagView = [[YJTagView alloc] initWithFrame:CGRectMake(0,45, ScreenWidth, frame.tagsHeight)];
    tagView.clickbool = YES;
    //tagView.borderSize = 0.5;
    tagView.clickborderSize = 0.5;
    tagView.tagsFrame = frame;
    tagView.clickBackgroundColor = BACKGROUNDCOLOR;
    tagView.clickTitleColor = BACKGROUNDCOLOR;
    tagView.clickStart = 0;
    tagView.clickString =nil;//单选  tagView.clickStart 为0
    tagView.delegate = self;
    
    [cell.contentView addSubview:tagView];

}

#pragma mark 选中
-(void)YJTagView:(NSArray *)tagArray{
    
    YYLog(@"%@",tagArray);
    
    
}
-(void)YJTag:(int)tag{
    
    YYLog(@"0000%d",tag);
    
    
    //[self creatLabel:colorLabel setupColor:HWColor(200, 200, 200) setupUIFont:MyFontSize17 setupText:array[tag]];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    YYLog(@"跳转详情界面");
   
}

-(void)backClick{

    [self.navigationController popViewControllerAnimated:YES];
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
