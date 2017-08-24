//
//  TiCarViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/2.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "TiCarViewController.h"
#import "TiCarTableViewCell.h"
@interface TiCarViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tiCarTableView;
@end

@implementation TiCarViewController

-(UITableView *)tiCarTableView{

    if (!_tiCarTableView) {
        
        _tiCarTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)style:UITableViewStylePlain];
        _tiCarTableView.delegate=self;
        _tiCarTableView.dataSource=self;
    }
    
    if ([_tiCarTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_tiCarTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tiCarTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_tiCarTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    return _tiCarTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"提车地点";
    self.navigationController.navigationBar.barTintColor=HWColor(225, 225, 225);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
   
    [self.view addSubview:self.tiCarTableView];
    self.tiCarTableView.tableFooterView=[[UIView alloc]init];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TiCarTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ooo"];
    if (cell==nil) {
        cell=[[TiCarTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ooo"];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 96;

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
