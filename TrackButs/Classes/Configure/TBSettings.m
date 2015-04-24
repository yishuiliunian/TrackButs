//
//  TBSettings.m
//  TrackButs
//
//  Created by stonedong on 15/4/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "TBSettings.h"
#import "TBFiles.h"
#import <CocoaLumberjack.h>
#import "TBLog.h"
@implementation TBSettings
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    return self;
}
@end

NSString* TBSettingsFilePath() {
    static NSString* filePath = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        filePath = [TBDocumentsPath() stringByAppendingPathComponent:@"settings.plist"];
    });
    return filePath;
}
TBSettings* TBLoadSettings() {
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:TBSettingsFilePath()];
    if (dic) {
        NSError* error = nil;
        TBSettings* settings = [[TBSettings alloc] initWithDictionary:dic error:&error];
        if (error) {
            DDLogShortError(error);
        }
        return settings;
    } else {
        return [TBSettings new];
    }
}

TBSettings* TBShareSettings()
{
    static  TBSettings* settings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        settings = TBLoadSettings();
    });
    return settings;
}


void TBLocalizedSettings() {
    TBSettings* setting = [TBShareSettings() copy];
    NSDictionary* dic = [setting dictionaryValue];
    if (dic) {
        BOOL ret = [dic writeToFile:TBSettingsFilePath() atomically:YES];
        if (!ret) {
            DDLogError(@"写配置文件失败！！");
        }
    }
}