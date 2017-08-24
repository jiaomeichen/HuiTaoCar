//
//  LoginViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/16.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden=NO;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat heightMargin = ScreenHeight *0.30;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(ScreenWidth, 400+heightMargin);
    [self.view addSubview:scrollView];
    
    UIImageView *logoImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Hui-taocar.com500x500"]];
    logoImg.frame = myRect(92, 60, 191,140);
    logoImg.layer.cornerRadius = 7;
    logoImg.clipsToBounds = YES;
    [scrollView addSubview:logoImg];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancelBtn setImage:[UIImage imageNamed:@"购物车-删除按钮.png"] forState:UIControlStateNormal];
    [cancelBtn setFrame:myRect(30, 40, 56, 65)];
    [cancelBtn setTintColor:[UIColor grayColor]];
    [cancelBtn addTarget:self action:@selector(passLogin:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:cancelBtn];
    
    
    self.userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(40, heightMargin, ScreenWidth-80, 35)];
    UIImageView *userNameImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_icon_people_pre"]];
    _userNameTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@" 请输入手机号" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    //_userNameTF.clearButtonMode = UITextFieldViewModeAlways;
    _userNameTF.keyboardType = UIKeyboardTypeNumberPad;
    userNameImg.contentMode = UIViewContentModeCenter;
    
    _userNameTF.leftView = userNameImg;
    _userNameTF.leftViewMode = UITextFieldViewModeAlways;
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 44)];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *comfirmBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(keyboardDismiss:)];
    toolBar.items = @[flexSpace,comfirmBtn];
    _userNameTF.inputAccessoryView = toolBar;
    _userNameTF.delegate = self;
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 34, 375-80, 1)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self.userNameTF addSubview:line1];
    [scrollView addSubview:_userNameTF];
    

    self.passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(40, heightMargin+45, ScreenWidth-80, 35)];
    self.passwordTF.secureTextEntry = YES;
    _passwordTF.inputAccessoryView = toolBar;
    UIImageView *passwordImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_icon_Password_pre"]];
    _passwordTF.leftView = passwordImg;
    _passwordTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@" 请输入密码" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    //_passwordTF.clearButtonMode = UITextFieldViewModeAlways;
    _passwordTF.leftViewMode = UITextFieldViewModeAlways;
    _passwordTF.delegate = self;
  
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, 34, 295, 0.7)];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.passwordTF addSubview:line2];
    [scrollView addSubview:_passwordTF];
    
    self.passwordTF.text = @"123456";
    self.userNameTF.text = @"15135610808";
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setFrame:CGRectMake(40, heightMargin+120, ScreenWidth-80, 45)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 22.5;
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[self createImageWithColor:HWColor(234, 86, 100)] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtn) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundImage:[self createImageWithColor:HWColor(183, 31, 48)] forState:UIControlStateHighlighted];
    loginBtn.clipsToBounds = YES;
    [scrollView addSubview:loginBtn];
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setFrame:CGRectMake(40, heightMargin+180, ScreenWidth-80, 45)];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    registBtn.layer.cornerRadius = 22.5;
    registBtn.layer.borderColor = HWColor(234, 86, 100).CGColor;
    registBtn.layer.borderWidth = 1;
    [registBtn setTitleColor:HWColor(150, 150, 150) forState:UIControlStateNormal];
    [registBtn setBackgroundImage:[self createImageWithColor:HWColor(243, 243, 243)] forState:UIControlStateHighlighted];
    registBtn.clipsToBounds = YES;
    [registBtn addTarget:self action:@selector(intoRegist:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:registBtn];
    
    UIButton *forgetPasswordBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [forgetPasswordBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [forgetPasswordBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [forgetPasswordBtn addTarget:self action:@selector(forgetPassEvEnt:) forControlEvents:UIControlEventTouchUpInside];
    [forgetPasswordBtn setFrame:CGRectMake(ScreenWidth-100, heightMargin+240, 70, 13)];
    [scrollView addSubview:forgetPasswordBtn];
    
    //快速登录分割线
//    UILabel *quickLoginLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, heightMargin+280, ScreenWidth, 15)];
//    quickLoginLabel.text = @"———————— 快速登录 ————————";
//    quickLoginLabel.textAlignment = NSTextAlignmentCenter;
//    quickLoginLabel.font = [UIFont systemFontOfSize:14.0f];
//    quickLoginLabel.textColor = [UIColor lightGrayColor];
//    [scrollView addSubview:quickLoginLabel];
    
    UIButton *wechatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [wechatBtn setImage:[UIImage imageNamed:@"微信.png"] forState:UIControlStateNormal];
    [wechatBtn setFrame:CGRectMake(ScreenWidth/2-66, heightMargin+320, 50, 50)];
  //  [wechatBtn addTarget:self action:@selector(loginWinxin:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:wechatBtn];
    
    UIButton *qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [qqBtn setImage:[UIImage imageNamed:@"qq.png"] forState:UIControlStateNormal];
    [qqBtn setFrame:CGRectMake(ScreenWidth/2+16, heightMargin+320, 50, 50)];
   // [qqBtn addTarget:self action:@selector(loginQQ:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:qqBtn];
    
    
    //获取密钥
    //    [self getDesKey];

}

//限制手机号位数11位
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.userNameTF) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 11) {
            
            return NO;
        
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGFloat offset = self.view.frame.size.height - (textField.frame.origin.y + textField.frame.size.height + 216 +50);
    if (offset <= 0) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = offset;
            self.view.frame = frame;
        }];
    }
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        self.view.frame = frame;
    }];
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)showHUD:(NSString *)title view:(UIView *)view time:(NSInteger)time{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = title;
    hud.label.textColor=HWColor(234, 86, 62);
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:time];
}

