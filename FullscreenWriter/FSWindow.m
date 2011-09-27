//
//  FSWindow.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 9/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FSWindow.h"

@implementation FSWindow

@synthesize isFullscreen, regularWindowSize;

/*
-(id) initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    if (self = [super initWithContentRect: contentRect
                                styleMask: NSResizableWindowMask //NSBorderlessWindowMask
                                  backing: bufferingType
                                    defer: flag])
        
    {
        [self setMovableByWindowBackground:YES];
        //[self setBackgroundColor:[NSColor clearColor]];
        //[self setLevel:NSNormalWindowLevel];
        [self setOpaque:NO];
        [self setHasShadow:YES];

        
        NSButton *aButton = [self standardWindowButton: NSWindowMiniaturizeButton];
        [aButton setHidden:NO];
        
        [self setTitle:@"test"];
    }
    
    return self;

    
}*/


-(id) initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    
    
    
    if (self = [super initWithContentRect: contentRect
                                styleMask: aStyle //NSBorderlessWindowMask | NSResizableWindowMask | NSBorderlessWindowMask
                                  backing: bufferingType
                                    defer: flag])
    {

        regularWindowSize = contentRect;
        isFullscreen = NO;
        //NSTrackingArea *trackingArea = [
    }
    
    return self;

}

/* Overwriting lions toggle fullscreen method to work with Snow Leopard */
-(void)toggleFullScreen:(id)sender
{
    
    /* simple lion fullscreen */
    if ([[[NSProcessInfo processInfo] operatingSystemVersionString] hasPrefix:@"Version 10.7"]) {
        [super toggleFullScreen:sender];
    }
    
    /* pre lion fullscreen mess */
    else {
        if (!isFullscreen) {
            regularWindowSize = self.frame;
            self.isFullscreen = YES;
            
            [self setStyleMask:NSBorderlessWindowMask];
            [NSMenu setMenuBarVisible:NO];
            [self setFrame:[self frameRectForContentRect:[[self screen] frame]] display:YES animate:YES];
        }
        else {
            self.isFullscreen = NO;
            
            [self setFrame:regularWindowSize display:YES animate:YES];
            int windowStyleMask = NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask;
            [self setStyleMask:windowStyleMask];
            [NSMenu setMenuBarVisible:YES];
        }
    }
}

@end
