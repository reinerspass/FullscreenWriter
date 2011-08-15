//
//  FWTextView.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FWTextView.h"

@implementation FWTextView

/*
- (void)drawInsertionPointInRect:(NSRect)aRect
                           color:(NSColor *)aColor turnedOn:(BOOL)flag
{
	if (flag)
		[aColor set];
	else
		[[self backgroundColor] set];
    
    [[NSColor greenColor] set];
	aRect.size.width = 10.0;
	[NSBezierPath fillRect:aRect];
}

- (NSColor *)insertionPointColor
{
    return [NSColor redColor];
}*/


- (void) resetCursorRects
{
    [super resetCursorRects];
    [self addCursorRect: [self bounds]
                 cursor: [NSCursor crosshairCursor]];
    
} // resetCursorRects




@end
