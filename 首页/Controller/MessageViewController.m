//
//  MessageViewController.m
//  HuiTaoCar
//
//  Created by user on 16/8/23.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageCell.h"
@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *messageTableView;

@end

@implementation MessageViewController

#pragma mark----lazy
-(UITableView *)messageTableView{
    if (!_messageTableView) {
        _messageTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _messageTableView.delegate=self;
        _messageTableView.dataSource=self;
        //去掉分割线
        _messageTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _messageTableView.showsVerticalScrollIndicator = NO;
        _messageTableView.backgroundColor=HWColor(240, 240, 240);
        
    }

    return _messageTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=HWColor(236, 236, 236);
    self.navigationItem.title=@"消息";
    [self.view addSubview:self.messageTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 7;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MessageCell *cell=[tableView dequeueReusableCellWithIdentifier:@"message"];
    if (cell==nil) {
        cell=[[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"message"];
        cell.backgroundColor=HWColor(236, 236, 236);
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return ScreenHeight*0.27;


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
