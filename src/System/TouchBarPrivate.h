/**
 * @file TouchBarPrivate.h
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

#import <Cocoa/Cocoa.h>

@interface NSTouchBar (Private)
+ (BOOL)presentSystemModal:(NSTouchBar *)touchBar
    placement:(long long)placement
    systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier;
+ (void)dismissSystemModal:(NSTouchBar *)touchBar;
@end
