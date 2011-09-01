//
//  AppController.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController
@synthesize bottomShaddowImage;
@synthesize topShaddowImage;
@synthesize resizableView;
@synthesize documentsTableView;
@synthesize documentsButton;
@synthesize settingsButton;
@synthesize wordCountingLabel;
@synthesize mainScrollView;
@synthesize DocumentsDirectoryPopUpButton;
@synthesize settingsPopover;
@synthesize documentsPopover;
@synthesize textBody, textTitle;


- (id)init
{
    self = [super init];
    if (self) {
        userDefaults = [NSUserDefaults standardUserDefaults];
        [self setInitialUserDefaults];
        [self readFiles];
        
        offsetY = 40;
        offsetX = 40;
        
        
        // CLoad custom font
        NSString *fontLocation = [[NSBundle mainBundle] pathForResource:@"Fabrica" ofType:@"otf"];
        NSURL *fontUrl = [NSURL fileURLWithPath:fontLocation]; //KCTFontManagerScopeProcess
        CTFontManagerRegisterFontsForURL((__bridge CFURLRef)fontUrl, kCTFontManagerScopeProcess, nil);
        


    }
    return self;
}

- (void)readFiles
{
    [self setTextFiles: [[NSMutableArray alloc] init]];

    NSString *folder = [userDefaults objectForKey:@"filesFolder"];
    NSFileManager *filemgr;
    NSArray *filelist;
    
    filemgr = [NSFileManager defaultManager];
    filelist = [filemgr directoryContentsAtPath: folder];
    
    for (NSString* file in filelist)
    {
        if ([file hasSuffix:@".txt"]) {
            NSString *fileWithPath = [folder stringByAppendingPathComponent:file];
            NSString *fileContent = [NSString stringWithContentsOfFile:fileWithPath 
                                                              encoding:NSUTF8StringEncoding 
                                                                 error:nil];
            TextDocument *tmp = [[TextDocument alloc] init];
            tmp.title = [file substringToIndex:[file length]-4];
            tmp.content = [[NSAttributedString alloc] initWithString:fileContent];
            [self insertObject:tmp inTextFilesAtIndex:textFiles.count];
        }
    }
}

-(void)setInitialUserDefaults 
{
    /* Set initial User Defaults to NSUserDefaults */
    NSMutableDictionary* initialDefaults = [[NSMutableDictionary alloc] init];
    [initialDefaults setObject:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PlainText"] 
                        forKey:@"filesFolder"];
    [initialDefaults setObject:@"Fabrica" 
                        forKey:@"FontType"];
    [initialDefaults setObject:[NSNumber numberWithInt:14] 
                        forKey:@"FontSize"];
    [userDefaults registerDefaults:initialDefaults];
}



- (void)awakeFromNib
{    
    [[headlineView cell] setBackgroundStyle:NSBackgroundStyleLight];
    [headlineView setTextColor:NSColorFromRGB(0x3f3c3a)];
    [self configureMainTextView];
    [self setCountingLabel];

    markdownPreviewController = [[MarkdownPreviewController alloc] initWithWindowNibName:@"MarkdownPreview"];
}

-(void)configureMainTextView
{
    NSString *font = [userDefaults objectForKey:@"FontType"];
    int size = [[userDefaults objectForKey:@"FontSize"] intValue];
    
    CGFloat spacing = 20;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //    [paragraphStyle setLineHeightMultiple:spacing];
    [paragraphStyle setLineSpacing:spacing];
    
    NSDictionary *attributes = [[NSDictionary alloc] initWithObjectsAndKeys:
                                [NSFont fontWithName:font size:size], NSFontAttributeName, 
                                NSColorFromRGB(0x3f3c3a), NSForegroundColorAttributeName, 
                                //paragraphStyle,NSParagraphStyleAttributeName,
                                nil];
    
    //[mainTextView setDefaultParagraphStyle:paragraphStyle];
    
    
    [mainWindow setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
    [mainWindow setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"NoiseBg1.png"]]];
    [mainTextView setFont:[NSFont fontWithName:[userDefaults objectForKey:@"FontType"] size:[[userDefaults objectForKey:@"FontSize"] intValue]]];
    
    [mainTextView setInsertionPointColor:NSColorFromRGB(0x1db2dd)];
    [mainTextView setSelectedTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      NSColorFromRGB(0x1db2dd), NSBackgroundColorAttributeName,
      [NSColor whiteColor], NSForegroundColorAttributeName,
      nil]];
    
    // Top and bottom spacing of of Text Container
    [mainTextView setTextContainerInset:NSMakeSize(offsetX, offsetY)]; //mainScrollView.bounds.size.height/1.5

    [mainTextView setRichText:NO];
}


