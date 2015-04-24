//
//  TBAuthManager.h
//  TrackButs
//
//  Created by stonedong on 15/4/19.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBAuthManager : NSObject
+ (TBAuthManager*) shareInstance;
- (void) requestAuth;
- (void) requestAuthIfNeed;
@end
