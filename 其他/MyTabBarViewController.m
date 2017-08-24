//
//  MyTabBarViewController.m
//  HuiTaoCar
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "HomeViewController.h"
#import "CarBrandViewController.h"
#import "ShoucangViewController.h"

#import "MySelfViewController.h"
@interface MyTabBarViewController ()

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //首页
    HomeViewController *home=[[HomeViewController alloc]init];
    home.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"common_tab_home_icon_n"] selectedImage:[UIImage imageNamed:@"common_tab_home_icon_s"]];
    home.tabBarItem.image = [[UIImage imageNamed:@"common_tab_home_icon_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    home.tabBarItem.selectedImage = [[UIImage imageNamed:@"common_tab_home_icon_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:home];
    //home.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"common_tab_home_icon_n"] tag:100];
    
    
    
    //汽车品牌
    CarBrandViewController *carBrand=[[CarBrandViewController alloc]init];
    carBrand.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"品牌汽车" image:[UIImage imageNamed:@"common_tab_fenlei_icon_n"] selectedImage:[UIImage imageNamed:@"common_tab_fenlei_icon_s"]];
    carBrand.tabBarItem.image = [[UIImage imageNamed:@"common_tab_fenlei_icon_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    carBrand.tabBarItem.selectedImage = [[UIImage imageNamed:@"common_tab_fenlei_icon_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:carBrand];
   // carBrand.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"汽车品牌" image:[UIImage imageNamed:@"common_tab_fenlei_icon_n"] tag:101];
    
    //收藏
    ShoucangViewController *shouCang=[[ShoucangViewController alloc]init];
    shouCang.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"收藏" image:[UIImage imageNamed:@"common_tab_mycollect_icon_n"] selectedImage:[UIImage imageNamed:@"common_tab_mycollect_icon_s-0"]];
    shouCang.tabBarItem.image = [[UIImage imageNamed:@"common_tab_mycollect_icon_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shouCang.tabBarItem.selectedImage = [[UIImage imageNamed:@"common_tab_mycollect_icon_s-0"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:shouCang];
   // shouCang.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"收藏" image:[UIImage imageNamed:@"common_tab_mycollect_icon_n"] tag:103];
    
    //我的
    MySelfViewController *my=[[MySelfViewController alloc]init];
    //MyViewController *my=[[MyViewController alloc]init];
    my.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"common_tab_my_icon_n"] selectedImage:[UIImage imageNamed:@"common_tab_my_icon_s"]];
    my.tabBarItem.image = [[UIImage imageNamed:@"common_tab_my_icon_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    my.tabBarItem.selectedImage = [[UIImage imageNamed:@"common_tab_my_icon_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:my];
   // my.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"common_tab_my_icon_n"] tag:104];
    
    
    //设置选中颜色
    //self.tabBar.tintColor = HWColor(264, 86, 62);
//    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:HWColor(50, 50, 50)} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:HWColor(264, 86, 62)} forState:UIControlStateSelected];
    self.viewControllers=@[nav1,nav2,nav3,nav4];
    


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
