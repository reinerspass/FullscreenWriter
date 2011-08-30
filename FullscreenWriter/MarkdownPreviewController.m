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
@synthesize markdownWebView;


-(void)renderMarkdownToHtml:(NSString*)markdown{
    [self.window makeKeyAndOrderFront:self];
    NSString *html = [MarkdownWrapper convertToHtml:markdown];
    WebFrame *frame = [markdownWebView mainFrame];
    [frame loadHTMLString:html baseURL:nil];
    
}

@end
