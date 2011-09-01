//
//  ScrollViewWithShaddows.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ScrollViewWithShaddows.h"

@implementation ScrollViewWithShaddows
-(void)drawRect:(NSRect)dirtyRect{
    
    
    
    
    //if (self.pageScroll > 1) {
        NSRect upperRect = NSMakeRect(0, 0, self.frame.size.width, 20);
        NSDrawThreePartImage(upperRect, [NSImage imageNamed:@"ShaddowDownLeftCap.png"],
                             [NSImage imageNamed:@"ShaddowDownFill.png"], 
                             [NSImage imageNamed:@"ShaddowDownRightCap.png"], 
                             NO, NSCompositeSourceOver, 1, YES); 

    //}

    //if (self.contentSize.height > self.frame.size.height) {
        NSRect lowerRect = NSMakeRect(0, self.frame.size.height-20, self.frame.size.width, 20);
        NSDrawThreePartImage(lowerRect, [NSImage imageNamed:@"ShaddowDownLeftCap.png"],
                             [NSImage imageNamed:@"ShaddowDownFill.png"], 
                             [NSImage imageNamed:@"ShaddowDownRightCap.png"], 
                             NO, NSCompositeSourceOver, 1, NO); 

    //}
    
    //NSLog(@"pagescroll: %f content height: %f self heigt: %f", self.pageScroll, self.contentSize.height, self.frame.size.height);
    
    [super drawRect:dirtyRect];
    
    
}

@end
