//
//  UIView+LLXPushVC.m
//  VipVideo
//
//  Created by 李林轩 on 2018/2/26.
//  Copyright © 2018年 李林轩. All rights reserved.
//

#import "UIView+LLXPushVC.h"

@implementation UIView (LLXPushVC)
@dynamic viewController;
/*
 * 获取所在的控制器
 *
 */
- (UIViewController *)viewController {
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
/*
 * 跳转控制器
 *
 */
-(void)pushViewController:(NSString*)ViewController param:(NSDictionary*)param{
    
    id pushVC = [[NSClassFromString(ViewController) alloc]init];
    if (param) {
        for (NSString *key in param.allKeys) {
            [pushVC setValue:param[key] forKey:key];
        }
    }
    [self.viewController.navigationController pushViewController:pushVC animated:YES];
    
    
    
}

-(void)presentViewController:(NSString *)ViewController animated:(BOOL)Bool param:(NSDictionary*)param{
    
    id pushVC = [[NSClassFromString(ViewController) alloc]init];
    if (param) {
        for (NSString *key in param.allKeys) {
            [pushVC setValue:param[key] forKey:key];
        }
    }
    [self.viewController presentViewController:pushVC animated:Bool completion:nil];
    
}







@end
