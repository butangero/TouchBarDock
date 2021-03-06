/**
 * @file TouchBarPrivate.m
 *
 * @copyright 2018 Bill Zissimopoulos
 */
/*
 * This file is part of TouchBarDock.
 *
 * You can redistribute it and/or modify it under the terms of the GNU
 * General Public License version 3 as published by the Free Software
 * Foundation.
 */

#import "TouchBarPrivate.h"

@interface NSTouchBar ()
/* macOS 10.13 */
+ (void)presentSystemModalFunctionBar:(NSTouchBar *)touchBar
    placement:(long long)placement
    systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier;
+ (void)presentSystemModalFunctionBar:(NSTouchBar *)touchBar
    systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier;
+ (void)dismissSystemModalFunctionBar:(NSTouchBar *)touchBar;
+ (void)minimizeSystemModalFunctionBar:(NSTouchBar *)touchBar;

/* macOS 10.14 */
+ (void)presentSystemModalTouchBar:(NSTouchBar *)touchBar
    placement:(long long)placement
    systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier;
+ (void)presentSystemModalTouchBar:(NSTouchBar *)touchBar
    systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier;
+ (void)dismissSystemModalTouchBar:(NSTouchBar *)touchBar;
+ (void)minimizeSystemModalTouchBar:(NSTouchBar *)touchBar;
@end

@interface NSTouchBarItem ()
+ (void)addSystemTrayItem:(NSTouchBarItem *)item;
+ (void)removeSystemTrayItem:(NSTouchBarItem *)item;
@end

@implementation NSTouchBar (Private)
+ (BOOL)presentSystemModal:(NSTouchBar *)touchBar
    placement:(long long)placement
    systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier
{
    if ([NSTouchBar respondsToSelector:
        @selector(presentSystemModalFunctionBar:placement:systemTrayItemIdentifier:)])
    {
        [NSTouchBar
            presentSystemModalFunctionBar:touchBar
            placement:placement
            systemTrayItemIdentifier:identifier];
        return YES;
    }
    else if ([NSTouchBar respondsToSelector:
        @selector(presentSystemModalTouchBar:placement:systemTrayItemIdentifier:)])
    {
        [NSTouchBar
            presentSystemModalTouchBar:touchBar
            placement:placement
            systemTrayItemIdentifier:identifier];
        return YES;
    }
    else
        return NO;
}

+ (void)dismissSystemModal:(NSTouchBar *)touchBar
{
    if ([NSTouchBar respondsToSelector:
        @selector(dismissSystemModalFunctionBar:)])
    {
        [NSTouchBar
            dismissSystemModalFunctionBar:touchBar];
    }
    else if ([NSTouchBar respondsToSelector:
        @selector(dismissSystemModalTouchBar:)])
    {
        [NSTouchBar
            dismissSystemModalTouchBar:touchBar];
    }
}
@end
