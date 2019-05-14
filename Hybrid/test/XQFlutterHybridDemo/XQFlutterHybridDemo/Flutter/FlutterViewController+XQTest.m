//
//  FlutterViewController+XQTest.m
//  XQFlutterHybridDemo
//
//  Created by WXQ on 2019/5/14.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import "FlutterViewController+XQTest.h"

#import <XQProjectTool/NSObject+XQExchangeIMP.h>

@implementation FlutterViewController (XQTest)

+ (void)load {
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}


@end
