//
//  AppDelegate.m
//  TrackButs
//
//  Created by stonedong on 15/4/19.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "AppDelegate.h"
#import "TBConfigure.h"
#import <OctoKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

- (void)handleURLEvent:(NSAppleEventDescriptor*)theEvent withReplyEvent:(NSAppleEventDescriptor*)replyEvent {
    // Process URL Request
    NSString* path = [[theEvent paramDescriptorForKeyword:keyDirectObject] stringValue];
    NSURL* url = [NSURL URLWithString:path];
    if ([url.host isEqualToString:@"github-auth"]) {
        [OCTClient completeSignInWithCallbackURL:url];
    }
    
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (BOOL) application:(NSApplication *)sender openFile:(NSString *)filename
{
    return YES;
}

- (void) application:(NSApplication *)sender openFiles:(NSArray *)filenames
{
    
}

@end
