//
//  carInfoModel.h
//  HuiTaoCar
//
//  Created by user on 16/10/11.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface carInfoModel : NSObject


//商品属性
@property(nonatomic,copy)NSString * categoryId;
@property(nonatomic,copy)NSString * productId;
@property(nonatomic,copy)NSString * productName;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * imageUrl;
@property(nonatomic,copy)NSString * marketPrice;
@property(nonatomic,copy)NSString * lowestSalePrice;
@property(nonatomic,copy)NSString * detail;

@end
