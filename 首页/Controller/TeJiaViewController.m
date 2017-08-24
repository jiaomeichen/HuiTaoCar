//
//  TeJiaViewController.m
//  HuiTaoCar
//
//  Created by user on 16/7/27.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "TeJiaViewController.h"
#import "MZCardCell.h"
@interface TeJiaViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tejiaTableView;
@property(nonatomic,strong)NSArray *tajiaArray;

@end

@implementation TeJiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"今日特价";
    
    // Do any additional setup after loading the view.
    _tejiaTableView=[[UITableView alloc]initWithFrame:myRect(0, 0, 375, 667) style:UITableViewStylePlain];
    _tejiaTableView.delegate=self;
    _tejiaTableView.dataSource=self;
    
    if ([_tejiaTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_tejiaTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_tejiaTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_tejiaTableView setLayoutMargins:UIEdgeInsetsZero];
    }

    _tejiaTableView.tableFooterView=[[UIView alloc]init];
    [self.view addSubview:_tejiaTableView];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MZCardCell *cell=[tableView dequeueReusableCellWithIdentifier:@"www"];
    if (cell==nil) {
        cell=[[MZCardCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"www"];
    }

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 96;
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
