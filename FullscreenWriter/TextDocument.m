//
//  TextDocument.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextDocument.h"

@implementation TextDocument

@synthesize title, content;

- (id)init
{
    self = [super init];
    if (self) {
        title = @"No Title";
        content = [[NSAttributedString alloc] initWithString:@"No Content"];
    }
    return self;
}

@end
