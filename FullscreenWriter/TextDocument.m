//
//  TextDocument.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextDocument.h"

@implementation TextDocument

@synthesize title;

- (id)init
{
    self = [super init];
    if (self) {
        title = @"No Title";
        content = @"No Content";
        userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)setTitle:(NSString *)newTitle
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    folderPath = [userDefaults objectForKey:@"filesFolder"];
    
    NSString *OldFilePath = [[folderPath stringByAppendingPathComponent:title] stringByAppendingPathExtension:@"txt"];
    NSString *NewFilePath = [[folderPath stringByAppendingPathComponent:newTitle] stringByAppendingPathExtension:@"txt"];
    
    [fileManager moveItemAtPath:OldFilePath toPath:NewFilePath error:nil];
    title = newTitle;
}

-(void)safeToFile
{
    NSString *filePath = [[folderPath stringByAppendingPathComponent:title] stringByAppendingPathExtension:@"txt"];
    [content writeToFile:filePath atomically:NO encoding:NSUTF8StringEncoding error:nil];
}

-(NSAttributedString*)content{
    
    NSString *font = [userDefaults objectForKey:@"FontType"];
    int size = [[userDefaults objectForKey:@"FontSize"] intValue];
    
    CGFloat spacing = 1.4f;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineHeightMultiple:spacing];
//    [paragraphStyle setLineSpacing:spacing];

    NSDictionary *attributes = [[NSDictionary alloc] initWithObjectsAndKeys:
                                [NSFont fontWithName:font size:size], NSFontAttributeName, 
                                UIColorFromRGB(0x3f3c3a), NSForegroundColorAttributeName, 
                                paragraphStyle,NSParagraphStyleAttributeName,nil];
    
    NSAttributedString *attrContent = [[NSAttributedString alloc] 
                                       initWithString:content
                                       attributes: attributes];

    return attrContent;
}

-(void)setContent:(NSAttributedString *)newContent
{
    content = [newContent string];
    [self safeToFile];
}

-(NSMutableString*)plainContent{
    return content;
}


@end
