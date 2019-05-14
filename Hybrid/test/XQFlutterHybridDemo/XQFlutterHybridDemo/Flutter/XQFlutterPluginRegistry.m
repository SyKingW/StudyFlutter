//
//  XQFlutterPluginRegistry.m
//  XQFlutterHybridDemo
//
//  Created by WXQ on 2019/5/14.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import "XQFlutterPluginRegistry.h"

@implementation XQFlutterPluginRegistry

#pragma mark - FlutterPluginRegistry

- (NSObject<FlutterPluginRegistrar>*)registrarForPlugin:(NSString*)pluginKey {
    NSLog(@"%s", __func__);
    return nil;
}

/**
 * Returns whether the specified plugin has been registered.
 *
 * @param pluginKey The unique key identifying the plugin.
 * @return `YES` if `registrarForPlugin` has been called with `pluginKey`.
 */
- (BOOL)hasPlugin:(NSString*)pluginKey {
    NSLog(@"%s", __func__);
    return YES;
}

/**
 * Returns a value published by the specified plugin.
 *
 * @param pluginKey The unique key identifying the plugin.
 * @return An object published by the plugin, if any. Will be `NSNull` if
 *   nothing has been published. Will be `nil` if the plugin has not been
 *   registered.
 */
- (NSObject*)valuePublishedByPlugin:(NSString*)pluginKey {
    NSLog(@"%s", __func__);
    return nil;
}


@end
