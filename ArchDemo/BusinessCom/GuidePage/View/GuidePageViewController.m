//
//  IntrodctionViewController.m
//  ArchDemo
//
//  Created by elegance on 17/2/15.
//  Copyright © 2017年 com.pingan. All rights reserved.
//

#import "GuidePageViewController.h"
#import <Masonry.h>
#import "TabbarManager.h"

@interface GuidePageViewController ()<UIScrollViewDelegate>
@property(nonatomic, strong)UIScrollView *introdctPageScrollView;
@property(nonatomic, strong)NSMutableArray *introdctImageViewsArr;
@end

@implementation GuidePageViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.introdctPageScrollView];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    //给滚动视图添加布局约束
    [self.introdctPageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width,self.view.frame.size.height));
        
    }];
    
    //给数组里的imageView添加布局约束
    [self.introdctImageViewsArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [self.introdctImageViewsArr mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.equalTo(self.introdctPageScrollView);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewdelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //超过第四屏就创建TabBar到APP主页
    if (scrollView.contentOffset.x>self.introdctPageScrollView.frame.size.width*3) {
        [TabbarManager createTabbar];
    }
}

#pragma mark - event response

#pragma mark - private method
//创建显示图片视图
-(void)createIntrodctImageViews{
    
    NSInteger imageNum = 4;
    for (int i = 0; i < imageNum; i++) {
        UIImageView *introdctImageView = [UIImageView new];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"guide_0%d",i+1]];
        introdctImageView.image = image;
        [self.introdctPageScrollView addSubview:introdctImageView];
        [self.introdctImageViewsArr addObject:introdctImageView];
    }
}
#pragma mark - setter

#pragma mark - getter

-(UIScrollView *)introdctPageScrollView{
    
    if (!_introdctPageScrollView) {
        _introdctPageScrollView = [UIScrollView new];
        _introdctPageScrollView.backgroundColor = [UIColor whiteColor];
        _introdctPageScrollView.pagingEnabled = YES;
        _introdctPageScrollView.delegate = self;
        _introdctPageScrollView.contentSize = CGSizeMake(4 * CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
        [self createIntrodctImageViews];
    }
    return _introdctPageScrollView;
}

-(NSMutableArray *)introdctImageViewsArr{
    
    if (!_introdctImageViewsArr) {
        _introdctImageViewsArr = [NSMutableArray array];
    }
    return _introdctImageViewsArr;
}

@end
