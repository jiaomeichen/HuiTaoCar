
//
//  OrderViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/29.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "OrderViewController.h"
#import "TiCarViewController.h"
#import "TCAddresSelectViewController.h"
#import "MZCardCell.h"
@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *orederTableView;
@property (nonatomic,strong)UIView *orederHerder;
@property (nonatomic,strong)UIView *orederFoot;

@end

@implementation OrderViewController

-(UITableView *)orederTableView{

    if (!_orederTableView) {
        _orederTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _orederTableView.delegate=self;
        _orederTableView.dataSource=self;
        _orederTableView.backgroundColor=HWColor(240, 240, 240);
    }
    
    if ([_orederTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_orederTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_orederTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_orederTableView setLayoutMargins:UIEdgeInsetsZero];
    }

    return _orederTableView;
}
-(UIView *)orederHerder{

    if (!_orederHerder) {
        _orederHerder=[[UIView alloc]initWithFrame:myRect(0, 0, 375, 70)];
        _orederHerder.backgroundColor=[UIColor whiteColor];
        //绘制标题头
        [self setHeaderView];
    }
    return _orederHerder;
}
-(UIView *)orederFoot{
    
    if (!_orederFoot) {
        _orederFoot=[[UIView alloc]initWithFrame:CGRectMake(0, 1, ScreenWidth, 200)];
        UIButton *tijiaoBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        tijiaoBtn.frame=myRect(60, 30, 256, 45);
        tijiaoBtn.backgroundColor=HWColor(234, 86, 62);
        [tijiaoBtn setTitle:@"提交" forState:UIControlStateNormal];
        [tijiaoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tijiaoBtn addTarget:self action:@selector(tijiaoButton) forControlEvents:UIControlEventTouchUpInside];
        [self.orederFoot addSubview:tijiaoBtn];
        
    }
    return _orederFoot;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title=@"预约下单";
    self.navigationController.navigationBar.barTintColor=HWColor(234, 86, 63);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];

}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self.view addSubview:self.orederTableView];
    self.orederTableView.tableHeaderView=self.orederHerder;
    self.orederTableView.tableFooterView=self.orederFoot;
    
}

-(void)setHeaderView{

    UIImageView *headImage=[[UIImageView alloc]initWithFrame:myRect(15, 15, 19, 19)];
    headImage.image=[UIImage imageNamed:@"Booking-order_icon_people"];
    [_orederHerder addSubview:headImage];
    //
    UILabel *titleLbel=[[UILabel alloc]initWithFrame:myRect(47, 18, 70, 12)];
    [self creatLabel:titleLbel setupColor:HWColor(102, 102, 102) setupUIFont:MyFontSize14 setupText:@"预约联系人"];
    [_orederHerder addSubview:titleLbel];
    //
    UILabel *titleLbel2=[[UILabel alloc]initWithFrame:myRect(47, 41, 61, 12)];
    [self creatLabel:titleLbel2 setupColor:HWColor(51, 51, 51) setupUIFont:MyNavTitleSize setupText:@"开利星空"];
    [_orederHerder addSubview:titleLbel2];
    //
    UILabel *titleLbel3=[[UILabel alloc]initWithFrame:myRect(120, 43,100, 12)];
    [self creatLabel:titleLbel3 setupColor:HWColor(51, 51, 51) setupUIFont:MyNavTitleSize setupText:@"1523499890"];
    [_orederHerder addSubview:titleLbel3];
    //
    UIView *line=[[UIView alloc]initWithFrame:myRect(0, 69, 375, 1)];
    line.backgroundColor=HWColor(234, 86, 62);
    [_orederHerder addSubview:line];

}

#pragma 代理

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
    return 2;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section==0&&indexPath.row==0){
    
        return 95;
   
    }else{
    
        return 46;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section==0&&indexPath.row==0) {
        
        MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"order"];
        
        if (cell==nil) {
            
            cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"order"];
            cell.colorLabel.hidden=YES;
            cell.addressLabel.hidden=YES;
            cell.addressimage.hidden=YES;
            cell.xiancheImage.hidden=YES;
            
        }
        
        return cell;
        
    }

     NSArray *titlabel=@[@[@"",@"外观颜色"],@[@"上牌城市",@"提车地点"]];
        
     UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
    
        if (cell==nil) {
            
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
   
            UILabel *titleLbel4=[[UILabel alloc]initWithFrame:myRect(15,17, 60, 13)];
            titleLbel4.text=titlabel[indexPath.section][indexPath.row];
            titleLbel4.textColor=HWColor(50, 50, 50);
            titleLbel4.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:titleLbel4];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
        if (indexPath.section==0&&indexPath.row==1) {
            
            UITextField *colorFD=[[UITextField alloc]initWithFrame:myRect(101, 0,  275,46)];
            colorFD.placeholder=@"请输入颜色要求";
            colorFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:colorFD];

            
        }else if (indexPath.section==1&&indexPath.row==0){
        
            UILabel *cityLabel=[[UILabel alloc]initWithFrame:myRect(101,0,275,46)];
            cityLabel.text=@"天津";
            cityLabel.textColor=HWColor(50, 50, 50);
            cityLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:cityLabel];

        }else{
        
            UILabel *addressLB=[[UILabel alloc]initWithFrame:myRect(101,0,275,46)];
            addressLB.text=@"选择题车地点";
            addressLB.textColor=HWColor(200, 200, 200);
            addressLB.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:addressLB];
        
        }
    
        return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section==0) {
        
        return 0;
        
    }else{
    
        return 10;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section==1&&indexPath.row==0) {
       
        TCAddresSelectViewController *tcadd=[[TCAddresSelectViewController alloc]init];
        [self.navigationController pushViewController:tcadd animated:YES];
   
    }else if (indexPath.section==1&&indexPath.row==1){
        
        TiCarViewController *tiCar=[[TiCarViewController alloc]init];
        [self.navigationController pushViewController:tiCar animated:YES];
    
    }
    
}

-(void)tijiaoButton{

    YYLog(@"提交");

    [self showHUD:@"提交订单" view:self.orederTableView time:3];
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
