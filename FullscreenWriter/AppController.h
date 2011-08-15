//
//  AppController.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextDocument.h"
#import "Webkit/WebView.h"
#import "Webkit/WebFrame.h"
#import "MarkdownWrapper.h"

#define UIColorFromRGB(rgbValue) [NSColor colorWithDeviceRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface AppController : NSObject
{
    IBOutlet NSWindow *mainWindow;
    IBOutlet NSWindow *documentsWindow;
    IBOutlet NSTextView *mainTextView;
    IBOutlet WebView *markdownView;
    IBOutlet NSWindow *markdownWindow;
    IBOutlet NSTextField *headlineView;
    NSPopover *documentsPopover;
    NSPopover *settingsPopover;
    
    NSPopUpButton *DocumentsDirectoryPopUpButton;
    
    NSData *textBody;
    NSString *textTitle;
    NSMutableArray *textFiles;
    
    NSUserDefaults *userDefaults;
}

- (IBAction)setMarkdown:(id)sender;
- (void)insertObject:(TextDocument *)p inTextFilesAtIndex:(NSUInteger)index;
- (void)setTextFiles:(NSMutableArray *)a;
- (void)readFiles;
- (void)setInitialUserDefaults;


@property (copy, nonatomic) NSData *textBody;
@property (copy, nonatomic) NSString *textTitle;

@property (strong) IBOutlet NSPopover *documentsPopover;
@property (strong) IBOutlet NSPopover *settingsPopover;
@property (strong) IBOutlet NSPopUpButton *DocumentsDirectoryPopUpButton;
@end