-(void)loginBtn{
    
    if ([_userNameTF.text isEqualToString:@""]||[_passwordTF.text isEqualToString:@""]) {
      
        [self showHUD:@"账号或密码不能为空" view:self.view time:1.5];
        
    }else if (!(_userNameTF.text.length==11)){
    
        [self showHUD:@"手机号格式不正确" view:self.view time:1.5];
    
//    }else if (_passwordTF.text.length>5&&_passwordTF.text.length<19){
//    
//        [self showHUD:@"密码格式不正确" view:self.view time:1.5];
//    
    }else{
    
    
          [self dismissViewControllerAnimated:YES completion:nil];
//            MyViewController *my=[[MyViewController alloc]init];
//            [self.navigationController pushViewController:my animated:YES];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Login"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

- (void)intoRegist:(id)sender
{
    RegisterViewController *registVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registVC animated:YES];
}

// - (void)loginIn:(id)sender
// {
// NSString *loginUrl = [NSString stringWithFormat:@"%@/shop/app_v1/login/submit.jhtml",kLocalhost];
// NSString *enPassword = [self encryptUseDES:_passwordTF.text key:self.desKey];
// NSLog(@"enPassword = %@",enPassword);
// NSDictionary *paraDic = [NSDictionary dictionaryWithObjectsAndKeys:_userNameTF.text,@"username",enPassword,@"enPassword", @"true",@"t",nil];
// NSLog(@"%@",paraDic);
// AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
// manager.requestSerializer.timeoutInterval=20;
// manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
// [manager POST:loginUrl
// parameters:paraDic
// success:^(AFHTTPRequestOperation *operation, NSData* responseObject) {
// NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
// NSLog(@"%@",dic);
// if ([[dic valueForKey:@"success"] integerValue]) {
// //                  NSLog(@"dic = %@",[dic valueForKey:@"success"]);
// MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
// 
// hud.labelText = @"登录成功！";
// hud.mode = MBProgressHUDModeText;
// [hud hide:YES afterDelay:1];
// [[NSUserDefaults standardUserDefaults] setValue:[[dic valueForKey:@"data"]valueForKey:@"username"] forKey:@"userName"];
// [[NSUserDefaults standardUserDefaults] setValue:[[dic valueForKey:@"data"]valueForKey:@"token"] forKey:@"token"];
// [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
// [[NSUserDefaults standardUserDefaults] synchronize];
// 
// [self dismissViewControllerAnimated:YES completion:nil];
// }
// else
// {
// NSString *info = [NSString stringWithString:[[dic objectForKey:@"content"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
// 
// MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
// //                  hud.labelText = @"登录失败，请重试";
// hud.labelText = info;
// hud.mode = MBProgressHUDModeText;
// [hud hide:YES afterDelay:1];
// }
// }
// failure:^(AFHTTPRequestOperation *operation, NSError *error) {
// NSLog(@"%@", error);
// MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
// hud.labelText = @"请检查您的网络";
// hud.mode = MBProgressHUDModeText;
// [hud hide:YES afterDelay:1];
// }];
// //    [self dismissViewControllerAnimated:YES completion:nil];
// }

 
 
// -(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key
// {
// NSData *data = [clearText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
// unsigned char buffer[1024];
// memset(buffer, 0, sizeof(char));
// size_t numBytesEncrypted = 0;
// 
// CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
// kCCAlgorithmDES,
// kCCOptionPKCS7Padding| kCCOptionECBMode,
// [key UTF8String],
// kCCKeySizeDES,
// nil,
// [data bytes],
// [data length],
// buffer,
// 1024,
// &numBytesEncrypted);
// 
// NSString* plainText = nil;
// if (cryptStatus == kCCSuccess) {
// NSData *dataTemp = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
// plainText = [GTMBase64 stringByEncodingData:dataTemp];
// NSLog(@"++++++++++++++++++%@",key);
// NSLog(@"DES加密成功");
// }else{
// NSLog(@"DES加密失败");
// }
// return plainText;
// }
// 
 
#pragma mark -- 忘记密码跳转
-(void)forgetPassEvEnt:(UIButton *)sender
{
    ForgetViewController *pass = [[ForgetViewController alloc]init];
    [self.navigationController pushViewController:pass animated:YES];
    // self.navigationController.navigationBar.hidden=NO;
}


#pragma mark --取消登录
- (void)passLogin:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"token"];
    [self dismissViewControllerAnimated:YES completion:^{
        
        [self.parentViewController.tabBarController setSelectedIndex:0];
    }];
}

- (void)keyboardDismiss:(id)sender
{
    [self.view endEditing:YES];
}
- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
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
