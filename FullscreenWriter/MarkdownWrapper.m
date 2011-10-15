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
    
    NSString *css = [NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"markdown_default" withExtension:@"css"] encoding:NSUTF8StringEncoding error:nil];
    
    NSString *head_1 = @"<html>"
    "<head>"
    "<style>";

    NSString *head_2 = @"</style>"
    "</head>"
    "<body>";

    
    NSString *post = @"</body>"
    "</html>";
    
    
    return [NSString stringWithFormat:@"%@%@%@%@%@", head_1, css, head_2, html, post];
    
    //return [[pre stringByAppendingString:html] stringByAppendingString:post];
}


@end
