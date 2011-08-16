//
//  TextDocument.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define NSColorFromRGB(rgbValue) [NSColor colorWithDeviceRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TextDocument : NSObject
{
    NSString *title;
    NSString *content;
    NSString *folderPath;
    NSUserDefaults *userDefaults;
}
@property (copy, nonatomic) NSString *title;

-(NSAttributedString*)plainContent;
-(void)setContent:(NSAttributedString *)newContent;
-(NSAttributedString*)content;


@end
