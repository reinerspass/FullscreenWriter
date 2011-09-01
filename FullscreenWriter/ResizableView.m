//
//  ResizableView.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ResizableView.h"

#define _width 10
#define _height 30
#define _leftMargin 40


@implementation ResizableView

/*
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                    options: (NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow | NSTrackingMouseMoved)
                                                      owner:self userInfo:nil];
        [self addTrackingArea:trackingArea];
        lastDraggingPosition = 0;
        showResizeRects = NO;
        dragging = NO;
    }
    return self;
}

 
- (void)drawRect:(NSRect)dirtyRect
{
    NSRect resizeRect = NSMakeRect(_leftMargin, -10, _width, _height+10);
    NSBezierPath* thePath = [NSBezierPath bezierPath];
    [thePath appendBezierPathWithRoundedRect:resizeRect xRadius:2 yRadius:2];

    
    if (showResizeRects) {
        [[NSColor colorWithDeviceRed:.6 green:.6 blue:.6 alpha:1.] setFill];
    } else {
        [[NSColor colorWithDeviceRed:.9 green:.9 blue:.9 alpha:1.] setFill];
    }
    
    [thePath fill];


}

- (void)mouseDragged:(NSEvent *)theEvent
{
    dragging = YES;
    
    if (!showResizeRects) {
        return;
    }
    
    if (lastDraggingPosition == 0) {
        lastDraggingPosition = theEvent.locationInWindow.x;
    } 
    
    else {
    
        float draggingDifference = theEvent.locationInWindow.x-lastDraggingPosition;
        
        float newXPosition = self.frame.origin.x + draggingDifference;
        float newWidth = self.frame.size.width - draggingDifference*2;
        
        NSRect newRect = NSMakeRect(newXPosition, self.frame.origin.y, newWidth, self.frame.size.height);
        
            if (newWidth < 610 && draggingDifference > 0) {
                //NSLog(@"Minimal size reached");
                return;
            }
            
            if (newWidth >= self.window.frame.size.width)
            {
                //NSLog(@"Maximum size reached");
                return;
            }
        
            showResizeRects = YES;
        //NSLog(@"dragging new x %f new width %f diff %f", newXPosition, newWidth, draggingDifference);
        
        self.frame = newRect;
        lastDraggingPosition = theEvent.locationInWindow.x;
        
    }
}

-(void)mouseUp:(NSEvent *)theEvent
{
    //NSLog(@"dragging ended");
    dragging = NO;
}

- (void)mouseMoved:(NSEvent *)theEvent
{
    
    NSPoint mousePosition = [self convertPoint:[theEvent locationInWindow] fromView:nil];

    if ((mousePosition.x > _leftMargin && mousePosition.x <= _width+_leftMargin && mousePosition.y <= _height) || dragging) {
        showResizeRects = YES;
        //NSLog(@"XXXXX MOVED! p = %d,%d ",(int)mousePosition.x,(int)mousePosition.y);
    }
    else
        showResizeRects = NO;
    
    [self setNeedsDisplay:YES];
}

-(void)mouseExited:(NSEvent *)theEvent
{
    //NSLog(@"mouse Exited");
    showResizeRects = NO;
    [self setNeedsDisplay:YES];
} */

// Handles Resizing of window and resizable view
-(void)setWidth:(float)newWidth
{
    
    float border = 30;
    float oldWindowWidth = self.window.frame.size.width;

    float newWindowWidth = newWidth + (border*2);
    float newWindowX = self.window.frame.origin.x - (((newWidth+(2*border))-oldWindowWidth)/2);
    
    
    // Setting new Window Frame
    NSRect windowFrame = NSMakeRect(newWindowX, self.window.frame.origin.y, newWindowWidth, self.window.frame.size.height);
    [self.window setFrame:windowFrame display:YES animate:NO];
    
    // Setting new View Frame
    NSRect viewFrame = NSMakeRect(border, self.frame.origin.y, newWidth, self.frame.size.height);
    [self setFrame:viewFrame];

}



@end
