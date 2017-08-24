//
//  ForgetViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/16.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ForgetViewController.h"
#import "RegisterViewController.h"
@interface ForgetViewController ()
{
    UIButton *yanBtn;

}
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger count;
@property (nonatomic, strong) UITextField *phoneFT;
@property (nonatomic, strong) UITextField *yanFT;
@property (nonatomic, strong) UITextField *passFT;
@end

@implementation ForgetViewController

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(releaseNum) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"找回密码";
    self.navigationController.navigationBar.barTintColor=HWColor(242, 242, 242);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:HWColor(40, 40, 40)}];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
    
    [self createUI];
}
-(void)createUI{
    
    
    UILabel *addressLabel=[[UILabel alloc]initWithFrame:myRect(15, 80, 375, 14)];
    addressLabel.textColor=[UIColor blackColor];
    addressLabel.text=@"国家地区                                       中国大陆 +86";
    addressLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
    addressLabel.textColor=HWColor(40, 40, 40);
    [self.view addSubview:addressLabel];
    
    
    UIView *line1=[[UIView alloc]initWithFrame:myRect(0, 109, 375, 0.7)];
    line1.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line1];
    
    
    _phoneFT=[[UITextField alloc]initWithFrame:myRect(90, 110, 275, 45)];
    _phoneFT.placeholder=@"请输入手机号";
    _phoneFT.font=[UIFont systemFontOfSize:MyNavTitleSize];
    [self.view addSubview:_phoneFT];
    
    UILabel *phoneLabel=[[UILabel alloc]initWithFrame:myRect(15,124, 60, 14)];
    phoneLabel.text=@"手机号:";
    phoneLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
    _phoneFT.keyboardType=UIKeyboardTypePhonePad;
    phoneLabel.textColor=HWColor(40, 40, 40);
    [self.view addSubview:phoneLabel];
    
    UIView *line2=[[UIView alloc]initWithFrame:myRect(0, 152, 375, 0.7)];
    line2.backgroundColor=HWColor(220, 220, 220);
    [self.view addSubview:line2];
    
    UILabel *yanLabel=[[UILabel alloc]initWithFrame:myRect(15,169, 60, 14)];
    yanLabel.text=@"验证码:";
    yanLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
    yanLabel.textColor=HWColor(40, 40, 40);
    [self.view addSubview:yanLabel];
    
    
    _yanFT=[[UITextField alloc]initWithFrame:myRect(90, 155, 275, 45)];
    _yanFT.placeholder=@"请输入验证码";
    _yanFT.font=[UIFont systemFontOfSize:MyNavTitleSize];
    [self.view addSubview:_yanFT];
    
    UIView *line3=[[UIView alloc]initWithFrame:myRect(232,164,0.7, 25)];
    line3.backgroundColor=HWColor(220, 220, 220);
    [self.view addSubview:line3];
    
    UIView *line4=[[UIView alloc]initWithFrame:myRect(0,197,375,0.7)];
    line4.backgroundColor=HWColor(220, 220, 220);
    [self.view addSubview:line4];
    
    [self getyan];
    
    UILabel *passLabel=[[UILabel alloc]initWithFrame:myRect(15,210, 60, 14)];
    passLabel.text=@"新密码:";
    passLabel.font=[UIFont systemFontOfSize:MyNavTitleSize];
    passLabel.textColor=HWColor(40, 40, 40);
    [self.view addSubview:passLabel];
    
    
    _passFT=[[UITextField alloc]initWithFrame:myRect(90, 195, 275, 45)];
    _passFT.placeholder=@"请输入密码";
    _passFT.font=[UIFont systemFontOfSize:MyNavTitleSize];
    [self.view addSubview:_passFT];
    
    
    UIView *line5=[[UIView alloc]initWithFrame:myRect(0,241,375,12)];
    line5.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line5];
    
    
    UIButton *baocunBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    baocunBtn.frame=myRect(60, 281, 256, 45);
    [baocunBtn setTitle:@"注册" forState:UIControlStateNormal];
    [baocunBtn setTintColor:HWColor(248, 87, 61)];
    [baocunBtn addTarget:self action:@selector(baocunBtn) forControlEvents:UIControlEventTouchUpInside];
    [baocunBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    baocunBtn.backgroundColor=HWColor(248, 87, 61);
    
    [self.view addSubview:baocunBtn];
    
    [self zhuce];
    
    
}

-(void)getyan{
    
    yanBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    yanBtn.frame=myRect(250, 160, 99, 30);
    [yanBtn setTitle:@"发送短信验证码" forState:UIControlStateNormal];
    yanBtn.titleLabel.font=[UIFont systemFontOfSize:MyFontSize13];
    [yanBtn addTarget:self action:@selector(getcodeBtn) forControlEvents:UIControlEventTouchUpInside];
    [yanBtn setTitleColor:HWColor(248, 87, 61) forState:UIControlStateNormal];
    [self.view addSubview:yanBtn];
    
    //yanBtn.backgroundColor=HWColor(248, 87, 61);
    
}
- (void)releaseNum
{
    
    if (self.count == 0) {
        [self.timer invalidate];
        self.timer = nil;
        yanBtn.enabled = YES;
        [yanBtn setTitleColor:HWColor(234, 86, 62) forState:UIControlStateNormal];
        [yanBtn setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        
        return;
    }else
    {
        self.count --;
        yanBtn.enabled = NO;
        [yanBtn setTitleColor:HWColor(220, 220, 220) forState:UIControlStateNormal];
        [yanBtn setTitle:[NSString stringWithFormat:@"%ld秒",(long)self.count] forState:UIControlStateNormal];
    }
}


-(void)zhuce{
    
    
    UIButton *zhuceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    zhuceBtn.frame=myRect(135, 366, 105, 15);
    [zhuceBtn setTitle:@"没有账号？立即注册" forState:UIControlStateNormal];
    zhuceBtn.titleLabel.font=[UIFont systemFontOfSize:MYFontSize11];
    [zhuceBtn addTarget:self action:@selector(zhucehaoBtn) forControlEvents:UIControlEventTouchUpInside];
    [zhuceBtn setTitleColor:HWColor(248, 87, 61) forState:UIControlStateNormal];
    [self.view addSubview:zhuceBtn];
    
}

-(void)zhucehaoBtn{
    
    RegisterViewController *reguster=[[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:reguster animated:YES];
    
    
}


-(void)getcodeBtn{
    self.count=60;
    [self.timer fire];
    YYLog(@"验证码");
    
}
-(void)baocunBtn{
    
    YYLog(@"保存");
    
    
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_phoneFT resignFirstResponder];
    [_passFT resignFirstResponder];
    [_yanFT resignFirstResponder];
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
