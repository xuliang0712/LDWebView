//
//  WebviewProgressLine.h
//  Quantum
//
//  Created by Sula on 2017/6/30.
//  Copyright © 2017年 com.daweiwenhua.SilkRoad. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+Frame.h"

@interface WebviewProgressLine : UIView

//进度条颜色
@property (nonatomic,strong) UIColor  *lineColor;

//开始加载
-(void)startLoadingAnimation;

//结束加载
-(void)endLoadingAnimation;

@end
