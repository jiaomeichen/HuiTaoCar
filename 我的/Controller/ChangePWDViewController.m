//
//  ChangePWDViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/17.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ChangePWDViewController.h"

@interface ChangePWDViewController ()
{
    UIButton *yanBtn;
}
@property(nonatomic,strong)UILabel *addressLabel;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger count;

//@property(nonatomic,strong)
@end

@implementation ChangePWDViewController
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
    self.navigationItem.title=@"修改密码";
    self.navigationController.navigationBar.barTintColor=HWColor(242, 242, 242);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:HWColor(40, 40, 40)}];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
  
    //
    [self createChangePWDUI];
}

-(void)createChangePWDUI{
    
    _addressLabel=[[UILabel alloc]initWithFrame:myRect(15, 83, 375, 14)];
    _addressLabel.textColor=[UIColor blackColor];
    _addressLabel.text=@"国家地区                                          中国大陆 +86";
    _addressLabel.font=[UIFont systemFontOfSize:MyFontSize14];
    _addressLabel.textColor=HWColor(40, 40, 40);
    [self.view addSubview:_addressLabel];
    
    UIView *line1=[[UIView alloc]initWithFrame:myRect(0, 109, 375, 1)];
    line1.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line1];
    
    UITextField *phoneFT=[[UITextField alloc]initWithFrame:myRect(90, 110, 275, 45)];
    phoneFT.placeholder=@"请输入手机号";
    phoneFT.keyboardType=UIKeyboardTypePhonePad;
    phoneFT.font=[UIFont systemFontOfSize:MyFontSize13];
    [self.view addSubview:phoneFT];
    
    UILabel *phoneLabel=[[UILabel alloc]initWithFrame:myRect(15,124, 47, 14)];
    phoneLabel.text=@"手机号:";
    phoneLabel.font=[UIFont systemFontOfSize:MyFontSize14];
    phoneLabel.textColor=HWColor(40, 40, 40);
    [self.view addSubview:phoneLabel];
    
    UIView *line2=[[UIView alloc]initWithFrame:myRect(0, 152, 375, 1)];
    line2.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line2];
    
    UILabel *yanLabel=[[UILabel alloc]initWithFrame:myRect(15,169, 47, 14)];
    yanLabel.text=@"验证码:";
    yanLabel.font=[UIFont systemFontOfSize:MyFontSize14];
    yanLabel.textColor=HWColor(40, 40, 40);
    [self.view addSubview:yanLabel];
    
    
    UITextField *yanFT=[[UITextField alloc]initWithFrame:myRect(90, 155, 275, 45)];
    yanFT.placeholder=@"请输入验证码";
    yanFT.font=[UIFont systemFontOfSize:MyFontSize13];
    [self.view addSubview:yanFT];
    
    UIView *line3=[[UIView alloc]initWithFrame:myRect(232,164,1, 25)];
    line3.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line3];
    
    UIView *line4=[[UIView alloc]initWithFrame:myRect(0,197,375,1)];
    line4.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line4];
    
    [self getyan];
    
    UILabel *passLabel=[[UILabel alloc]initWithFrame:myRect(15,210, 47, 14)];
    passLabel.text=@"新密码:";
    passLabel.font=[UIFont systemFontOfSize:MyFontSize14];
    passLabel.textColor=HWColor(40, 40, 40);
    [self.view addSubview:passLabel];
    
    
    UITextField *passFT=[[UITextField alloc]initWithFrame:myRect(90, 195, 275, 45)];
    passFT.placeholder=@"请输入密码";
    passFT.font=[UIFont systemFontOfSize:MyFontSize13];
    [self.view addSubview:passFT];
    
    
    UIView *line5=[[UIView alloc]initWithFrame:myRect(0,241,375,12)];
    line5.backgroundColor=HWColor(225, 225, 225);
    [self.view addSubview:line5];
    
    
    UIButton *baocunBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    baocunBtn.frame=myRect(60, 300, 256, 45);
    [baocunBtn setTitle:@"注册" forState:UIControlStateNormal];
    [baocunBtn setTintColor:HWColor(248, 87, 61)];
    [baocunBtn addTarget:self action:@selector(baocunBtn) forControlEvents:UIControlEventTouchUpInside];
    [baocunBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    baocunBtn.backgroundColor=HWColor(248, 87, 61);
    
    [self.view addSubview:baocunBtn];
    
}

-(void)getyan{
    
    yanBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    yanBtn.frame=myRect(250, 160, 99, 30);
    [yanBtn setTitle:@"发送短信验证码" forState:UIControlStateNormal];
    yanBtn.titleLabel.font=[UIFont systemFontOfSize:MyFontSize13];
    [yanBtn addTarget:self action:@selector(getcodeBtn) forControlEvents:UIControlEventTouchUpInside];
    [yanBtn setTitleColor:HWColor(248, 87, 61) forState:UIControlStateNormal];
    [self.view addSubview:yanBtn];
    
}


- (void)releaseNum
{
    
    if (self.count == 0) {
        [self.timer invalidate];
        self.timer = nil;
        yanBtn.enabled = YES;
        [yanBtn setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        
        return;
    }else
    {
        self.count --;
        yanBtn.enabled = NO;
        [yanBtn setTitle:[NSString stringWithFormat:@"%ld秒",(long)self.count] forState:UIControlStateNormal];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
