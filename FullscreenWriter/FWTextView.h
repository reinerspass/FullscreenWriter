//
//  FWTextView.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>



@interface FWTextView : NSTextView
{
    CGPoint cursorPoint;
}
- (CGPoint)cursorPoint;


@end


