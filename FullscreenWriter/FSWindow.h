//
//  FSWindow.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 9/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface FSWindow : NSWindow
{
    BOOL isFullscreen;
    NSRect regularWindowSize;
}

@property BOOL isFullscreen;
@property NSRect regularWindowSize;


-(void)toggleFullScreen:(id)sender;

@end
