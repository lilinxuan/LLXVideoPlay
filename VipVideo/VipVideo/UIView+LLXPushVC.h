//
//  UIView+LLXPushVC.h
//  VipVideo
//
//  Created by 李林轩 on 2018/2/26.
//  Copyright © 2018年 李林轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LLXPushVC)
@property(nonatomic,weak)UIViewController *viewController;//用于跳转
/*
 * view/cell  跳转控制器
 * param KVC传值-公有变量，没有就传nil
 */
-(void)pushViewController:(NSString*)ViewController param:(NSDictionary*)param;
/*
 * view/cell  跳转控制器
 * param KVC传值-公有变量，没有就传nil
 */
-(void)presentViewController:(NSString*)ViewController animated:(BOOL)Bool param:(NSDictionary*)param;

/*
cell或者view类里的传值跳转示例：
 NSDictionary *param = @{@"hidesBottomBarWhenPushed":@YES,
@"ID":@"566",
@"bigtype":@"2",
@"type":@1
};
[self pushViewController:@"此处写控制器类名" param:param];
 */
@end
