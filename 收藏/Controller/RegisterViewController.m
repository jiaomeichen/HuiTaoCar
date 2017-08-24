//
//  RegisterViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/16.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "RegisterViewController.h"
#import "MBProgressHUD.h"
//#import "AFNetworking.h"

@interface RegisterViewController ()
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger count;
@property (nonatomic,strong) UIButton *yanBtn;
@property (nonatomic,strong) UITextField *phoneFT;
@property (nonatomic,strong) UITextField *yanFT;
@property (nonatomic,strong) UITextField *passFT;

//
@property (strong, nonatomic) AFHTTPSessionManager *manager;
@property (strong, nonatomic) AFHTTPRequestSerializer *smanager;

@end

@implementation RegisterViewController
#pragma mark - lazy

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(releaseNum) userInfo:nil repeats:YES];
    }
    return _timer;
}
//- (AFHTTPRequestSerializer *)smanager
//{
//    if (!_smanager) {
//        _smanager = [AFHTTPRequestSerializer serializer];
//    }
//    return _smanager;
//}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"注册";
    self.navigationController.navigationBar.barTintColor=HWColor(242, 242, 242);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:HWColor(40, 40, 40)}];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
    //    验证码刷新时间
    
    self.count=60;
    [self createUI];
}
-(void)createUI{
    
    
    UILabel *addressLabel=[[UILabel alloc]initWithFrame:myRect(15, 80, 375,14)];
    [self creatLabel:addressLabel setupColor:HWColor(40, 40, 40) setupUIFont:MyNavTitleSize setupText:@"国家地区                                       中国大陆 +86"];
    [self.view addSubview:addressLabel];
    //
    UIView *line1=[[UIView alloc]initWithFrame:myRect(0, 109, 375, 0.7)];
    line1.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line1];
    //
    _phoneFT=[[UITextField alloc]initWithFrame:myRect(90, 110, 275, 45)];
    _phoneFT.placeholder=@"请输入手机号";
    _phoneFT.clearButtonMode = UITextFieldViewModeAlways;
    _phoneFT.keyboardType=UIKeyboardTypePhonePad;
    _phoneFT.font=[UIFont systemFontOfSize:MyNavTitleSize];
    [self.view addSubview:_phoneFT];
    //
    UILabel *phoneLabel=[[UILabel alloc]initWithFrame:myRect(15,124, 47, 14)];
    [self creatLabel:phoneLabel setupColor:HWColor(40, 40, 40) setupUIFont:MyNavTitleSize setupText:@"手机号"];
    [self.view addSubview:phoneLabel];
    //
    UIView *line2=[[UIView alloc]initWithFrame:myRect(0, 152, 375, 0.7)];
    line2.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line2];
    //
    UILabel *yanLabel=[[UILabel alloc]initWithFrame:myRect(15,169, 47, 14)];
    [self creatLabel:yanLabel setupColor:HWColor(40, 40, 40) setupUIFont:MyNavTitleSize setupText:@"验证码"];
    [self.view addSubview:yanLabel];
    //
    _yanFT=[[UITextField alloc]initWithFrame:myRect(90, 155, 275, 45)];
    _yanFT.placeholder=@"请输入验证码";
    _yanFT.font=[UIFont systemFontOfSize:MyNavTitleSize];
    [self.view addSubview:_yanFT];
    //
    UIView *line3=[[UIView alloc]initWithFrame:myRect(232,164,0.7, 25)];
    line3.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line3];
    //
    UIView *line4=[[UIView alloc]initWithFrame:myRect(0,197,375,0.7)];
    line4.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line4];
    
    //
    [self getyan];
    
    //
    UILabel *passLabel=[[UILabel alloc]initWithFrame:myRect(15,210, 47, 14)];
    passLabel.text=@"密码:";
    passLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
    passLabel.textColor=HWColor(40, 40, 40);
    [self.view addSubview:passLabel];
    //
    _passFT=[[UITextField alloc]initWithFrame:myRect(90, 195, 275, 45)];
    _passFT.placeholder=@"请输入密码";
    _passFT.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passFT.font=[UIFont systemFontOfSize:MyNavTitleSize];
    [self.view addSubview:_passFT];
    //
    UIView *line5=[[UIView alloc]initWithFrame:myRect(0,241,375,12)];
    line5.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line5];
    //
    UIButton *registBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    registBtn.frame=myRect(60, 281, 256, 45);
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registBtn setTintColor:HWColor(248, 87, 61)];
    [registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(registBtn) forControlEvents:UIControlEventTouchUpInside];
    registBtn.backgroundColor=HWColor(248, 87, 61);
    [self.view addSubview:registBtn];
    
}

-(void)getyan{
    
    _yanBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _yanBtn.frame=myRect(250, 160, 105, 30);
    [_yanBtn setTitle:@"发送短信验证码" forState:UIControlStateNormal];
    _yanBtn.titleLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
    [_yanBtn addTarget:self action:@selector(getcodeBtnRegin) forControlEvents:UIControlEventTouchUpInside];
    [_yanBtn setTitleColor:HWColor(248, 87, 61) forState:UIControlStateNormal];
    [_yanBtn setTitleColor:HWColor(200, 200,200) forState:UIControlStateHighlighted];
    [self.view addSubview:_yanBtn];
   
}
- (void)releaseNum
{
    
    if (self.count == 0) {
        [self.timer invalidate];
        self.timer = nil;
        self.yanBtn.enabled = YES;
        [self.yanBtn setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        
        return;
    }else
    {
        self.count --;
        self.yanBtn.enabled = NO;
        [self.yanBtn setTitle:[NSString stringWithFormat:@"%ld秒",(long)self.count] forState:UIControlStateNormal];
    }
}

-(void)getcodeBtnRegin{
   
    self.count=60;
    
    if ([_phoneFT.text isEqualToString:@""]) {
       
        [SVProgressHUD showErrorWithStatus:@"手机号不能为空"];

    }else if (_phoneFT.text.length!=11 &&![self validateNumber:_phoneFT.text]){
    
        [SVProgressHUD showErrorWithStatus:@"手机号格式不正确"];
    
    }else{
    
        if ([self validateNumber:_phoneFT.text]) {
        
            self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
       
        [self.manager POST:URL_Yan parameters:@{@"phone":_phoneFT.text,@"type":@"0"} progress:^(NSProgress * _Nonnull downloadProgress) {
               
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            [SVProgressHUD showSuccessWithStatus:@"已发送"];
            
            //定时器
            [self.timer fire];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
             YYLog(@"验证码失败==%@",error);
           
            [SVProgressHUD showErrorWithStatus:@"请稍后再试"];
        }];
      
        }
     
    }
    
}


-(void)registBtn{
    
    YYLog(@"注册");
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
   
    NSString *passMD=[MD5Encryption md5:_passFT.text];  //获取userDefault单例
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([_yanFT.text isEqualToString:[userDefaults objectForKey:user_code]]) {
        
        
    }
    [self.manager POST:URL_Register parameters:@{@"phone":_phoneFT.text,@"type":@"0",@"code":_yanFT.text,@"passward":passMD} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        YYLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        YYLog(@"%@",error);
        //[self showHUD:@"请稍后再试" view:self.view time:1.5];
        [SVProgressHUD showWithStatus:@"请稍后再试"];
    }];
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [_phoneFT resignFirstResponder];
    [_passFT resignFirstResponder];
    [_yanFT resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)validateNumber:(NSString *) textString
{
    NSString* number=@"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:textString];
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
