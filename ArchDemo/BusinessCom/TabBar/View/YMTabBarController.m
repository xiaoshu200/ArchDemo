//
//  YMTabBarController.m
//  ArchDemo
//
//  Created by elegance on 17/2/23.
//  Copyright © 2017年 com.pingan. All rights reserved.
//

#import "YMTabBarController.h"
#import "LifeViewController.h"
#import "MineViewController.h"
#import "MainViewController.h"
#import "NewsViewController.h"
#import "FinanceViewController.h"
#import <Masonry.h>
#import "UIColor+YM.h"

@interface YMTabBarController ()
//@property(nonatomic, strong)NSMutableArray *tabBarItemArr;
//@property(nonatomic, strong)UIView *ymTabBar;
//@property(nonatomic, assign)BOOL isSelected;
//@property(nonatomic, assign)UIButton *preBtn;
@end

@implementation YMTabBarController

#pragma mark - TabBarControllerLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tabBar.hidden = YES;
//    [self.view addSubview:self.ymTabBar];
    [self setYMTabBarViewControllers];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
//    [self.tabBarItemArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
//    [self.tabBarItemArr mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(self.ymTabBar);
//        make.topMargin.bottomMargin.mas_equalTo(0);
//    }];
}

#pragma mark - event response
/*
-(void)btnClick:(id)sender{
    UIButton *selectBtn = (UIButton *)sender;
    if (self.preBtn.tag == selectBtn.tag) {
        return;
    }
    self.selectedIndex = selectBtn.tag-123;
    selectBtn.selected = YES;
    self.preBtn.selected = NO;
    self.preBtn = selectBtn;

}*/

#pragma mark - private mothod

//设置分栏控制器装置的视图控制器
-(void)setYMTabBarViewControllers{
    MainViewController *mainVc = [[MainViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVc];
    mainNav.tabBarItem.title = @"首页";
    mainNav.tabBarItem.image = [UIImage imageNamed:@"tab_main"];
    mainNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_main_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    LifeViewController *lifeVc = [[LifeViewController alloc] init];
    UINavigationController *lifeNav = [[UINavigationController alloc] initWithRootViewController:lifeVc];
    lifeNav.tabBarItem.title = @"生活";
    lifeNav.tabBarItem.image = [UIImage imageNamed:@"tab_life"];
    //选中显示图片而不是填充颜色，更改图片的填充模式
    lifeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_life_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    FinanceViewController *financeVc = [[FinanceViewController alloc] init];
    UINavigationController *financeNav = [[UINavigationController alloc] initWithRootViewController:financeVc];
    financeNav.tabBarItem.title = @"金融";
    financeNav.tabBarItem.image = [UIImage imageNamed:@"tab_finance"];
    
    financeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_finance_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    NewsViewController *newsVc = [[NewsViewController alloc] init];
    UINavigationController *newsNav = [[UINavigationController alloc] initWithRootViewController:newsVc];
    newsNav.tabBarItem.title = @"资讯";
    newsNav.tabBarItem.image = [UIImage imageNamed:@"tab_news"];
    
    newsNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_news_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    MineViewController *mineVc = [[MineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVc];
    mineNav.tabBarItem.title = @"我的";
    mineNav.tabBarItem.image = [UIImage imageNamed:@"tab_mine"];
    mineNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.viewControllers = @[mainNav,lifeNav,financeNav,newsNav,mineNav];
    self.tabBar.tintColor = [UIColor ym_colorWithHexString:@"#a98142"];

}


//创建分栏控制器各个Item视图
/**
-(void)createYMTabBarItems{
    self.tabBarItemArr = [NSMutableArray array];
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor clearColor];
        btn.tag = 123+i;
        btn.showsTouchWhenHighlighted = YES;
        UIImage *nomalImage = [UIImage imageNamed:[NSString stringWithFormat:@"tab_%d",i+1]];
        UIImage *selectImage = [UIImage imageNamed:[NSString stringWithFormat:@"tab_selected_%d",i+1]];
        [btn setImage:nomalImage forState:UIControlStateNormal];
        [btn setImage:selectImage forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self.ymTabBar addSubview:btn];
        [self.tabBarItemArr addObject:btn];
    }
}*/

#pragma mark - getter
/*
-(UIView *)ymTabBar{
    if (!_ymTabBar) {
        self.ymTabBar = [UIView new];
        self.ymTabBar.frame = CGRectMake(0, self.view.frame.size.height-64, self.view.frame.size.width, 64);
        self.ymTabBar.layer.borderWidth = 0.5;
        self.ymTabBar.layer.borderColor = [[UIColor grayColor] CGColor];
        [self createYMTabBarItems];
    }
    return _ymTabBar;
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
