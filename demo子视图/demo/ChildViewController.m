//
//  ChildViewController.m
//  demo
//
//  Created by wangwei on 2017/7/31.
//  Copyright © 2017年 wangwei-WW. All rights reserved.
//

#import "ChildViewController.h"
#import "WZBInformationCell.h"
#import "WZBInformationDetailController.h"
#import "WyzAlbumViewController.h"

@interface ChildViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *myCollectionView;

@end

NSString *const ChildViewControllerIdentifier = @"ChildViewControllerIdentifier";

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    [self initViewConfigurations];
}
- (void)initViews {
    [self.view addSubview:self.myCollectionView];
}
- (void)initViewConfigurations {

}

#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //self.height = arc4random()%10+1;
    return self.height;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WZBInformationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ChildViewControllerIdentifier forIndexPath:indexPath];

    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self showPhotoBrowser:0];
}
//显示图片浏览器
-(void)showPhotoBrowser:(NSInteger)index{
    WyzAlbumViewController *wyzAlbumVC = [[WyzAlbumViewController alloc]init];
    
    wyzAlbumVC.currentIndex =index;//这个参数表示当前图片的index，默认是0
    //图片数组，可以是url，也可以是UIImage
    //第一种用url
    NSArray *arr = @[@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1501485769&di=777ed05cffd96db64ac42d88e9cbe63a&src=http://pic.newssc.org/0/12/03/47/12034703_983550.jpg",@"http://img1.cache.netease.com/catchpic/B/B2/B2C80A623E0F28617FDBB7E40D69E187.jpg",@"http://www.sznews.com/szsbcar/images/001921ad0b15096e699c02.jpg",@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1501485769&di=777ed05cffd96db64ac42d88e9cbe63a&src=http://pic.newssc.org/0/12/03/47/12034703_983550.jpg",@"http://img1.cache.netease.com/catchpic/B/B2/B2C80A623E0F28617FDBB7E40D69E187.jpg",@"http://images.rednet.cn/articleimage/2015/11/09/101528557.jpg"];
//    NSMutableArray *arr = [NSMutableArray array];
//    for (NSDictionary *dic in self.listArr) {
//        [arr addObject:dic[@"IMGURL"]];
//    }
//    NSMutableArray *titleArr = [NSMutableArray array];
//    for (NSDictionary *titleDic in self.listArr) {
//        [titleArr addObject:titleDic[@"TITLE"]];
//    }
    wyzAlbumVC.imgArr = (NSMutableArray *)arr;
   // wyzAlbumVC.imageNameArray= titleArr;//图片名字数组可以为空
    //进入动画
    [self presentViewController:wyzAlbumVC animated:YES completion:^{
    }];
}

#pragma mark - getter
- (UICollectionView *)myCollectionView {
    if (!_myCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/4-15, SCREEN_HEIGHT*0.17);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, SCREEN_HEIGHT-64) collectionViewLayout:layout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.scrollEnabled = NO;
        [_myCollectionView registerClass:[WZBInformationCell class] forCellWithReuseIdentifier:ChildViewControllerIdentifier];
        _myCollectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_myCollectionView];
        _myCollectionView.backgroundColor = [UIColor yellowColor];
    }
    return _myCollectionView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
