//
//  ViewController.m
//  ArchDemo
//
//  Created by 方永清 on 07/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "QryViewController.h"

#import "QryActivityViewModel.h"
#import "View+MASAdditions.h"

@interface QryViewController ()

//声明视图
@property (nonatomic, strong) UITextField *usernameTF;
@property (nonatomic, strong) UITextField *passwordTF;

@end

@implementation QryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
    
    //添加视图
    [self.view addSubview:self.usernameTF];
    [self.view addSubview:self.passwordTF];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //布局
    [self.usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //将sv居中(很容易理解吧?)
        make.center.equalTo(self.view);
        
        make.size.mas_equalTo(CGSizeMake(300, 50));
    }];
}

#pragma mark - getters and setters

- (UITextField *)usernameTF
{
    if (_usernameTF == nil) {
        _usernameTF = [[UITextField alloc] init];
        _usernameTF.placeholder = @"手机号";
        _usernameTF.font = [UIFont systemFontOfSize:12.0f];
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
        _passwordTF.font = [UIFont systemFontOfSize:12.0f];
        _passwordTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTF.textAlignment = NSTextAlignmentLeft;
        _passwordTF.keyboardType = UIKeyboardTypePhonePad;
        _passwordTF.secureTextEntry = YES;
    }
    return _passwordTF;
}

@end
