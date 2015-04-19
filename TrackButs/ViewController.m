//
//  ViewController.m
//  TrackButs
//
//  Created by stonedong on 15/4/19.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "ViewController.h"
#import "TBAuthManager.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[TBAuthManager shareInstance] requestAuth];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
