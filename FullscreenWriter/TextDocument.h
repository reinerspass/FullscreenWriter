//
//  TextDocument.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



@interface TextDocument : NSObject
{
    NSString *title;
    NSAttributedString *content;
}
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSAttributedString *content;

@end
