//
//  FWGradientView.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 9/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define NSColorFromRGB(rgbValue) [NSColor colorWithDeviceRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface FWGradientView : NSView

@end
