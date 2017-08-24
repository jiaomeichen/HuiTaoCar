//
//  LogoModel.m
//  HuiTaoCar
//
//  Created by user on 16/10/13.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import "LogoModel.h"

@implementation LogoModel

-(void)setValue:(id)value forKey:(NSString *)key{

   
}
- (void)setValue:(id)value forKeyPath:(NSString *)keyPath
{
    if ([keyPath isEqualToString:@"id"]) {
        _userID=value;
   
    }else if([keyPath isEqualToString:@"logo"]){
        _logoString=value;
    }
    else if([keyPath isEqualToString:@"name"]){
        _nameString=value;
    }
}

@end
