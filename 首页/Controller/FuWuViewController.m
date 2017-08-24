//
//  FuWuViewController.m
//  HuiTaoCar
//
//  Created by user on 16/7/27.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "FuWuViewController.h"
#import "MenDiancell.h"
#import "TableViewCell.h"
#import "TCAddresSelectViewController.h"
@interface FuWuViewController ()<UITableViewDataSource,UITableViewDelegate,TCAddresSelectViewControllerDelegate>
@property(nonatomic,strong)UITableView *mendianTableView;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *nameLabel2;
@end

@implementation FuWuViewController

-(void)dealloc{

    _mendianTableView=nil;

}

-(UITableView *)mendianTableView{

    if (!_mendianTableView) {
       
        _mendianTableView=[[UITableView alloc]initWithFrame:myRect(0, 0, 375, 667) style:UITableViewStylePlain];
        _mendianTableView.delegate=self;
        _mendianTableView.dataSource=self;
        _mendianTableView.tableFooterView=[[UIView alloc]init];
        if ([_mendianTableView respondsToSelector:@selector(setSeparatorInset:)])
        {
            [_mendianTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_mendianTableView respondsToSelector:@selector(setLayoutMargins:)])
        {
            [_mendianTableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return _mendianTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"全国门店";
    
    [self.view addSubview:self.mendianTableView];

}

#pragma mark - UITableview的代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }
    return 3;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if (indexPath.section==0) {
        TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"iden"];
        if (cell==nil) {
            cell=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iden"];
            
        }
        _titleLable=[[UILabel alloc]initWithFrame:myRect(15, 17, 66, 13)];
        _titleLable.font=[UIFont systemFontOfSize:MyFontSize13];
        _titleLable.textColor=HWColor(40, 40, 40);
        _titleLable.text=@"城市";
        [cell.contentView addSubview:_titleLable];
        
        if (indexPath.row==0) {
        
        _nameLabel=[[UILabel alloc]initWithFrame:myRect(101, 10, 274, 30)];
        _nameLabel.textColor=HWColor(153, 153, 153);
        _nameLabel.font=[UIFont systemFontOfSize:MYFontSize11];
        _nameLabel.text=@"天津";
        [cell.contentView addSubview:_nameLabel];
        
        }
        if (indexPath.row==1) {
            _titleLable.text=@"品牌";
            _nameLabel2=[[UILabel alloc]initWithFrame:myRect(101, 10, 274, 30)];
            _nameLabel2.textColor=HWColor(153, 153, 153);
            _nameLabel2.font=[UIFont systemFontOfSize:MYFontSize11];
            _nameLabel2.text=@"宝马";
            [cell.contentView addSubview:_nameLabel2];

        }
        
        return cell;
    }
    
    
    MenDiancell *cell=[tableView dequeueReusableCellWithIdentifier:@"rrr"];
    if (cell==nil) {
        cell=[[MenDiancell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rrr"];
    }
    
    

    return cell;
        
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
        return 46;
    }
     return 0.143*ScreenHeight;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 12;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0&&indexPath.row==0) {
        TCAddresSelectViewController *address=[[TCAddresSelectViewController alloc]init];
        address.delegate = self;
        [self.navigationController pushViewController:address animated:YES];

    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];


}
//反向传值
- (void)TCAddresSelectViewControllerDidSelectTitle:(NSString *)title
{
    // [self.cityLabel setTitle:title forState:UIControlStateNormal];
    
         self.nameLabel.text=title;
   
   
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
