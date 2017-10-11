//
//  LXTextView.m
//  LongPressLabel
//
//  Created by 雷祥 on 2017/10/10.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "LXTextView.h"

@implementation LXTextView
- (UIResponder *)nextResponder {
    if (_inputNextResponder != nil)
        return _inputNextResponder;
    else
        return [super nextResponder];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (self.inputNextResponder != nil) {
        return NO;
    }
    else {
        return [super canPerformAction:action withSender:sender];
    }
}


@end
