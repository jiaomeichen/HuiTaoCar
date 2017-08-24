//
//  YJTagView.h
//  HuiTaoCar
//
//  Created by user on 16/9/1.
//  Copyright © 2016年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJTagFrame.h"

#define TextColor [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@protocol YJTagViewDelegate <NSObject>

-(void)YJTagView:(NSArray *)tagArray;

-(void)YJTag:(int)tag;

@end

@interface YJTagView : UIView

{
    //储存选中按钮的tag
    NSMutableArray *selectedBtnList;
    int k;
}

@property (weak, nonatomic) id<YJTagViewDelegate>delegate;

/** 是否能选中 需要在 YJETagFrame 前调用  default is YES*/
@property (assign, nonatomic) BOOL clickbool;

/** 未选中边框大小 需要在 YJTagFrame 前调用 default is 0.5*/
@property (assign, nonatomic) CGFloat borderSize;

/** YJTagFrame */
@property (nonatomic, strong) YJTagFrame *tagsFrame;

/** 选中背景颜色 default is whiteColor */
@property (strong, nonatomic) UIColor *clickBackgroundColor;

/** 选中字体颜色 default is TextColor */
@property (strong, nonatomic) UIColor *clickTitleColor;

/** 多选选中 default is 未选中*/
@property (strong, nonatomic) NSArray *clickArray;

/** 单选选中 default is 未选中*/
@property (strong, nonatomic) NSString *clickString;

/** 选中边框大小 default is 0.5*/
@property (assign, nonatomic) CGFloat clickborderSize;

/** 1-多选 0-单选 default is 0-单选*/
@property (assign, nonatomic) NSInteger clickStart;



@end
