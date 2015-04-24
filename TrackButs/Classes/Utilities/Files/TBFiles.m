//
//  TBFiles.m
//  TrackButs
//
//  Created by stonedong on 15/4/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "TBFiles.h"

#define NSShareFileManager [NSFileManager defaultManager]
NSString* TBDocumentsPath()
{
    static NSString* documentsPath = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray* urls =  [NSShareFileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask];
        NSURL* url = urls[0];
        documentsPath = [url path];
        documentsPath = [documentsPath stringByAppendingPathComponent:@"TrackBugs"];
        TBEnsurePathExist(documentsPath);
    });
    return documentsPath;
}

void TBEnsurePathExist(NSString* path)
{
    NSCParameterAssert(path);
    BOOL exist = [NSShareFileManager fileExistsAtPath:path];
    if (!exist) {
        NSError* error = nil;
        [NSShareFileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
}