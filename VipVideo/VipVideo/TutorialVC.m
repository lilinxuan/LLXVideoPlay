//
//  TutorialVC.m
//  VipVideo
//
//  Created by 李林轩 on 2018/2/22.
//  Copyright © 2018年 李林轩. All rights reserved.
//
#define APPSIZE [[UIScreen mainScreen] bounds].size
#import "TutorialVC.h"
#import "ABCIntroView.h"
@interface TutorialVC ()

@end

@implementation TutorialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    ABCIntroView *abc = [[ABCIntroView alloc]initWithFrame:CGRectMake(0, 0, APPSIZE.width, APPSIZE.height)];
    [self.view addSubview:abc];
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
