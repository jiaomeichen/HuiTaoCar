//
//  LoginViewController.h
//  HuiTaoCar
//
//  Created by user on 16/8/16.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "GTMBase64.h"
#import "ForgetViewController.h"
#import "RegisterViewController.h"
#import "MBProgressHUD.h"
@interface LoginViewController : BaseViewController

@property (nonatomic,strong)UITextField *userNameTF;
@property (nonatomic,strong)UITextField *passwordTF;
@property (nonatomic,strong)NSString *desKey;

@end
