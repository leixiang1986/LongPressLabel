//
//  LongPressLabel.h
//  LongPressLabel
//
//  Created by 雷祥 on 2017/10/10.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LongPressLabel : UILabel
//如果需要
@property (nonatomic, copy) UIResponder *(^inputResponderBlock)(LongPressLabel *label);
@property (nonatomic, copy) void(^removeInputResponder)(LongPressLabel *label);
@end
