//
//  FWTextView.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FWTextView.h"

@implementation FWTextView

- (void)drawInsertionPointInRect:(NSRect)aRect
                           color:(NSColor *)aColor turnedOn:(BOOL)flag
{
    [super drawInsertionPointInRect:aRect color:aColor turnedOn:flag];
    cursorPoint = aRect.origin;
    
//    aRect.size.width = 1.0;
//	//aRect.size.height = 16.0;
//    
//	if (flag){
//		[aColor set];
//        [NSBezierPath fillRect:aRect];
//    }
//	else{
//		[[self backgroundColor] set];
//        [NSBezierPath fillRect:aRect];
//    }
    
}

//- (void) _drawInsertionPointInRect:(NSRect)aRect color:(NSColor*)aColor
//{
//    [aColor set];    
//	aRect.size.width = 1.0;
//	//aRect.size.height = 16.0;
//	[NSBezierPath fillRect:aRect];
//}


- (CGPoint)cursorPoint
{
    return cursorPoint;

}

@end
