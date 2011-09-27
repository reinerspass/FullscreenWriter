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
#import "ResizableView.h"
#import "SetupWindowController.h"
#import "FSWindow.h"

#define NSColorFromRGB(rgbValue) [NSColor colorWithDeviceRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface AppController  : NSObject <NSWindowDelegate, SetupWindowDelegate>
{
    IBOutlet FSWindow *mainWindow;
    IBOutlet FWTextView *mainTextView;
    IBOutlet NSTextField *headlineView;
    
    SetupWindowController *setupWindowController;
    
    ResizableView *resizableView;
    
    id documentsPopover;
    id settingsPopover;
    
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
    NSImageView *topShaddowImage;
    NSImageView *bottomShaddowImage;
    
    NSWindow *settingsWindow;
    NSWindow *documentsWindow;

    __unsafe_unretained NSView *documentsView;
    __unsafe_unretained NSView *settingsView;
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

@property (strong) IBOutlet id documentsPopover;
@property (strong) IBOutlet id settingsPopover;
@property (strong) IBOutlet NSPopUpButton *DocumentsDirectoryPopUpButton;
@property (strong) IBOutlet NSScrollView *mainScrollView;
@property (strong) IBOutlet NSTextField *wordCountingLabel;
@property (strong) IBOutlet NSButton *settingsButton;
@property (strong) IBOutlet NSButton *documentsButton;
@property (strong) IBOutlet NSTableView *documentsTableView;
@property (strong) IBOutlet ResizableView *resizableView;
@property (strong) IBOutlet NSImageView *topShaddowImage;
@property (strong) IBOutlet NSImageView *bottomShaddowImage;
@property (unsafe_unretained) IBOutlet NSView *settingsView;
@property (unsafe_unretained) IBOutlet NSView *documentsView;
@end
