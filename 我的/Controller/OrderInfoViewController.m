//
//  OrderInfoViewController.m
//  HuiTaoCar
//
//  Created by user on 16/10/8.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "OrderInfoViewController.h"
#import "MZCardCell.h"

@interface OrderInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *orderInfoTableView;

@end

@implementation OrderInfoViewController

-(UITableView *)orderInfoTableView{
   
    if (!_orderInfoTableView) {
      
        _orderInfoTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _orderInfoTableView.delegate=self;
        _orderInfoTableView.dataSource=self;
        
        
    }
    return _orderInfoTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor=HWColor(220, 220, 220);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    //隐藏自带的返回按钮
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"My-order_nav_icon_back_n"]style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
    self.navigationItem.title=@"订单详情";
    
    [self.view addSubview:self.orderInfoTableView];
}

#pragma mark-代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
    if (cell==nil) {
        cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
    }
    cell.addressimage.hidden=YES;
    cell.addressLabel.hidden=YES;
    cell.xiancheImage.hidden=YES;
    [cell setIsCount:YES];
    
    if (indexPath.row%2==0) {
        [cell.BtnTuan setTitle:@"装具" forState:UIControlStateNormal];
        cell.BtnTuan.backgroundColor=HWColor(38,151,175);
        cell.backView.backgroundColor=HWColor(38,151,175);
    
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 167;
    
}
-(void)backBtn{

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
