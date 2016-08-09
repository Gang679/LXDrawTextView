//
//  LXHelpClass.m
//  TestVal
//
//  Created by 李旭 on 16/3/21.
//  Copyright © 2016年 李旭. All rights reserved.
//

#import "LXHelpClass.h"
#import "SynthesizeSingleton.h"

@implementation LXHelpClass

SYNTHESIZE_SINGLETON_FOR_CLASS(LXHelpClass)

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setFaceData];
    }
    return self;
}

- (void)setFaceData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"expression2" ofType:@"plist"];
    NSMutableArray *faces = [NSMutableArray arrayWithContentsOfFile:path];
    NSArray *addArr = @[@{customPic[0]: @"icon_style_1"}, @{customPic[1]: @"icon_style_2"}, @{customPic[2]: @"icon_style_3"}, @{customPic[3]: @"icon_style_4"}, @{customPic[4]: @"icon_style_5"}, @{customPic[5]: @"icon_style_6"}];
    [faces addObjectsFromArray:addArr];
    _keyArrAll = [[NSMutableArray alloc] init];
    _valueArrAll = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in faces) {
        [_keyArrAll addObject:[dic allKeys][0]];
        [_valueArrAll addObject:[dic allValues][0]];
    }
}
+ (NSArray *)getFace
{
    NSString *plistFilePath = [[NSBundle mainBundle] pathForResource:@"expression2" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:plistFilePath];
    return arr;
}

@end


