//
//  LXHelpClass.h
//  TestVal
//
//  Created by 李旭 on 16/3/21.
//  Copyright © 2016年 李旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

//#define customPic @[@"[发]", @"[报]", @"[健]", @"[领]", @"[约]", @"[置]"]
#define customPic @[@"[发帖]", @"[报名]", @"[健身]", @"[领水]", @"[约战]", @"[置顶]"]
#define customPicName @[@"icon_style_1", @"icon_style_2", @"icon_style_3", @"icon_style_4", @"icon_style_5", @"icon_style_6"]

@interface LXHelpClass : NSObject

@property (nonatomic, strong) NSMutableArray *facesAll;
@property (nonatomic, strong) NSMutableArray *keyArrAll;
@property (nonatomic, strong) NSMutableArray *valueArrAll;


+ (LXHelpClass *)sharedLXHelpClass;
+ (NSArray *)getFace;
+ (CGFloat)calculateLabelighWithText:(NSString *)textStr withMaxSize:(CGSize)maxSize withFont:(CGFloat)font withSpaceRH:(CGFloat)spaceRH;

@end



