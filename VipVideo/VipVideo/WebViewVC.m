//
//  WebViewVC.m
//  VipVideo
//
//  Created by 李林轩 on 2018/2/22.
//  Copyright © 2018年 李林轩. All rights reserved.
//

#import "WebViewVC.h"
#import <WebKit/WebKit.h>
#import "PlayVideoVC.h"

@interface WebViewVC ()<WKUIDelegate>
{
    WKWebView *wkWeb;
}

@property (nonatomic,strong) UIBarButtonItem *returnButton;
@property (nonatomic,strong) UIBarButtonItem *closeItem;
@property (nonatomic, strong) UIProgressView * progressView;
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
- (UIProgressView *)progressView {
    if (!_progressView){
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, TOP_SPACE88or64, self.view.frame.size.width, 5)];
        _progressView.tintColor = RGB(71, 140,239);
        _progressView.trackTintColor = [UIColor clearColor];
    }
    return _progressView;
}
- (void)dealloc{
    //移除注册的js方法

    [wkWeb removeObserver:self
                  forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];

    [wkWeb removeObserver:self
    forKeyPath:NSStringFromSelector(@selector(title))];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self returnButton];
    [self closeItem];
    self.title = self.titleString;
    wkWeb = [[WKWebView alloc]initWithFrame:CGRectMake(0, TOP_SPACE88or64,APPSIZE.width , APPSIZE.height-TOP_SPACE88or64)];
    wkWeb.UIDelegate =self;
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
    //添加监测网页加载进度的观察者
    [wkWeb addObserver:self
                   forKeyPath:NSStringFromSelector(@selector(estimatedProgress))
                      options:0
                      context:nil];
    [wkWeb addObserver:self
    forKeyPath:@"title"
       options:NSKeyValueObservingOptionNew
       context:nil];
    
    [wkWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self.view addSubview:wkWeb];
    [self.view addSubview:self.progressView];
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
#pragma mark - KVO
//kvo 监听进度 必须实现此方法
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]
        && object == wkWeb) {
        
        NSLog(@"网页加载进度 = %f",wkWeb.estimatedProgress);
        self.progressView.progress = wkWeb.estimatedProgress;
        if (wkWeb.estimatedProgress >= 1.0f) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressView.progress = 0;
            });
        }
        
    }else if([keyPath isEqualToString:@"title"]
             && object == wkWeb){
        self.title = wkWeb.title;
    }else{
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
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
