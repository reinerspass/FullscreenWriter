//
//  MarkdownWrapper.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MarkdownWrapper.h"
#import "renderers.h"

@implementation MarkdownWrapper

-(id)init {
    self = [super init];
    if (self) {
        
    }
    
    
    return self;
}

+(NSString*)convertToHtml:(NSString*)rawMarkdown
{
    const char * prose = [rawMarkdown UTF8String];  
    struct buf *ib, *ob;       
    
    int length = (int)rawMarkdown.length + 1;
    
    ib = bufnew(length);
    bufgrow(ib, length);
    memcpy(ib->data, prose, length);
    ib->size = length;
    
    ob = bufnew(64);
    markdown(ob, ib, &mkd_xhtml);
    
    NSString *shinyNewHTML = [NSString stringWithUTF8String: ob->data];
    
    bufrelease(ib);
    bufrelease(ob);
    
    return [self embedHtml:shinyNewHTML];
}

+(NSString*)embedHtml:(NSString*)html
{
    NSString *pre = @"<html>"
    "<head>"
    "<style>"
    "* {"
	"font: \"Helvetica Neue\", sans-serif;"
	"margin:20px auto;"
	"width:600px;"
	"color:#333;"
    "}"
    "h1, h2, h3, h4, h5 {"
        "border-bottom: 1px solid black;"
	"display: block;"
	"color:#111;"
    "}"
    "p {font-size:14px}"
    "</style>"
    "</head>"
    "<body>";
    
    NSString *post = @"</body>"
    "</html>";
    
    return [[pre stringByAppendingString:html] stringByAppendingString:post];
}


@end
