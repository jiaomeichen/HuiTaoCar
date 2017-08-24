//
//  TuanGouViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/1.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "TuanGouViewController.h"
#import "TuanShopCell.h"
#import "LoginViewController.h"
@interface TuanGouViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tuanTableView;
@property(nonatomic,strong)TuanShopCell *cell;
@end

@implementation TuanGouViewController

#pragma mark--lazy
- (UITableView*)tuanTableView
{
    if (!_tuanTableView) {
        _tuanTableView  = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tuanTableView.delegate = self;
        _tuanTableView.dataSource = self;
        _tuanTableView.showsVerticalScrollIndicator = NO;
        _tuanTableView.tableFooterView=[[UIView alloc]init];
        if ([_tuanTableView respondsToSelector:@selector(setSeparatorInset:)])
        {
            [_tuanTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_tuanTableView respondsToSelector:@selector(setLayoutMargins:)])
        {
            [_tuanTableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
    }
    return _tuanTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"团购";
    
    [self.view addSubview:self.tuanTableView];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  0.143*ScreenHeight;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==3) {
        return 0;
    }else{
    
        return 12;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
    _cell=[tableView dequeueReusableCellWithIdentifier:@"string"];
   
    if (_cell==nil) {
        _cell=[[TuanShopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"string"];
       
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification) name:@"post" object:nil];
        
        if (indexPath.section==2) {
            
            [_cell setIsAppointmen:YES];
            
        }
        [_tuanTableView reloadData]; 
    }
    return _cell;

}

-(void)notification{

    LoginViewController *loginVC = [[LoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
    [self presentViewController:nav animated:YES completion:nil];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    YYLog(@"点击了团购的CELL");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
-(void)dealloc{
   
    //注销通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"post" object:nil];

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
