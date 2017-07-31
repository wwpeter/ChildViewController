//
//  WZBInformationDetailController.m
//  Wzbao
//
//  Created by wangwei on 16/9/20.
//  Copyright © 2016年 WZBaoWW. All rights reserved.
//

#import "WZBInformationDetailController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface WZBInformationDetailController () <UIScrollViewDelegate>

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) UILabel *myTitle;
//@property (nonatomic, strong) UILabel *bottomLabel;//下面的百分比
@property (nonatomic, strong) UIPageControl *pageControl; // 页码指示器

@end

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@implementation WZBInformationDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initViews];
    [self initConfigurations];
}
- (void)initViews {
    //[self goBack];
    [self addScrollView];
}
- (void)initConfigurations {
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)addScrollView {
    CGRect frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height  -150);
    frame.size.height -= 49;
    self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
    self.scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    
    //
    for (NSInteger i = 0; i < self.dataArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        //NSDictionary *dic = self.dataArray[i];
        //[self.titleArray addObject:dic[@"TITLE"]];
        //NSString *str = dic[@"IMGURL"];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.dataArray[i]]]];
        [_scrollView addSubview:imageView];
    }
    //
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width*self.dataArray.count, 0);
    [self.view addSubview:_scrollView];
    //
    //  在这里就应该让scrollView显示第几张大图片 （设置scrollView的偏移量）
    //NSInteger index = [self.dataArray indexOfObject:self.dataArray[self.myIndex]];
    //[_scrollView setContentOffset:CGPointMake(index*_scrollView.frame.size.width, 0)];
    //self.myTitle.text = self.titleArray[index];
    //self.navigationItem.titleView = self.myTitle;
    
    //[self.view addSubview:self.bottomLabel];
    //self.bottomLabel.text = [NSString stringWithFormat:@"%ld/%ld",index,self.dataArray.count];
    
    [self.view addSubview:self.pageControl];
    //self.pageControl.currentPage = index;
}
#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 在这个代理方法中检测scrollView偏移量，从而计算出当前滚动到第几页了，设置页码指示器，让它指定到相应的页
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.myTitle.text = self.titleArray[page];
    self.navigationItem.titleView = self.myTitle;
   // NSInteger a = self.titleArray.count;
    
    //self.bottomLabel.text = [NSString stringWithFormat:@"%ld/%ld",a,page];
    
    self.pageControl.currentPage = page;
}

- (void)pageControlClick:(UIPageControl *)pageControl {
    NSInteger currentPage = pageControl.currentPage;
    
    // 根据页码设置scrollView的滚动的偏移量
    [_scrollView setContentOffset:CGPointMake(currentPage*_scrollView.frame.size.width, 0) animated:YES];
}

#pragma mark - getter
- (NSMutableArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}
- (UILabel *)myTitle {
    if (!_myTitle) {
        _myTitle = [[UILabel alloc] init];
        _myTitle.frame = CGRectMake(0, 0, SCREEN_WIDTH*0.6, 44);
        _myTitle.textColor = [UIColor whiteColor];
        _myTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _myTitle;
}
//- (UILabel *)bottomLabel {
//    if (!_bottomLabel) {
//        _bottomLabel = [[UILabel alloc] init];
//        _bottomLabel.frame = CGRectMake(SCREEN_WIDTH*0.5-60, SCREEN_HEIGHT-50, 60, 30);
//        _bottomLabel.textColor = [UIColor whiteColor];
//    }
//    return _bottomLabel;
//}
- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(_scrollView.frame)-40, _scrollView.frame.size.width-80, 40)];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        //_pageControl.currentPageIndicatorTintColor = Kback;
        _pageControl.numberOfPages = self.dataArray.count; // 一共3页，也就是说会有3个小圆点
       // [_pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventValueChanged]; // 当点击pageControl的时候触发pageControlClick:方法，注意：这个控件以中间的小圆点为准，如果点击的是中间小圆点右侧，页码指示符指向一页，如果点的是中间小圆点的左侧，页码指示器指向前一页
    }
    return _pageControl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
