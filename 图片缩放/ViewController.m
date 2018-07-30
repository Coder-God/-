//
//  ViewController.m
//  图片缩放
//
//  Created by 贾林飞 on 2018/7/30.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "ViewController.h"
#import "FLJScaleScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FLJScaleScrollView* scaleView = [[FLJScaleScrollView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
    scaleView.zoomImageView.contentMode = UIViewContentModeScaleToFill;
    scaleView.maximumZoomScale = 5.f;
//    scaleView.minimumZoomScale = .5f;
    scaleView.layer.borderWidth = 2.f;
    scaleView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:scaleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
