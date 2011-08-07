//
//  AppController.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController

@synthesize textBody, textTitle;

- (id)init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (void)awakeFromNib
{
    textFiles = [[NSMutableArray alloc] init];
    
    TextDocument *tmp = [[TextDocument alloc] init];
    tmp.title = @"test";
    tmp.content = [[NSAttributedString alloc] initWithString:@"Hahahahaa"];
    
    [textFiles addObject:tmp];
    
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
