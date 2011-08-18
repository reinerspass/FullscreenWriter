//
//  MarkdownPreviewController.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MarkdownPreviewController.h"
#import "MarkdownWrapper.h"

@implementation MarkdownPreviewController
@synthesize markdownWindow;
@synthesize markdownWebView;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        NSLog(@"init with window");

    }
    
    return self;
}

- (id)initWithWindowNibName:(NSString *)windowNibName
{
    NSLog(@"initwithnibname");

    self = [super initWithWindowNibName:windowNibName];
    if (self){
        NSLog(@"niit with nibnadme");
    }
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    NSLog(@"windowdidload");
}

-(void)renderMarkdownToHtml:(NSString*)markdown{
    NSString *html = [MarkdownWrapper convertToHtml:markdown];
    WebFrame *frame = [markdownWebView mainFrame];
    [frame loadHTMLString:html baseURL:nil];
    [markdownWindow makeKeyAndOrderFront:self];
    NSLog(@"setmarkdown");
}

@end
