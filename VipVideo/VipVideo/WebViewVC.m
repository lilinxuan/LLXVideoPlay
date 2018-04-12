//
//  WebViewVC.m
//  VipVideo
//
//  Created by 李林轩 on 2018/2/22.
//  Copyright © 2018年 李林轩. All rights reserved.
//

#define APPSIZE [[UIScreen mainScreen] bounds].size
//是否为iphone X
#define IS_IPHONE_X ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )812 ) < DBL_EPSILON )
//判断如果是iPhone X
#define IOS11_OR_LATER_SPACE(par)({ float space = 0.0;if (@available(iOS 11.0, *)) space = par;(space);})
#define IOS11_OR_LATER_SPACE88(par)({ float space = 64;if (IS_IPHONE_X) space = par;(space);})
#define IOS11_OR_LATER_SPACE20(par)({ float space = 20;if (IS_IPHONE_X) space = par;(space);})

#define JF_KEY_WINDOW    [UIApplication sharedApplication].keyWindow
#define TOP_SPACE88or64     IOS11_OR_LATER_SPACE88(88)
#define TOP_SPACE20or44     IOS11_OR_LATER_SPACE20(44)
#define TOP_SPACE44or0     IOS11_OR_LATER_SPACE(JF_KEY_WINDOW.safeAreaInsets.top)
#define TOP_SPACE24or0     IOS11_OR_LATER_SPACE(MAX(0, JF_KEY_WINDOW.safeAreaInsets.top-20))
#define BOTTOM_SPACE34or0  IOS11_OR_LATER_SPACE(JF_KEY_WINDOW.safeAreaInsets.bottom)

#import "WebViewVC.h"
#import <WebKit/WKWebView.h>
#import "PlayVideoVC.h"

@interface WebViewVC ()
{
    WKWebView *wkWeb;
}

@property (nonatomic,strong) UIBarButtonItem *returnButton;
@property (nonatomic,strong) UIBarButtonItem *closeItem;
@end

@implementation WebViewVC
- (UIBarButtonItem *)returnButton {
    if (!_returnButton) {
        _returnButton = [[UIBarButtonItem alloc] init];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

        [button setTitle:@"  返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(respondsToReturnToBack:) forControlEvents:UIControlEventTouchUpInside];
        [button.titleLabel setFont:[UIFont systemFontOfSize:17]];
 
        [button sizeToFit];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        button.frame = CGRectMake(20, 0, 40, 40);
        _returnButton.customView = button;
        self.navigationItem.leftBarButtonItem = _returnButton;
    }
    return _returnButton;
}
- (UIBarButtonItem *)closeItem {
    if (!_closeItem) {
        _closeItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(respondsToReturnToFind:)];
    }
    return _closeItem;
}

- (void)respondsToReturnToBack:(UIButton *)sender {
    if ([wkWeb canGoBack]) {//判断当前的H5页面是否可以返回
        //如果可以返回，则返回到上一个H5页面，并在左上角添加一个关闭按钮
        [wkWeb goBack];
        self.navigationItem.leftBarButtonItems = @[self.returnButton, self.closeItem];
    } else {
        //如果不可以返回，则直接:
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)respondsToReturnToFind:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self returnButton];
    [self closeItem];
    self.title = self.titleString;
    wkWeb = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0,APPSIZE.width , APPSIZE.height)];
    
    NSString *url = @"http://www.iqiyi.com";
    
    if ([self.titleString isEqualToString:@"腾讯"]) {
        url = @"http://m.v.qq.com";
    }else if ([self.titleString isEqualToString:@"优酷"]){
        url = @"https://www.youku.com";
    }else if ([self.titleString isEqualToString:@"乐视"]){
        url = @"https://m.le.com";
    }else if ([self.titleString isEqualToString:@"搜狐"]){
        //搜狐
        url = @"https://m.tv.sohu.com";
    }
    
    
    
    
    [wkWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self.view addSubview:wkWeb];
    
    [self addRightButton];
}
-(void)addRightButton
{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 44)];
    [btn setTitle:@"点击播放" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:50.0/255.0 green:205.0/255.0 blue:50.0/255.0 alpha:1] forState:UIControlStateNormal];
    btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
    btn.titleLabel.font=[UIFont systemFontOfSize:17];

    [btn addTarget:self action:@selector(didVideoPlay) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem=right;
    
    
}

-(void)didVideoPlay{
    
    NSString *currentURL = wkWeb.URL.absoluteString;
    
    PlayVideoVC *play = [[PlayVideoVC alloc]init];
    play.url = currentURL;
    play.string = self.titleString;
    [self.navigationController pushViewController:play animated:YES];
    
    
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

@end
