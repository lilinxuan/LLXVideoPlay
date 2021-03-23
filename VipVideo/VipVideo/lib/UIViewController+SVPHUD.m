//
//  UIViewController+SVPHUD.m
//  DF
//
//  Created by 李林轩 on 2018/10/29.
//  Copyright © 2018 李林轩. All rights reserved.
//

#import "UIViewController+SVPHUD.h"
#import "SVProgressHUD.h"
@implementation UIViewController (SVPHUD)

-(void)showSucess:(NSString*)string{
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showSuccessWithStatus:string];
    [SVProgressHUD dismissWithDelay:1.8];
    
}

-(void)showError:(NSString*)string{
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showErrorWithStatus:string];
    [SVProgressHUD dismissWithDelay:1.8];
    
    
}
-(void)showText:(NSString*)string{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showImage:imageName(@"") status:string];
    [SVProgressHUD dismissWithDelay:1.8];
}
-(void)showMessage:(NSString*)string{
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showInfoWithStatus:string];
    [SVProgressHUD dismissWithDelay:1.8];
    
}
-(void)showSVP{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD show];
}
-(void)showSVP:(NSString*)string{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:string];
}
-(void)dissSVP{
    [SVProgressHUD dismiss];
}
-(void)showProgress:(float)progress {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showProgress:progress];
}

-(void)showSVPProgress:(float)progress{
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showProgress:progress];
    
    
}



@end
