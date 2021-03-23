//
//  UIViewController+SVPHUD.h
//  DF
//
//  Created by 李林轩 on 2018/10/29.
//  Copyright © 2018 李林轩. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SVPHUD)

-(void)showSucess:(NSString*)string;
-(void)showError:(NSString*)string;
-(void)showMessage:(NSString*)string;
-(void)showText:(NSString*)string;
-(void)showSVP;
-(void)showSVP:(NSString*)string;
-(void)showProgress:(float)progress;
-(void)dissSVP;
-(void)showSVPProgress:(float)progress;
@end

NS_ASSUME_NONNULL_END
