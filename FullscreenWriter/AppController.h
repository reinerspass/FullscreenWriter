//
//  AppController.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextDocument.h"

@interface AppController : NSObject
{
    IBOutlet NSWindow *mainWindow;
    IBOutlet NSWindow *documentsWindow;
    IBOutlet NSTextView *mainTextView;
    NSData *textBody;
    NSString *textTitle;
    
    NSMutableArray *textFiles;
}

@property (copy, nonatomic) NSData *textBody;
@property (copy, nonatomic) NSString *textTitle;

@end
