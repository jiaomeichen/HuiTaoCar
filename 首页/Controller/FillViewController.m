//
//  FillViewController.m
//  HuiTaoCar
//
//  Created by user on 16/9/5.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "FillViewController.h"
#import "MZCardCell.h"

@interface FillViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *fillTableView;
@property(nonatomic,strong)UITextField *nameFD;//名字
@property(nonatomic,strong)UITextField *numberFD;//电话
@property(nonatomic,strong)UITextField *cardFD;//验证码
@property(nonatomic,strong)UITextField *addressFD;//地址
@property(nonatomic,strong)UILabel *infoLabel;//颜色等
@property(nonatomic,strong)UIImageView *rightImage;//右箭头
@property(nonatomic,strong)UIView *payView;//底部支付
@property(nonatomic,strong)UILabel *payNumber;

@end

@implementation FillViewController

-(UITableView *)fillTableView{

    if (!_fillTableView) {
        _fillTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49) style:UITableViewStylePlain];
        _fillTableView.delegate=self;
        _fillTableView.dataSource=self;
        _fillTableView.backgroundColor=HWColor(240, 240, 240);
        
        if ([_fillTableView respondsToSelector:@selector(setSeparatorInset:)])
        {
            [_fillTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_fillTableView respondsToSelector:@selector(setLayoutMargins:)])
        {
            [_fillTableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return _fillTableView;
}

-(UIView *)payView{
   
    if (!_payView) {

        _payView=[[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
    }
    return _payView;
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.navigationItem.title=@"填写订单";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
    [self.navigationController.navigationBar setHidden:NO];
    self.navigationController.navigationBar.barTintColor=HWColor(242, 242, 242);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.fillTableView];
   
    self.fillTableView.tableFooterView=[[UIView alloc]init];
    //
    [self.view addSubview:self.payView];
    //
    [self setAddpayView];
    
    //通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)name:UIKeyboardWillHideNotification object:nil];

}
-(void)setAddpayView{
    
    //支付金额
    _payNumber=[[UILabel alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth*0.616, 49)];
    [self creatLabel:_payNumber setupColor:HWColor(234, 86, 62) setupUIFont:MyFontSize17 setupText:@"实付金额：￥86.42"];
    _payNumber.backgroundColor=[UIColor whiteColor];
    _payNumber.textAlignment=NSTextAlignmentCenter;
    [self.payView addSubview:_payNumber];

    //支付按钮
    UIButton *payBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.frame=CGRectMake(ScreenWidth-ScreenWidth*0.384, 0, ScreenWidth*0.384,49);
    payBtn.backgroundColor=HWColor(245, 50, 50);
    [payBtn setTitle:@"支付订单" forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.payView addSubview:payBtn];
    
    //黑线
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
    line.backgroundColor=HWColor(160, 160, 160);
    [self.payView addSubview:line];

}

//监听支付按钮
-(void)payBtnClick{

    [self showHUD:@"敬请期待。。。" view:self.view time:2];
}

#pragma mark-UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section==0) {
        return 2;
    }else if (section==1){
    
        return 1;
    }else {
    
        return 3;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0&&indexPath.row==0) {
       
        return 96;
    
    }else{
    
        return ScreenHeight*0.069;
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
    
    if (indexPath.section==0&&indexPath.row==0) {
        
        MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
        
        if (cell==nil) {
            cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
        }
        return cell;
   
    }else {
    
        NSArray *array=@[@[@"",@"外观颜色"],@[@"配送方式"],@[@"所属城市",@"所属地区",@"门店地址"],@[@"姓名",@"电话",@"验证码"]];
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"string"];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"string"];
                    }
        cell.textLabel.text=array[indexPath.section][indexPath.row];
        cell.textLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
        
        if ((indexPath.section==0&&indexPath.row==1)||indexPath.section==1||(indexPath.section==2&&!(indexPath.row==2))) {
            
            _rightImage=[[UIImageView alloc]initWithFrame:myRect(346,14, 19, 19)];
            _rightImage.image=[UIImage imageNamed:@"common_icon_arrow1_n"];
            [cell.contentView addSubview:_rightImage];
            
        }
        
        if (indexPath.section==0&&indexPath.row==1) {
           
            _infoLabel=[[UILabel alloc]initWithFrame:myRect(110, 10, 70, 30)];
            _infoLabel.textColor=[UIColor blackColor];
            _infoLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
            _infoLabel.text=@"黑色";
            [cell.contentView addSubview:_infoLabel];
          
        }else if(indexPath.section==1){
           
            _infoLabel=[[UILabel alloc]initWithFrame:myRect(110, 10, 70, 30)];
            _infoLabel.textColor=[UIColor blackColor];
            _infoLabel.text=@"快递寄送";
            _infoLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:_infoLabel];
            
        }else if(indexPath.section==2&&indexPath.row==0){
            
            _infoLabel=[[UILabel alloc]initWithFrame:myRect(110, 10, 70, 30)];
            _infoLabel.textColor=[UIColor blackColor];
            _infoLabel.text=@"天津";
            _infoLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:_infoLabel];
            
        }else if(indexPath.section==2&&indexPath.row==1){
            
            _infoLabel=[[UILabel alloc]initWithFrame:myRect(110, 10, 70, 30)];
            _infoLabel.textColor=[UIColor blackColor];
            _infoLabel.text=@"河东区";
            _infoLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:_infoLabel];
            
        }
        else if(indexPath.section==2&&indexPath.row==2) {
            //
            _addressFD=[[UITextField alloc]initWithFrame:myRect(110, 0, 375-100, 46)];
            _addressFD.placeholder=@"请填写详细的小区名称门牌号";
            _addressFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:_addressFD];
        
        }else if (indexPath.section==3&&indexPath.row==0){
            //
            _nameFD=[[UITextField alloc]initWithFrame:myRect(110, 0, 375-100, 46)];
            _nameFD.placeholder=@"请填写预约人姓名";
            _nameFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:_nameFD];
            
        }else if (indexPath.section==3&&indexPath.row==1){
            //
            _numberFD=[[UITextField alloc]initWithFrame:myRect(110, 0, 375-100, 46)];
            _numberFD.placeholder=@"请填写预约人电话";
            _numberFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:_numberFD];
            
        }else if (indexPath.section==3&&indexPath.row==2){
            //
            _cardFD=[[UITextField alloc]initWithFrame:myRect(110, 0,150, 46)];
            _cardFD.placeholder=@"请填写验证码";
            _cardFD.font=[UIFont systemFontOfSize:MyNavTitleSize];
            [cell.contentView addSubview:_cardFD];
           
            //按钮
            UIButton *cordBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            cordBtn.frame=myRect(236,3, 375*0.36,40);
            cordBtn.backgroundColor=HWColor(250,250,250);
            cordBtn.layer.cornerRadius=15;
            cordBtn.layer.borderWidth=1;
            cordBtn.titleLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
            cordBtn.layer.borderColor=[[UIColor redColor]CGColor ];
            [cordBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            [cordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [cordBtn addTarget:self action:@selector(getCordBtn) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:cordBtn];
            
            //分割线
            UIView *line1=[[UIView alloc]initWithFrame:myRect(232, 11, 1, 25)];
            line1.backgroundColor=[UIColor blackColor];
            [cell.contentView addSubview:line1];

        }
    
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{



}
-(void)getCordBtn{

    YYLog(@"验证码");

}
#pragma mark --键盘响应开始编辑
- (void)keyboardWillShow:(NSNotification *)notification
{
    // _textBackView.hidden=NO;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_3_2
    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
#else
    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey];
#endif
    
    CGRect keyboardBounds;
    [keyboardBoundsValue getValue:&keyboardBounds];
    // CGFloat keyboardHeight = CGRectGetHeight(keyboardBounds);
    //_dkeybordHeight=keyboardHeight;
    [UIView animateWithDuration:.3 animations:^{
        
        CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
        //        _containerView.frame=CGRectMake(0,KScreenHeight-45-(newSize.height-36), KScreenWidth,45+(newSize.height-36));
        //        smilBtn.frame=CGRectMake(KScreenWidth-28-10, 9, 28, 28);
        //
        //        _emojiKeyboardView.frame=CGRectMake(0, Main_Screen_Height, Main_Screen_Width, 198);
        self.view.frame = CGRectMake(0, -keyboardSize.height, self.view.frame.size.width, self.view.frame.size.height);
        
    } completion:^(BOOL finished) {
        
    }];
    // _textBackView.hidden=NO;
}

#pragma mark --键盘响应结束编辑
- (void)keyboardWillHide:(NSNotification *)notification{
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_3_2
    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
#else
    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey];
#endif
    
    CGRect keyboardBounds;
    [keyboardBoundsValue getValue:&keyboardBounds];
    // CGFloat keyboardHeight = CGRectGetHeight(keyboardBounds);
    //    _textBackView.hidden=YES;
    //    _tableView.frame=CGRectMake(0, 64, Main_Screen_Width, KScreenHeight-64-45-(newSize.height-36));
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
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
