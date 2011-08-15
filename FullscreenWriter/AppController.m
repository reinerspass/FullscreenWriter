//
//  AppController.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController
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
    [initialDefaults setObject:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/PlainText"] forKey:@"filesFolder"];
    [initialDefaults setObject:@"Georgia" forKey:@"FontType"];
    [initialDefaults setObject:[NSNumber numberWithInt:14] forKey:@"FontSize"];
    [userDefaults registerDefaults:initialDefaults];
}



- (void)awakeFromNib
{    
    [[headlineView cell] setBackgroundStyle:NSBackgroundStyleLight];
    [headlineView setTextColor:UIColorFromRGB(0x3f3c3a)];
    
    [mainWindow setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
    [mainWindow setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"NoiseBg1.png"]]];
    //[mainWindow setBackgroundColor:[NSColor lightGrayColor]];
    //[mainTextView setFont:[NSFont fontWithName:[userDefaults objectForKey:@"FontType"] size:[[userDefaults objectForKey:@"FontSize"] intValue]]];
    
    [mainTextView setInsertionPointColor:UIColorFromRGB(0xbd0000)
     ];
    [mainTextView setSelectedTextAttributes:
    [NSDictionary dictionaryWithObjectsAndKeys:
        UIColorFromRGB(0xbd0000), NSBackgroundColorAttributeName,
        [NSColor whiteColor], NSForegroundColorAttributeName,
        nil]];
}

- (IBAction)toggleFullscreen:(id)sender {
    [mainWindow toggleFullScreen:self];
}


-(IBAction)setMarkdown:(id)sender{
    NSString *rawText = [[mainTextView attributedString] string];
    NSString *markdown = [MarkdownWrapper convertToHtml:rawText];
    [[markdownView mainFrame] loadHTMLString:markdown baseURL:nil];
    [markdownWindow makeKeyAndOrderFront:self];
}

#pragma mark - KVC Methods for Text Files Array
-(void)insertObject:(TextDocument *)p inTextFilesAtIndex:(NSUInteger)index {
    [textFiles addObject:p];
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


#pragma mark - delegate Method for Documents Table View
- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
    NSLog(@"hit!");
}


#pragma mark delegate method for Text View
- (void)textDidChange:(NSNotification *)aNotification
{
}

#pragma mark - Inteface Methods
- (IBAction)showDocumentsPopover:(id)sender {
    if (![documentsPopover isShown]) {
        [documentsPopover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
    } else {
        [documentsPopover close];
    }
}

- (IBAction)showSettingsPopover:(id)sender {
    if (![settingsPopover isShown]) {
        [settingsPopover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
    } else {
        [settingsPopover close];
    }
}

- (IBAction)chooseDocumentsFolder:(id)sender {
    [DocumentsDirectoryPopUpButton selectItemAtIndex:0];
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setAllowsMultipleSelection:NO];
    [openDlg setCanChooseFiles:NO];
    //[openDlg directoryURL];
    if ([openDlg runModal] == NSOKButton )
    {
        [[NSUserDefaults standardUserDefaults] setObject:[[openDlg directoryURL] path] forKey:@"filesFolder"];
        [self readFiles];
    }
}

@end
