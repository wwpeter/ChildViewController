//
//  WZBInformationCell.m
//  Wzbao
//
//  Created by wangwei on 16/8/17.
//  Copyright © 2016年 WZBaoWW. All rights reserved.
//

#import "WZBInformationCell.h"
#import "Masonry.h"
//#import <SDWebImage/UIImageView+WebCache.h>

@interface WZBInformationCell()
@property (nonatomic) UIImageView *myImageView;
@property (nonatomic) UILabel *bottomLabel;
@end
@implementation WZBInformationCell

- (instancetype)initWithFrame:(CGRect)frame {
    self= [super initWithFrame:frame];
    if (self) {
        [self initViews];
        [self initViewConfiguration];
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
- (void)initViews {
    [self.contentView addSubview:self.myImageView];
    [self.contentView addSubview:self.bottomLabel];
}
- (void)initViewLayouts {
    //@weakify(self)
    [self.myImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //@strongify(self)
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //@strongify(self)
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@20);
    }];
}
- (void)initViewConfiguration {

}
#pragma mark _actions
- (void)configData:(NSDictionary *)data {
    NSURL *url = [NSURL URLWithString:data[@"IMGURL"]];
    //[self.myImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"WZB_financial_place"]];
    self.bottomLabel.text = data[@"TITLE"];
}
#pragma mark - getter
- (UIImageView *)myImageView {
    if (!_myImageView) {
        _myImageView = [[UIImageView alloc] init];
        _myImageView.contentMode = UIViewContentModeScaleAspectFit;
        _myImageView.image = [UIImage imageNamed:@"hongbao"];
    }
    return _myImageView;
}
- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.textColor = [UIColor whiteColor];
        _bottomLabel.text = @"驾驶证";
        //_bottomLabel.font = kFont(13);
        _bottomLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    }
    return _bottomLabel;
}
@end
