//
//  TCAddresSelectViewController.h
//  HuiTaoCar
//  定位
//  Created by user on 16/7/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TCAddresSelectViewControllerDelegate <NSObject>

- (void)TCAddresSelectViewControllerDidSelectTitle:(NSString *)title;

@end
@interface TCAddresSelectViewController : UIViewController

//搜索栏
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;

@property (weak, nonatomic) IBOutlet UITableView *tbView;

@property (nonatomic, assign) id<TCAddresSelectViewControllerDelegate> delegate;

@property (nonatomic, assign) BOOL isLoaction;
@end
