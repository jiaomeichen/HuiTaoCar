//
//  ZhuanJiaViewController.m
//  HuiTaoCar
//
//  Created by user on 16/7/27.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "ZhuanJiaViewController.h"
#import "CarView.h"
@interface ZhuanJiaViewController ()<SelectViewDelegate>

@end

@implementation ZhuanJiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title=@"专家咨询";
    CarView *view=[[CarView alloc] init];
    view.frame=CGRectMake(0, 64, ScreenWidth, 51);
    view.backgroundColor=[UIColor whiteColor];
    view.selectDelegate=self;
    [self.view addSubview:view];
}

- (void)SelectViewWithBtn:(UIButton *)btn andWithDataArray:(NSArray *)array
{
    UIAlertController *alertVc=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [self.navigationController presentViewController:alertVc animated:YES completion:nil];
    
    for (int i =0; i<array.count; i++) {
        
        [alertVc addAction:[UIAlertAction actionWithTitle:array[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [btn setTitle:array[i] forState:0];
            [btn setTitleColor:[UIColor orangeColor] forState:0];
            
            //在此刷新数据
            
            
            
        }]];
        
    }
    
    [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
   
        
        
        
    }]];
    
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
