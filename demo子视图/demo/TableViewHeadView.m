//
//  TableViewHeadView.m
//  demo
//
//  Created by wangwei on 2017/7/31.
//  Copyright © 2017年 wangwei-WW. All rights reserved.
//

#import "TableViewHeadView.h"
#import "Masonry.h"

@interface TableViewHeadView()

@property (nonatomic, strong) UIImageView *imageView;

@end
@implementation TableViewHeadView//布局用 masory
#pragma makr - cycle life
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
        [self initViewConfigurations];
    }
    return self;
}
- (void)updateConstraints {
    [super updateConstraints];
    [self initViewLayouts];
}
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}
#pragma mark - initializations
- (void)initViews {
    [self addSubview:self.imageView];
}
- (void)initViewLayouts {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(@10);
        make.height.equalTo(@40);
        make.width.equalTo(@60);
    }];
}
- (void)initViewConfigurations {
    self.backgroundColor = [UIColor cyanColor];
}
#pragma mark - getter
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = [UIImage imageNamed:@"WZB_like"];
    }
    return _imageView;
}

@end
