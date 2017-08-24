//
//  ChangeNameViewController.m
//  HuiTaoCar
//
//  Created by user on 16/9/14.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ChangeNameViewController.h"

@interface ChangeNameViewController ()

@end

@implementation ChangeNameViewController

-(void)viewWillAppear:(BOOL)animated{
    // [self createDaohang];
    self.navigationController.navigationBar.barTintColor=HWColor(240,240,240);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MyFontSize17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
  self.navigationItem.title=@"修改个人昵称";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
