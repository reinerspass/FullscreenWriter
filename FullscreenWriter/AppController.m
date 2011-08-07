//
//  AppController.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"hallo");
    }
    
    return self;
}

- (void)awakeFromNib
{
    [mainWindow setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
    [mainWindow setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"NoiseBg1.png"]]];

    [documentsWindow setCollectionBehavior:NSWindowCollectionBehaviorFullScreenAuxiliary];
    [documentsWindow setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"NoiseBg1.png"]]];
    
    [mainTextView setFont:[NSFont fontWithName:@"Georgia" size:18]];
}

- (IBAction)toggleFullscreen:(id)sender {
    [mainWindow toggleFullScreen:self];
}
@end
