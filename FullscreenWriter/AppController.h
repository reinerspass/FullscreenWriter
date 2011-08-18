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
#import "FWTextView.h"
#import "MarkdownPreviewController.h"

#define UIColorFromRGB(rgbValue) [NSColor colorWithDeviceRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface AppController  : NSObject <NSWindowDelegate>
{
    IBOutlet NSWindow *mainWindow;
    IBOutlet NSWindow *documentsWindow;
    IBOutlet FWTextView *mainTextView;
    IBOutlet WebView *markdownView;
    IBOutlet NSWindow *markdownWindow;
    IBOutlet NSTextField *headlineView;
    NSPopover *documentsPopover;
    NSPopover *settingsPopover;
    
    NSButton *documentsButton;
    NSButton *settingsButton;
    NSScrollView *mainScrollView;
    NSPopUpButton *DocumentsDirectoryPopUpButton;
    
    NSTableView *documentsTableView;
    NSData *textBody;
    NSString *textTitle;
    NSMutableArray *textFiles;
    
    NSTextField *wordCountingLabel;
    NSUserDefaults *userDefaults;
    
    float offsetY;
    float offsetX;
    
    MarkdownPreviewController __strong *markdownPreviewController;
}

- (IBAction)setMarkdown:(id)sender;
- (void)insertObject:(TextDocument *)p inTextFilesAtIndex:(NSUInteger)index;
- (void)setTextFiles:(NSMutableArray *)a;
- (void)readFiles;
- (void)setInitialUserDefaults;
- (void)configureMainTextView;
- (void)closePopovers;
- (void)setCountingLabel;


@property (copy, nonatomic) NSData *textBody;
@property (copy, nonatomic) NSString *textTitle;

@property (strong) IBOutlet NSPopover *documentsPopover;
@property (strong) IBOutlet NSPopover *settingsPopover;
@property (strong) IBOutlet NSPopUpButton *DocumentsDirectoryPopUpButton;
@property (strong) IBOutlet NSScrollView *mainScrollView;
@property (strong) IBOutlet NSTextField *wordCountingLabel;
@property (strong) IBOutlet NSButton *settingsButton;
@property (strong) IBOutlet NSButton *documentsButton;
@property (strong) IBOutlet NSTableView *documentsTableView;
@end
