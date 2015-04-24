//
//  TBConfigure.m
//  TrackButs
//
//  Created by stonedong on 15/4/19.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "TBConfigure.h"
#import <OctoKit.h>
#import "TBLogConfigure.h"

void TBApplicationSetup()
{
    TBConfigureLog();
    [OCTClient setClientID:@"29b6d72fb139aa4efed5" clientSecret:@"82ccb202797dd8814f589bbfeed6f14d71a0da75"];
}