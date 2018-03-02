//
//  HomeVC.m
//  VipVideo
//
//  Created by 李林轩 on 2018/2/22.
//  Copyright © 2018年 李林轩. All rights reserved.
//

#define APPSIZE [[UIScreen mainScreen] bounds].size

#import "HomeVC.h"
#import "WebViewVC.h"
#import "TutorialVC.h"
@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"VIP播放";
    
    
    NSArray *arrayTitle = @[@"爱奇艺",@"腾讯",@"优酷",@"乐视",@"搜狐",@"播放教程"];
    NSArray *arrayColor = @[[UIColor colorWithRed:50.0/255.0 green:205.0/255.0 blue:50.0/255.0 alpha:1],[UIColor orangeColor],[UIColor colorWithRed:30.0/255.0 green:144.0/255.0 blue:255.0/255.0 alpha:1],[UIColor redColor],[UIColor colorWithRed:240.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1],[UIColor grayColor]];
    
    float width = (APPSIZE.width-120)/2;
    
    for (int i=0; i<arrayTitle.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*width+i*40+40, 120, width, width)];
        btn.backgroundColor = arrayColor[i];
        [btn setTitle:arrayTitle[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
        [self.view addSubview:btn];
        btn.tag = 1000+i;
        if (i>1) {
            
            btn.frame = CGRectMake((i-2)*width+(i-2)*40+40, 140+width, width, width);
            if (i>3) {
                btn.frame = CGRectMake((i-4)*width+(i-4)*40+40, 160+width*2, width, width);
            }
        }
        [btn addTarget:self action:@selector(didMenu:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, APPSIZE.height-50, APPSIZE.width-20, 50)];
    lab.textColor = [UIColor blackColor];
    lab.font = [UIFont systemFontOfSize:12];
    lab.numberOfLines = 0;
    lab.text = @"本app只提供测试使用，所提供解析服务均由网上搜集。如侵犯了您的权益请联系我wx：942944822";
    [self.view addSubview:lab];
    
}

-(void)didMenu:(UIButton*)btn{
    
    NSInteger row = btn.tag;
    
    if (row>1004) {
        //帮助
        TutorialVC *V = [[TutorialVC alloc]init];
        [self.navigationController pushViewController:V animated:YES];
    }else{
        
        WebViewVC *web = [[WebViewVC alloc]init];
        web.titleString = btn.titleLabel.text;
        [self.navigationController pushViewController:web animated:YES];
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
