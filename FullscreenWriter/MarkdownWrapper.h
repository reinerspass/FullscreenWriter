//
//  MarkdownWrapper.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//



@interface MarkdownWrapper : NSObject

+(NSString*)convertToHtml:(NSString*)rawMarkdown;
+(NSString*)embedHtml:(NSString*)html;

@end