- (void)setCountingLabel
{
    NSUInteger numberOfWords = [[[mainTextView textStorage] words] count];
    [wordCountingLabel setStringValue:[NSString stringWithFormat:@"%d words", numberOfWords]];
}


#pragma mark - KVC Methods for Text Files Array
-(void)insertObject:(TextDocument *)p inTextFilesAtIndex:(NSUInteger)index {
    [textFiles addObject:p];
    [headlineView becomeFirstResponder];
    [self closePopovers];
}

-(void)removeObjectFromTextFilesAtIndex:(NSUInteger)index {
    [textFiles removeObjectAtIndex:index];
}

-(void)setTextFiles:(NSMutableArray *)a {
    textFiles = a;
}

-(NSArray*)textFiles {
    return textFiles;
}

#pragma mark - delegate Method for Main view

- (void)windowDidResize:(NSNotification *)notification
{
}

#pragma mark delegate Method for Documents Table View
- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
    [self setCountingLabel];
    //NSLog(@"selected index %d",(int)[documentsTableView selectedRow]);
}

#pragma mark delegate method for Text View
- (void)textDidChange:(NSNotification *)aNotification
{
    [self setCountingLabel];
    /* // Typewriter Scrolling (Pain in the ass)
    NSPoint newScrollToPoint;
    if (YES) {
        newScrollToPoint = NSMakePoint(0, mainTextView.cursorPoint.y+mainScrollView.bounds.size.height); //); 
    }
    
    [[mainScrollView contentView] scrollToPoint: newScrollToPoint];
    [mainScrollView reflectScrolledClipView: [mainScrollView contentView]];
    */
}

#pragma mark Main window delegate

- (NSRect)windowWillUseStandardFrame:(NSWindow *)window defaultFrame:(NSRect)newFrame
{
    NSLog(@"window will use standard frame");
    
    float width = resizableView.frame.size.width;
    float heigt = [NSScreen mainScreen].frame.size.height;
    float x = [NSScreen mainScreen].frame.size.width/2 - resizableView.frame.size.width/2;
    
    NSRect newWindowSize = NSMakeRect(x, 0, width, heigt);
    
    
    return newWindowSize;
}

#pragma mark - Inteface Methods

- (IBAction)toggleFullscreen:(id)sender {
    [mainWindow toggleFullScreen:self];
}


-(IBAction)setMarkdown:(id)sender{
    NSString *rawText = [[mainTextView attributedString] string];
    [markdownPreviewController renderMarkdownToHtml:rawText];
}


- (IBAction)showDocumentsPopover:(id)sender {
    if (![documentsPopover isShown]) {
        [documentsPopover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
    } else {
        [self closePopovers];
    }
}

- (IBAction)showSettingsPopover:(id)sender {
    if (![settingsPopover isShown]) {
        [settingsPopover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
    } else {
        [self closePopovers];
    }    
}

- (IBAction)chooseDocumentsFolder:(id)sender {
    [DocumentsDirectoryPopUpButton selectItemAtIndex:0];
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setAllowsMultipleSelection:NO];
    [openDlg setCanChooseFiles:NO];
    if ([openDlg runModal] == NSOKButton )
    {
        [[NSUserDefaults standardUserDefaults] setObject:[[openDlg directoryURL] path] forKey:@"filesFolder"];
        [self readFiles];
    }
}

- (void)closePopovers{
    [documentsPopover close];
    [settingsPopover close];
    [documentsButton setState:0];
    [settingsButton setState:0];
}
- (IBAction)changeDocWidthSlider:(id)sender {
    [resizableView setWidth:[sender floatValue]];
}

@end
