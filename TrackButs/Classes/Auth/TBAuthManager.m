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
        
         RACSignal* signal = [authenticatedClient fetchUserRepositories];
         signal = [signal filter:^BOOL(id value) {
             return YES;
         }];
      
         [signal  subscribeNext:^(id x) {
             NSLog(@"%@", x);
         } error:^(NSError *error) {
             
         } completed:^{
             
         }];
     } error:^(NSError *error) {
         NSLog(@"error %@", error);
     }];
}
@end
