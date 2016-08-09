//
//  ViewController.m
//  LXTextLink
//
//  Created by 李旭 on 16/4/26.
//  Copyright © 2016年 李旭. All rights reserved.
//

#import "ViewController.h"
#import "LXHelpClass.h"

#import "LXRichTextView.h"

@interface ViewController () <LXRichTextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *text = @"[健身]我sdk[大哭]lms在https://github.com/SoftProgramLX?tab=repositories喜乐[微笑]选打11111我的github";
    
    LXRichTextView *view = [[LXRichTextView alloc] init];
    view.isUrl = YES;
    view.isTop = YES;
    view.backgroundColor = [UIColor greenColor];
    view.font = [UIFont systemFontOfSize:18];
    view.urlStr = @"https://github.com/SoftProgramLX?tab=repositories";
    view.delegage = self;
    view.text = text;
    [self.view addSubview:view];
    
    view.frame = CGRectMake(20, 20, 300, [LXHelpClass calculateLabelighWithText:text withMaxSize:CGSizeMake(300, MAXFLOAT) withFont:18 withSpaceRH:0]);
}

- (void)richTextView:(LXRichTextView *)view touchBeginRun:(LXRichTextBaseRun *)run
{
    NSLog(@"%@", run.originalText);
}

@end
