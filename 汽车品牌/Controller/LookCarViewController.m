//
//  LookCarViewController.m
//  HuiTaoCar
//  预约看车
//  Created by user on 16/7/28.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "LookCarViewController.h"
#import "TCAddresSelectViewController.h"
#import "MZCardCell.h"
#import "YuYueCell.h"

@interface LookCarViewController ()<UITableViewDelegate,UITableViewDataSource,TCAddresSelectViewControllerDelegate>

@property(nonatomic,strong)UITableView *lookcarTableView;
@property(nonatomic,strong)UIButton *cityBtn;
@property(nonatomic,strong)UILabel *cityLabel;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *lookFootView;

@end

@implementation LookCarViewController

-(UITableView *)lookcarTableView{

    if (!_lookcarTableView) {
        //初始化tableView
        _lookcarTableView=[[UITableView alloc]initWithFrame:myRect(0, 0, 375, 667) style:UITableViewStylePlain];
        _lookcarTableView.delegate=self;
        _lookcarTableView.dataSource=self;
        _lookcarTableView.backgroundColor=HWColor(240, 240, 240);
        //去掉下面多余的线
        _lookcarTableView.tableFooterView = [[UIView alloc] init];
    }
    if ([_lookcarTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_lookcarTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_lookcarTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_lookcarTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    return _lookcarTableView;
    
}
-(UIView *)lookFootView{
    
    if (!_lookFootView) {
        _lookFootView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
        _lookFootView.backgroundColor=HWColor(240, 240, 240);
        
        UIButton *Btn=[UIButton buttonWithType:UIButtonTypeCustom];
        Btn.frame=myRect(60, 30, 256, 45);
        Btn.backgroundColor=HWColor(234, 86, 62);
        [Btn setTitle:@"提交" forState:UIControlStateNormal];
        [Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [Btn addTarget:self action:@selector(Button) forControlEvents:UIControlEventTouchUpInside];
        [_lookFootView addSubview:Btn];
        
        
    }
    return _lookFootView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"预约看车";
    [self.view addSubview:self.lookcarTableView];
    self.lookcarTableView.tableFooterView=self.lookFootView;
    
    [self setlookcarUI];
   
    //通知
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)name:UIKeyboardWillHideNotification object:nil];

}

-(void)setlookcarUI{



}

#pragma mark--<UITableViewDelegate>代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section==0) {
        return 2;
    }else if (section==1){
    
        return 1;
    }else{
    
        return 3;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0&&indexPath.row==0) {
        
        MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
        if (cell==nil) {
            cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"iden"];
        }
        return cell;
    
    }
    
    YuYueCell *cell=[tableView dequeueReusableCellWithIdentifier:@"look"];
    if (cell==nil) {
        cell=[[YuYueCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"look"];
        //取消点击效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.section==0&&indexPath.row==1) {
            
            cell.titleLable.text=@"外观颜色";
            
        }else if (indexPath.section==1){
        
            cell.titleLable.text=@"上牌城市";
            cell.textTF.hidden=YES;
            //
            _cityLabel=[[UILabel alloc]initWithFrame:myRect(101, 7, 100, 30)];
            [self creatLabel:_cityLabel setupColor:HWColor(51, 51, 51) setupUIFont:MyNavTitleSize setupText:@"天津"];
            [cell.contentView addSubview:_cityLabel];
            
        }else if (indexPath.section==2&&indexPath.row==0){
            
            cell.titleLable.text=@"预约人";
            cell.textTF.placeholder=@"请填写预约人姓名";
            
        }else if (indexPath.section==2&&indexPath.row==1){
           
            cell.titleLable.text=@"预约人电话";
            cell.textTF.placeholder=@"请填写预约人的联系电话";

        }else {
           
            cell.titleLable.text=@"验证码";
            cell.textTF.placeholder=@"请填写验证码";
            cell.textTF.frame=myRect(101, 10, 247, 30);
           
            UIView *line=[[UIView alloc]initWithFrame:myRect(231, 11, 1, 25)];
            line.backgroundColor=HWColor(153, 153, 153);
            [cell.contentView addSubview:line];
        
            UIButton *getBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            getBtn.frame=myRect(250, 7, 99, 30);
            [getBtn setTitle:@"发送短信验证码" forState:UIControlStateNormal];
            getBtn.titleLabel.font=[UIFont systemFontOfSize:MyFontSize13];
            [getBtn addTarget:self action:@selector(getyanBtn) forControlEvents:UIControlEventTouchUpInside];
            [getBtn setTitleColor:HWColor(248, 87, 61) forState:UIControlStateNormal];
           
            [cell.contentView addSubview:getBtn];
        
        }
    
    }

    return cell;
}

-(void)xuanBtn{

    YYLog(@"选择城市");

}

//反向传值
- (void)TCAddresSelectViewControllerDidSelectTitle:(NSString *)title
{
   // [self.cityLabel setTitle:title forState:UIControlStateNormal];
    self.cityLabel.text=title;
}

//短信验证码接口
-(void)getyanBtn{
    
    
    YYLog(@"yangzhengma");
    
}
-(void)Button{
    
    YYLog(@".....");

}
#pragma mark--UITableView的代理方法

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0&&indexPath.row==0) {
       
        return 0.143*ScreenHeight;
        
    }
    return 46;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 12;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==1) {
        TCAddresSelectViewController *address=[[TCAddresSelectViewController alloc]init];
         address.delegate = self;
        [self.navigationController pushViewController:address animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//#pragma mark --键盘响应开始编辑
//- (void)keyboardWillShow:(NSNotification *)notification
//{
//    // _textBackView.hidden=NO;
//#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_3_2
//    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
//#else
//    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey];
//#endif
//    
//    CGRect keyboardBounds;
//    [keyboardBoundsValue getValue:&keyboardBounds];
//    // CGFloat keyboardHeight = CGRectGetHeight(keyboardBounds);
//    //_dkeybordHeight=keyboardHeight;
//    [UIView animateWithDuration:.3 animations:^{
//        
//        CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
//        self.view.frame = CGRectMake(0, -keyboardSize.height, self.view.frame.size.width, self.view.frame.size.height);
//        
//    } completion:^(BOOL finished) {
//        
//    }];
//    // _textBackView.hidden=NO;
//}
//
//#pragma mark --键盘响应结束编辑
//- (void)keyboardWillHide:(NSNotification *)notification{
//#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_3_2
//    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
//#else
//    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey];
//#endif
//    
//    CGRect keyboardBounds;
//    [keyboardBoundsValue getValue:&keyboardBounds];
//    // CGFloat keyboardHeight = CGRectGetHeight(keyboardBounds);
//    //    _textBackView.hidden=YES;
//    //    _tableView.frame=CGRectMake(0, 64, Main_Screen_Width, KScreenHeight-64-45-(newSize.height-36));
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    } completion:^(BOOL finished) {
//        
//    }];
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
