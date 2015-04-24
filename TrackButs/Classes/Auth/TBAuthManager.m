//
//  TBAuthManager.m
//  TrackButs
//
//  Created by stonedong on 15/4/19.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "TBAuthManager.h"
#import <DZSingletonFactory.h>
#import <OctoKit.h>
#import "TBFiles.h"
#import <CocoaLumberjack.h>
#import "TBSettings.h"
@implementation TBAuthManager
+ (TBAuthManager*) shareInstance
{
    return DZSingleForClass([self class]);
}


- (void) requestAuth
{
    [[OCTClient
      signInToServerUsingWebBrowser:OCTServer.dotComServer scopes:OCTClientAuthorizationScopesUser]
     subscribeNext:^(OCTClient *authenticatedClient) {
         TBShareSettings().authenticedClient = authenticatedClient;
         TBLocalizedSettings();
     } error:^(NSError *error) {
         NSLog(@"error %@", error);
     }];
}

- (void) requestAuthIfNeed
{
    if (!TBShareSettings().authenticedClient) {
        [self requestAuth];
    }
}
@end
