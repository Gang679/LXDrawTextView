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
    
    view.frame = CGRectMake(20, 20, 300, [self calculateLabelighWithText:text withMaxSize:CGSizeMake(300, MAXFLOAT) withFont:18 withSpaceRH:0]);
}

- (void)richTextView:(LXRichTextView *)view touchBeginRun:(LXRichTextBaseRun *)run
{
    NSLog(@"%@", run.originalText);
}

/**
 *@param textStr 富文本的string属性的值
 *@param maxSize 控件所需最大空间，一般高是最大值，如：CGSizeMake(stockNameLabelW, MAXFLOAT)
 *@param font 字体大小
 *@param spaceRH label行距占行高的比例，若无设置行距则值为0.05
 */
#define GetLabelNormalHeight(height,font,spaceH) (height + (height - [UIFont systemFontOfSize:font].pointSize)*(spaceH>0 ? spaceH : 0.05))
- (CGFloat)calculateLabelighWithText:(NSString *)textStr withMaxSize:(CGSize)maxSize withFont:(CGFloat)font withSpaceRH:(CGFloat)spaceRH
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:font], NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGRect rect = [textStr boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return GetLabelNormalHeight(rect.size.height, font, spaceRH);
}

@end
