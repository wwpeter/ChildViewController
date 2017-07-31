//
//  ViewController.m
//  demo
//
//  Created by wangwei on 2017/7/31.
//  Copyright © 2017年 wangwei-WW. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"
#import "TableViewHeadView.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewHeadView *headView;
@property (nonatomic, strong) ChildViewController *childView;

@property (nonatomic, assign) NSInteger height;
@end
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

NSString *const XXViewControllerIdentifier = @"XXViewControllerIdentifier";
NSString *const XXViewControllerIdentifier1 = @"XXViewControllerIdentifier1";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initViews];
    [self initViewConfigurations];
    [self initViewLayouts];
}
#pragma mark - initializations
- (void)initViews {
    self.height = arc4random()%10+1;
    [self addChildViewController:self.childView];
    [self.view addSubview:self.tableView];
    
}
- (void)initViewConfigurations {
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)initViewLayouts {

}

#pragma mark - <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    } else {
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:XXViewControllerIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:XXViewControllerIdentifier];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        NSArray *arr = @[@"姓名",@"性别",@"住址",@"婚姻",@"男人"];
        cell.textLabel.text = arr[indexPath.row];
        cell.detailTextLabel.text = arr[indexPath.row];
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:XXViewControllerIdentifier1];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:XXViewControllerIdentifier1];
            //cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        [cell.contentView addSubview:self.childView.view];
        return cell;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return self.headView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return 64;
    } else {
        return 0;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return 40;
    } else {
        NSInteger a= self.height/4;
        NSInteger b = self.height%4;
        if (a>0) {
            if (b>0) {
                return (a+1)*SCREEN_HEIGHT*0.17+10;//根据数据动态配置
            } else {
                return a*SCREEN_HEIGHT*0.17+10;//根据数据动态配置
            }
        }
        return SCREEN_HEIGHT*0.17+10;//根据数据动态配置
    }
    
}
#pragma mark - action

#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:XXViewControllerIdentifier];
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}
- (TableViewHeadView *)headView {
    if (!_headView) {
        _headView = [[TableViewHeadView alloc] init];
    }
    return _headView;
}
- (ChildViewController *)childView {
    if (!_childView) {
        _childView = [[ChildViewController alloc] init];
        _childView.height = self.height;//SCREEN_HEIGHT*0.17
        _childView.view.clipsToBounds = YES;
        //_childView = [[UINavigationController alloc] initWithRootViewController:vc];
    }
    return _childView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
