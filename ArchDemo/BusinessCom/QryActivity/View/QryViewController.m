//
//  ViewController.m
//  ArchDemo
//
//  Created by 方永清 on 07/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "QryViewController.h"

//#import "UIFont+Adapt.h"
#import "QryActivityViewModel.h"
#import "View+MASAdditions.h"

@interface QryViewController ()

//声明视图
@property (nonatomic, strong) UITextField *usernameTF;
@property (nonatomic, strong) UITextField *passwordTF;
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation QryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //添加视图
    [self.view addSubview:self.usernameTF];
    [self.view addSubview:self.passwordTF];
    [self.view addSubview:self.loginBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark -  constraints

- (void)updateViewConstraints{
    [super updateViewConstraints];
    
    //布局
    [self.usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).with.offset(50);
        make.left.equalTo(self.view).with.offset(20);
        make.height.mas_equalTo(@50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        
    }];
    
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.usernameTF.mas_centerX);
        make.height.mas_equalTo(self.usernameTF);
        make.width.mas_equalTo(self.usernameTF);
        make.top.mas_equalTo(self.usernameTF.mas_bottom).with.offset(30);
        
    }];

    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.passwordTF.mas_centerX);
        make.height.mas_equalTo(self.passwordTF);
        make.width.mas_equalTo(self.passwordTF);
        make.top.mas_equalTo(self.passwordTF.mas_bottom).with.offset(30);
        
    }];
}

#pragma mark - getters and setters

- (UITextField *)usernameTF
{
    if (_usernameTF == nil) {
        _usernameTF = [[UITextField alloc] init];
        _usernameTF.placeholder = @"手机号";
        _usernameTF.font = [UIFont systemFontOfSize:20.0f];
        _usernameTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _usernameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _usernameTF.textAlignment = NSTextAlignmentLeft;
        _usernameTF.keyboardType = UIKeyboardTypePhonePad;
        _usernameTF.layer.borderColor = [UIColor grayColor].CGColor;
        _usernameTF.layer.borderWidth = 1.0;
    }
    return _usernameTF;
}

- (UITextField *)passwordTF
{
    if (_passwordTF == nil) {
        _passwordTF = [[UITextField alloc] init];
        _passwordTF.placeholder = @"密码";
//        _passwordTF.font = [UIFont scaleSystemFontOfSize:12.0f];
        _passwordTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTF.textAlignment = NSTextAlignmentLeft;
        _passwordTF.keyboardType = UIKeyboardTypePhonePad;
        _passwordTF.secureTextEntry = YES;
        _passwordTF.layer.borderColor = [UIColor grayColor].CGColor;
        _passwordTF.layer.borderWidth = 1.0;
    }
    return _passwordTF;
}

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
    QryActivityViewModel *viewModel = [[QryActivityViewModel alloc] init];
    [viewModel setBlockWithReturnBlock:^(id returnValue)
     {
         NSLog(@"response success:%@", returnValue);
     } withErrorBlock:^(NSInteger errorCode) {
         NSLog(@"errcode:%ld", errorCode);
     } withFailureBlock:^(NSString *msg){
         NSLog(@"response error:%@", msg);
     }];
    [viewModel qryActivyArray];
}

@end
