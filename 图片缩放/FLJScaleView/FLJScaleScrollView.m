//
//  FLJScaleScrollView.m
//  图片缩放
//
//  Created by 贾林飞 on 2018/7/30.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "FLJScaleScrollView.h"

@interface FLJScaleScrollView ()<UIScrollViewDelegate>

@property(nonatomic,assign)BOOL tapClicked;

@end

@implementation FLJScaleScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.delegate =self;
        self.showsVerticalScrollIndicator =NO;
        self.showsHorizontalScrollIndicator =NO;
        self.maximumZoomScale =3;

        [self addSubview:self.zoomImageView];
        self.tapClicked = NO;

    }
    return self;
}

#pragma mark UIScrollViewDelegate

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.zoomImageView;
}

#pragma mark private

- (void)handleDoubleTap:(UIGestureRecognizer *)gesture
{
    float newScale;
    if (!self.tapClicked) {
        newScale = self.zoomScale *2.0;
    }
    else{
        newScale = self.zoomScale *0.0;
    }
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gesture locationInView:gesture.view]];
    [self zoomToRect:zoomRect animated:YES];
    self.tapClicked = !self.tapClicked;
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center
{
    CGRect zoomRect;
    zoomRect.size.height =self.frame.size.height / scale;
    zoomRect.size.width  =self.frame.size.width  / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  /2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height /2.0);
    return zoomRect;
}

#pragma mark  懒加载

-(UIImageView *)zoomImageView
{
    if (!_zoomImageView) {
        _zoomImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _zoomImageView.image = [UIImage imageNamed:@"timg"];
        _zoomImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        [doubleTapGesture setNumberOfTapsRequired:2];
        [_zoomImageView addGestureRecognizer:doubleTapGesture];
    }
    return _zoomImageView;
}

@end
