//
//  CustomView.m
//  LearnLife
//
//  Created by 郑重 on 16/8/15.
//  Copyright © 2016年 ZZ. All rights reserved.
//

#import "CustomView.h"

static UIImage *myImage = nil;

@implementation CustomView

+ (instancetype)myView {
    if (myImage == nil) {
        myImage = [UIImage imageNamed:@"image-2"];
    }
    CGSize size = myImage.size;
    CustomView *customView = [[CustomView alloc] initWithFrame:(CGRect){CGPointZero, size}];
    return customView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    NSArray  *array = @[@"1", @"2", @"3"];
    
    CGSize  size = myImage.size;

    [array enumerateObjectsUsingBlock:^(NSString *str, NSUInteger idx, BOOL *stop) {
        UIView *view = [[UIView alloc] init];
        view.tag = [array[idx] integerValue];
        [self addSubview:view];

        UIImageView  *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"image-%@", array[idx]]]];
        [view addSubview:iconImageView];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        }];
    }];
}

@end
