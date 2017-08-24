//
//  FirstViewController.m
//  HuiTaoCar
//
//  Created by user on 16/7/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "FirstViewController.h"
#import "MyTabBarViewController.h"
@interface FirstViewController ()
@property(nonatomic,weak)UIApplication *application;
@end

@implementation FirstViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if (iOS7) {
            self.edgesForExtendedLayout=UIRectEdgeNone;
            
        }
    }
    
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    //设置滚动视图的内容的大小
    scrollView.contentSize=CGSizeMake(ScreenWidth*4, 0);
    scrollView.showsHorizontalScrollIndicator=NO;
    //设置分页
    scrollView.pagingEnabled=YES;
    //滚动以外的不可滚动
    scrollView.bounces=NO;
    [self.view addSubview:scrollView];
    
    NSString *yindaoye=@"landingpage";
    if (ScreenWidth==375) {
        
        yindaoye=@"landingpage1";
        
    }
    for (int i=0; i<4; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth*i, 0, ScreenWidth, ScreenHeight)];
       // imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@%d",yindaoye,i+1]];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"zu%d",i+1]];
        [scrollView addSubview:imageView];
        if (i==3) {
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame=CGRectMake(ScreenWidth*70/320, ScreenHeight*448/568, ScreenWidth*180/320, ScreenHeight*40/568);
            [btn setTitle:@"进入应用" forState:UIControlStateNormal];
            [btn setTitleColor:HWColor(200, 200, 200) forState:UIControlStateHighlighted];
            btn.layer.cornerRadius=10;
            btn.layer.borderColor=[HWColor(250, 250, 250)CGColor];
            btn.layer.borderWidth=1.0;
            btn.backgroundColor=HWColor(234, 100, 100);
            
            [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
            //图片开启交互
            imageView.userInteractionEnabled=YES;
            [imageView addSubview:btn];
            
        }
    }
}

//按钮的点击事件
-(void)buttonClick{
    
    YYLog(@"进入首页面");
    //现在已经不是第一次登陆了
    [[NSUserDefaults standardUserDefaults]setObject:@"NO" forKey:@"isFirstLogin"];
    //获取本地App的版本号
    NSString *myBanben=[[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"];
    //将版本号存储起来
    [[NSUserDefaults standardUserDefaults]setObject:myBanben forKey:@"MyAppVersionStr"];
    //将打开app的时间存储进去
    [[NSUserDefaults standardUserDefaults]setObject:[NSDate date] forKey:@"mySetTime"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    CATransition *action=[CATransition animation];
    action.duration=0.5;
    //动画的效果
    action.type=@"rippleEffect";
    [self.navigationController.view.layer addAnimation:action forKey:nil];
    MyTabBarViewController *myTabBar=[[MyTabBarViewController alloc]init];
    [UIApplication sharedApplication].delegate.window.rootViewController=myTabBar;
    
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
