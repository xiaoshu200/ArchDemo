//
//  DiscoverVC.m
//  ArchDemo
//
//  Created by 方永清 on 03/03/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "DiscoverVC.h"
#import "View+MASAdditions.h"
#import "DiscoveryDetailVC.h"

#import "QryActivityViewModel.h"

@interface DiscoverVC ()

//声明视图
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation DiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"发现";
    
    /*
     UIViewController的View和导航栏的显示是这样的, 默认的, 如果导航栏设置为有透明度的(默认就是半透明的), UIViewController的View就会被导航栏覆盖
     如果不想被覆盖, 可以使用以下代码解决(控制器中调用):
     self.edgesForExtendedLayout = UIRectEdgeNone;
     
     反之, 如果导航栏是不透明的, 默认UIViewController的View就会往下移, 在导航栏下显示, 如果不想往下移, 可以实现如下代码(控制器中调用)：
     self.extendedLayoutIncludesOpaqueBars = YES;
     */
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //添加视图
    [self.view addSubview:self.loginBtn];
    
    QryActivityViewModel *viewModel = [[QryActivityViewModel alloc] init];
    [viewModel qryActivyArray];
    
    [self updateConstraints];
}

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

#pragma mark -  constraints

- (void)updateConstraints{
    
    //布局
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).with.offset(50);
        make.left.equalTo(self.view).with.offset(20);
        make.height.mas_equalTo(@50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        
    }];
}

#pragma mark - getters and setters

- (UIButton *)loginBtn
{
    if (_loginBtn == nil) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"btn_red_big"] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        //        _loginBtn.titleLabel.font = [UIFont scaleSystemFontOfSize:14.0f];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

#pragma mark - private methods

- (void)loginEvent
{
    DiscoveryDetailVC *detailVC = [[DiscoveryDetailVC alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
