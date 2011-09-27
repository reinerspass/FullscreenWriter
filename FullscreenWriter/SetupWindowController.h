//
//  SetupWindowController.h
//  FullscreenWriter
//
//  Created by Markus Teufel on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol SetupWindowDelegate <NSObject>

    -(void)updateUI;

@end

@interface SetupWindowController : NSWindowController
{
    NSPopUpButton *DocumentsFolderPopUp;
    __unsafe_unretained id<SetupWindowDelegate> delegate;
}

- (IBAction)chooseDocumentsFolder:(id)sender;

@property (unsafe_unretained) id<SetupWindowDelegate> delegate;

@property (strong) IBOutlet NSPopUpButton *DocumentsFolderPopUp;
@end
