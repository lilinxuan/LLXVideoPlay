//
//  PlayVideoVC.m
//  VipVideo
//
//  Created by 李林轩 on 2018/2/23.
//  Copyright © 2018年 李林轩. All rights reserved.
//



#import "PlayVideoVC.h"
#import <WebKit/WebKit.h>
@interface PlayVideoVC ()<WKUIDelegate>
@property (strong, nonatomic) WKWebView * webView;
@property (nonatomic, strong) UIProgressView * progressView;
@end

@implementation PlayVideoVC

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    _webView.scrollView.contentInset = UIEdgeInsetsZero;
    _webView.scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
    
}

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, TOP_SPACE88or64, APPSIZE.width, APPSIZE.height-TOP_SPACE88or64)];
        _webView.UIDelegate =self;
        _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _webView.contentMode = UIViewContentModeRedraw;
        _webView.opaque = YES;
    }
    return _webView;
}
- (UIProgressView *)progressView {
    if (!_progressView){
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, TOP_SPACE88or64, self.view.frame.size.width, 2)];
        _progressView.tintColor = RGB(71, 140,239);
        _progressView.trackTintColor = [UIColor clearColor];
    }
    return _progressView;
}
- (void)dealloc{
    //移除注册的js方法

    [_webView removeObserver:self
                  forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];

    [_webView removeObserver:self
    forKeyPath:NSStringFromSelector(@selector(title))];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"视频播放";
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    //添加监测网页加载进度的观察者
    [self.webView addObserver:self
                   forKeyPath:NSStringFromSelector(@selector(estimatedProgress))
                      options:0
                      context:nil];
    [self.webView addObserver:self
    forKeyPath:@"title"
       options:NSKeyValueObservingOptionNew
       context:nil];
    NSString *playUrl = [NSString stringWithFormat:@"https://www.pangujiexi.cc/jiexi.php?url=%@",self.url];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:playUrl]]];
    //    [self addBottomView];
    
    // Do any additional setup after loading the view.
}
#pragma mark - KVO
//kvo 监听进度 必须实现此方法
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]
        && object == _webView) {
        
        NSLog(@"网页加载进度 = %f",_webView.estimatedProgress);
        self.progressView.progress = _webView.estimatedProgress;
        if (_webView.estimatedProgress >= 1.0f) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressView.progress = 0;
            });
        }
        
    }else if([keyPath isEqualToString:@"title"]
             && object == _webView){
//        self.title = _webView.title;
    }else{
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = navigationAction.request.URL;
    if ([url.scheme isEqualToString:@"tel"])
    {
        if ([app canOpenURL:url])
        {
            [app openURL:url];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    if ([url.absoluteString containsString:@"apps.apple.com"])
    {
        if ([app canOpenURL:url])
        {
            [app openURL:url];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    decisionHandler(WKNavigationActionPolicyAllow);
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
