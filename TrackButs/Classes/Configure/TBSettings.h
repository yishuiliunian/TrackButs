//
//  TBSettings.h
//  TrackButs
//
//  Created by stonedong on 15/4/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "MTLModel.h"
#import <OctoKit.h>
@class TBSettings;
FOUNDATION_EXTERN TBSettings* TBShareSettings();
#define TBShareSettingsInfo TBShareSettings()
void TBLocalizedSettings();
@interface TBSettings : MTLModel 
@property (nonatomic, strong) OCTClient* authenticedClient;
@end
