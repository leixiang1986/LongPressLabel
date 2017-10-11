//
//  LongPressLabel.m
//  LongPressLabel
//
//  Created by 雷祥 on 2017/10/10.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "LongPressLabel.h"


@interface LongPressLabel ()
@property (nonatomic, weak) UIResponder *inputResponder;
@end

@implementation LongPressLabel

//- (UIResponder *)inputResponder {
//    if (_inputResponder) {
//        return _inputResponder;
//    }
//    else {
//        return [super nextResponder];
//    }
//}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copy:)) {
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

- (void)longPress:(UILongPressGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self];
    if (gesture.state == UIGestureRecognizerStateBegan) {
        UIMenuController *menu=[UIMenuController sharedMenuController];
//        if (menu.isMenuVisible) return;
        if (self.inputResponderBlock) {
            UIResponder *responder = self.inputResponderBlock(self);
            if (![responder isFirstResponder]) {
                [self becomeFirstResponder];
            }
        }
        else {
            [self becomeFirstResponder];
        }


//        UIMenuItem *copy = [[UIMenuItem alloc] initWithTitle:@"复制"action:@selector(copy:)];
//        [menu setMenuItems:@[copy]];
        CGRect targetRect = CGRectMake(0, 0, point.x * 2, self.bounds.size.height);

        [menu setTargetRect:targetRect inView:self];
        [menu setMenuVisible:YES animated:YES];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuWillHidden) name:UIMenuControllerDidHideMenuNotification object:nil];
    }
}

- (void)menuWillHidden {
    if (self.removeInputResponder) {
        self.removeInputResponder(self);
    }
}

- (void)copy:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.text];
}

@end
