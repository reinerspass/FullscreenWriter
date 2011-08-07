//
//  FullscreenWriterAppDelegate.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FullscreenWriterAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *_window;
}

@property (strong) IBOutlet NSWindow *window;

@end
