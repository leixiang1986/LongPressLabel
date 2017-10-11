//
//  ViewController.m
//  LongPressLabel
//
//  Created by 雷祥 on 2017/10/10.
//  Copyright © 2017年 okdeer. All rights reserved.
//

#import "ViewController.h"
#import "LongPressLabel.h"
#import "LXTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    LongPressLabel *label = [[LongPressLabel alloc] initWithFrame:CGRectMake(10, 50, 300, 30)];
    label.text = @"这是内容1";
    [self.view addSubview:label];


    LongPressLabel *label1 = [[LongPressLabel alloc] initWithFrame:CGRectMake(10, 100, 300, 30)];
    label1.text = @"这是内容2";
    [self.view addSubview:label1];

    LXTextView *textView = [[LXTextView alloc] initWithFrame:CGRectMake(10, 150, 300, 50)];
    textView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:textView];


    label.inputResponderBlock = ^UIResponder *(LongPressLabel *label) {
        if (textView.isFirstResponder) {
            textView.inputNextResponder = label;
        }

        return textView;
    };
    label1.inputResponderBlock = ^UIResponder *(LongPressLabel *label) {
        if (textView.isFirstResponder) {
            textView.inputNextResponder = label;
        }
        return textView;
    };

    label.removeInputResponder = ^(LongPressLabel *label) {
        textView.inputNextResponder = nil;
    };
    label1.removeInputResponder = ^(LongPressLabel *label) {
        textView.inputNextResponder = nil;
    };

    [self.view endEditing:YES];

}





@end
