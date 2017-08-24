//
//  CarView.h
//  LBJH
//
//  Created by macbook on 16/10/10.
//  Copyright © 2016年 cttx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectViewDelegate <NSObject>

- (void)SelectViewWithBtn:(UIButton *)btn andWithDataArray:(NSArray *)array;

@end

@interface CarView : UIView

@property (nonatomic,weak) id<SelectViewDelegate> selectDelegate;
@property (nonatomic,strong) NSArray *carTypeArray;
@property (nonatomic,strong) NSArray *fromArray;
@property (nonatomic,strong) NSArray *typeArray;

@end
