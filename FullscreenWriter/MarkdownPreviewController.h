//
//  MarkdownPreviewController.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Webkit/WebView.h"
#import "Webkit/WebFrame.h"

@interface MarkdownPreviewController : NSWindowController
{
    WebView *markdownWebView;
    NSString *htmlCode;
}

-(void)renderMarkdownToHtml:(NSString*)markdown;

@property (strong) IBOutlet WebView *markdownWebView;
@end
