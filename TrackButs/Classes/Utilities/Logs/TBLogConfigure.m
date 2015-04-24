//
//  TBLogConfigure.m
//  TrackButs
//
//  Created by stonedong on 15/4/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "TBLogConfigure.h"
#import "TBFiles.h"
#import <CocoaLumberjack.h>
void TBConfigureLog() {
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    DDFileLogger* fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
}
