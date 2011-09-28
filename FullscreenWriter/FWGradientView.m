//
//  FWGradientView.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 9/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FWGradientView.h"

@implementation FWGradientView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)rect
{
    int borderBottomHeight = 1;
    
	NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:NSColorFromRGB(0xecebec) endingColor:NSColorFromRGB(0xd0d0d0)];
	[gradient drawInRect:[self bounds] angle:270];
    //[[NSColor grayColor] set];
    //NSRectFill(NSMakeRect(rect.origin.x, rect.origin.y, rect.size.width, borderBottomHeight));

}

@end
