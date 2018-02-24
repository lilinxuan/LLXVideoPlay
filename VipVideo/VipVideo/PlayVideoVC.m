//
//  PlayVideoVC.m
//  VipVideo
//
//  Created by 李林轩 on 2018/2/23.
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



#import "PlayVideoVC.h"

#import <WebKit/WKWebView.h>
@interface PlayVideoVC ()
{
    WKWebView *wkWeb;
    UIView *bottomView;
    int heigh;
}

@property(nonatomic,copy)NSString *vipString;
@end

@implementation PlayVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"视频播放";
    //默认 百域阁
    NSString *urlString = [NSString stringWithFormat:@"http://jiexi.071811.cc/jx.php?url=%@",self.url];
    heigh = 170;
    if ([self.string isEqualToString:@"爱奇艺"]) {
        urlString = [NSString stringWithFormat:@"http://www.sjzvip.com/jiexi1.php?url=%@",self.url];
        heigh = 130;
    }
    

    wkWeb = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0,APPSIZE.width , APPSIZE.height-heigh)];
    
    [wkWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    [self.view addSubview:wkWeb];
    [self creatUI];

}


-(void)creatUI{
    bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, APPSIZE.height-heigh, APPSIZE.width, heigh)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
//    http://api.baiyug.cn/vip/index.php?url=
//    http://jiexi.071811.cc/jx.php?url= 石头云
    NSArray *arrayTitle = @[@"石头云",@"百域阁",@"接口1",@"接口2",@"接口3",@"接口4",@"接口5",@"接口6",@"接口7",@"接口8",@"接口9",@"接口10"];
    if ([self.string isEqualToString:@"爱奇艺"]) {
        arrayTitle = @[@"接口1",@"接口2",@"接口3",@"接口4",@"接口5",@"接口6",@"接口7",@"接口8",@"接口9",@"接口10"];
    }
    float width = (APPSIZE.width-48)/5;
    for (int i=0; i<arrayTitle.count; i++) {
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*width+i*8+8, 25, width, 30)];
        btn.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1];
        [btn setTitle:arrayTitle[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [bottomView addSubview:btn];
        btn.tag = 1001+i;
        if (i>4) {
            
            btn.frame = CGRectMake((i-5)*width+(i-5)*8+8, 70, width, 30);
            
            if (i>9) {
                btn.frame = CGRectMake((i-10)*width+(i-10)*8+8, 115, width, 30);
            }
            
        }
        if (i==0) {
            btn.backgroundColor = [UIColor colorWithRed:50.0/255.0 green:205.0/255.0 blue:50.0/255.0 alpha:1];
        }
        [btn addTarget:self action:@selector(didMenu:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    
    
}
-(void)didMenu:(UIButton*)btn{
    
    btn.backgroundColor = [UIColor colorWithRed:50.0/255.0 green:205.0/255.0 blue:50.0/255.0 alpha:1];
    
    NSInteger row = btn.tag-1001;
    int k=12;
    if ([self.string isEqualToString:@"爱奇艺"]) {
        k=10;
    }
    for (int i=0; i<k; i++) {
        
        if (row != i) {
            UIButton *btns = [bottomView viewWithTag:1001+i];
            btns.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1];
    
        }
        
    }
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.sjzvip.com/jiexi%ld.php?url=%@",row-1,self.url];
    
    if (row == 1) {
        urlString = [NSString stringWithFormat:@"http://api.baiyug.cn/vip/index.php?url=%@",self.url];
    }else if (row == 0){
        urlString = [NSString stringWithFormat:@"http://jiexi.071811.cc/jx.php?url=%@",self.url];
    }
    
    if ([self.string isEqualToString:@"爱奇艺"]) {
        urlString = [NSString stringWithFormat:@"http://www.sjzvip.com/jiexi%ld.php?url=%@",row+1,self.url];
    }
    [wkWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    NSLog(@"%@",urlString);
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
