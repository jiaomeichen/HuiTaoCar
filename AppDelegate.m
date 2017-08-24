//
//  AppDelegate.m
//  HuiTaoCar
//
//  Created by user on 16/7/18.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarViewController.h"
#import "FirstViewController.h"

//友盟
#import <UMSocialCore/UMSocialCore.h>

//极光推送
//#import "JPUSHService.h"
//57ac3639e0f55aaedd0035df
//22eaba8b704693ba53a6fb3d 极光推送Appkey  a582fe2518d15912d757d294 --Master Secret
//507fcab25270157b37000010
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    //友盟分享
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"57ac3639e0f55aaedd0035df"];
    [self configUSharePlatforms];
    if ([self isFirstLogin]) {
        self.window.rootViewController=[[FirstViewController alloc]init];
        [self.window makeKeyWindow];
    //将应用停止
       return NO;
    }else{
        //UITabBarController控制器
        MyTabBarViewController *myTabBar=[[MyTabBarViewController alloc]init];
        self.window.rootViewController=myTabBar;
        //改变程序启动欢迎页的时间
        [NSThread sleepForTimeInterval:3];
        [self.window makeKeyAndVisible];
             return YES;
    }
}
-(BOOL)isFirstLogin{
    
    //判断是不是第一次登陆
    YYLog(@"当前登陆状态1为%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"isFirstLogin"])
    //获取本地APP版本号
    NSString *myBanben=[[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleShortVersionString"];
    //判断本地APP版本号和本地存储的版本号是否一致
    NSString *myAPPBanBen=[[NSUserDefaults standardUserDefaults]objectForKey:@"MyAppVersionStr"];
    //当前版本与本地不一致的情况下  进行更新
    if (![myBanben isEqualToString:myAPPBanBen]) {
        //修改为不是第一次登陆
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"isFirstLogin"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return YES;
    }else{
        //版本相同有两种情况：1不用更新
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"isFirstLogin"] isEqualToString:@"NO"]) {
            return NO;
        }else{
            //2.用更新
            return YES;
        }
    }
       return YES;
}
- (void)configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105821097"/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"3921700954"  appSecret:@"04b48b094faeb16683c32669824ebdad" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
        NSLog(@"走了这一步");
    }
    return result;
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error { //Optional
   
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
