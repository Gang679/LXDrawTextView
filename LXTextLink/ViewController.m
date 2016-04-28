//
//  ViewController.m
//  LXTextLink
//
//  Created by 李旭 on 16/4/26.
//  Copyright © 2016年 李旭. All rights reserved.
//

#import "ViewController.h"

#import "LXRichTextView.h"

@interface ViewController () <LXRichTextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *text = @"[健身]我sdk[大哭]lms在http://wechat.com喜乐[大哭]选打11111围观一下";
    LXRichTextView *view = [[LXRichTextView alloc] initWithFrame:CGRectMake(20, 20, 300, 20)];
    view.isUrl = YES;
    view.isTop = YES;
    view.backgroundColor = [UIColor greenColor];
    view.font = [UIFont systemFontOfSize:18];
    view.urlStr = @"http://wechat.xunbao178.com/health";
    view.delegage = self;
    [self.view addSubview:view];
    view.text = text;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    //    [paragraphStyle setLineSpacing:9];
    
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:18], NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //    view.frame = CGRectMake(20, 20, 300, [self getTextViewHeight:text]);
    view.frame = CGRectMake(20, 20, 300, ceil(rect.size.height));
}

- (void)richTextView:(LXRichTextView *)view touchBeginRun:(LXRichTextBaseRun *)run
{
    NSLog(@"%@", run.originalText);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
