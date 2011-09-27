//
//  SetupWindowController.m
//  FullscreenWriter
//
//  Created by Markus Teufel on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SetupWindowController.h"

@implementation SetupWindowController
@synthesize DocumentsFolderPopUp;
@synthesize delegate;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        //NSLog(@"controller inited");
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    //NSLog(@"window did load");
    
    //[self.window makeKeyAndOrderFront:self];

    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)chooseDocumentsFolder:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setAllowsMultipleSelection:NO];
    [openDlg setCanChooseFiles:NO];
    if ([openDlg runModal] == NSOKButton )
    {
        [[NSUserDefaults standardUserDefaults] setObject:[[openDlg directoryURL] path] forKey:@"filesFolder"];
        //[self readFiles];
        [DocumentsFolderPopUp selectItemAtIndex:0];

    }
}

- (IBAction)setupDone:(id)sender {

    //NSLog(@"hit done button");
    [delegate updateUI];
    [self.window close];


}


@end
