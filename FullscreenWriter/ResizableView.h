//
//  ResizableView.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ResizableView : NSView
{
    float lastDraggingPosition;
    BOOL showResizeRects;
    BOOL dragging;
}

-(void)setWidth:(float)newWidth;

@end
