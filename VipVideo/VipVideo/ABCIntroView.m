//
//  IntroView.m
//  DrawPad
//
//  Created by Adam Cooper on 2/4/15.
//  Copyright (c) 2015 Adam Cooper. All rights reserved.
//

#import "ABCIntroView.h"
#define APPSIZE [[UIScreen mainScreen] bounds].size
#define RGBA(r,g,b,a)                     [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
@interface ABCIntroView () <UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIButton *doneButton;

@property (strong, nonatomic) UIView *viewOne;
@property (strong, nonatomic) UIView *viewTwo;
@property (strong, nonatomic) UIView *viewThree;
@property (strong, nonatomic) UIView *viewFour;


@end

@implementation ABCIntroView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
   
        
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
    
        [self.scrollView addSubview:self.viewOne];
        [self.scrollView addSubview:self.viewTwo];
        [self.scrollView addSubview:self.viewThree];
//        [self.scrollView addSubview:self.viewFour];
        
        
        //Done Button
//        [self.scrollView addSubview:self.doneButton];
        self.backgroundColor=[UIColor clearColor];


    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = CGRectGetWidth(self.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.pageControl.currentPage = roundf(pageFraction);
    if (scrollView.contentOffset.x>=APPSIZE.width) {
        self.scrollView.bounces=YES;
    }else{
       self.scrollView.bounces=NO;
        
    }
    

}

-(UIView *)viewOne {
    if (!_viewOne) {
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height-64;
        _viewOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, originWidth, originHeight)];
        
//        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
//        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
//        titleLabel.text = [NSString stringWithFormat:@"Pixifly"];
//        titleLabel.font = [UIFont systemFontOfSize:40.0];
//        titleLabel.textColor = [UIColor whiteColor];
//        titleLabel.textAlignment =  NSTextAlignmentCenter;
//        titleLabel.numberOfLines = 0;
//        [_viewOne addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:_viewOne.bounds];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"1.jpeg"];
            // 读取gif图片数据
//        NSData *data = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"u=1147328086,3957040917&fm=21&gp=0" ofType:@"gif"]];
//        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.bounds];
//        [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
        

        [_viewOne addSubview:imageview];
//        [_viewOne addSubview:webView];
//        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.7, self.frame.size.width*.8, 60)];
//        descriptionLabel.text = [NSString stringWithFormat:@"Description for First Screen."];
//        descriptionLabel.font = [UIFont systemFontOfSize:18.0];
//        descriptionLabel.textColor = [UIColor whiteColor];
//        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
//        descriptionLabel.numberOfLines = 0;
//        [descriptionLabel sizeToFit];
//        [_viewOne addSubview:descriptionLabel];
//        
//        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.7);
//        descriptionLabel.center = labelCenter;
        
    }
    return _viewOne;
    
}

-(UIView *)viewTwo {
    if (!_viewTwo) {
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height-64;
        
        _viewTwo = [[UIView alloc] initWithFrame:CGRectMake(originWidth, 0, originWidth, originHeight)];
        
//        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
//        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
//        titleLabel.text = [NSString stringWithFormat:@"DropShot"];
//        titleLabel.font = [UIFont systemFontOfSize:40.0];
//        titleLabel.textColor = [UIColor whiteColor];
//        titleLabel.textAlignment =  NSTextAlignmentCenter;
//        titleLabel.numberOfLines = 0;
//        [_viewTwo addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:_viewTwo.bounds];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"2.jpeg"];
        [_viewTwo addSubview:imageview];
        
//        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.7, self.frame.size.width*.8, 60)];
//        descriptionLabel.text = [NSString stringWithFormat:@"Description for Second Screen."];
//        descriptionLabel.font = [UIFont systemFontOfSize:18.0];
//        descriptionLabel.textColor = [UIColor whiteColor];
//        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
//        descriptionLabel.numberOfLines = 0;
//        [descriptionLabel sizeToFit];
//        [_viewTwo addSubview:descriptionLabel];
//        
//        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.7);
//        descriptionLabel.center = labelCenter;
    }
    return _viewTwo;
    
}

-(UIView *)viewThree{
    
    if (!_viewThree) {
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height-64;
        
        _viewThree = [[UIView alloc] initWithFrame:CGRectMake(originWidth*2, 0, originWidth, originHeight)];
        
//        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
//        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
//        titleLabel.text = [NSString stringWithFormat:@"Shaktaya"];
//        titleLabel.font = [UIFont systemFontOfSize:40.0];
//        titleLabel.textColor = [UIColor whiteColor];
//        titleLabel.textAlignment =  NSTextAlignmentCenter;
//        titleLabel.numberOfLines = 0;
//        [_viewThree addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:_viewThree.bounds];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"3.jpeg"];
        [_viewThree addSubview:imageview];
        
        
//        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.7, self.frame.size.width*.8, 60)];
//        descriptionLabel.text = [NSString stringWithFormat:@"Description for Third Screen."];
//        descriptionLabel.font = [UIFont systemFontOfSize:18.0];
//        descriptionLabel.textColor = [UIColor whiteColor];
//        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
//        descriptionLabel.numberOfLines = 0;
//        [descriptionLabel sizeToFit];
//        [_viewThree addSubview:descriptionLabel];
//        
//        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.7);
//        descriptionLabel.center = labelCenter;
    }
    return _viewThree;
    
}

-(UIView *)viewFour {
    if (!_viewFour) {
    
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height;
        
        _viewFour = [[UIView alloc] initWithFrame:CGRectMake(originWidth*3, 0, originWidth, originHeight)];
        
//        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
//        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
//        titleLabel.text = [NSString stringWithFormat:@"Punctual"];
//        titleLabel.font = [UIFont systemFontOfSize:40.0];
//        titleLabel.textColor = [UIColor whiteColor];
//        titleLabel.textAlignment =  NSTextAlignmentCenter;
//        titleLabel.numberOfLines = 0;
//        [_viewFour addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.bounds];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"引导页_4"];
        [_viewFour addSubview:imageview];
        
//        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.7, self.frame.size.width*.8, 60)];
//        descriptionLabel.text = [NSString stringWithFormat:@"Description for Fourth Screen."];
//        descriptionLabel.font = [UIFont systemFontOfSize:18.0];
//        descriptionLabel.textColor = [UIColor whiteColor];
//        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
//        descriptionLabel.numberOfLines = 0;
//        [descriptionLabel sizeToFit];
//        [_viewFour addSubview:descriptionLabel];
        
//        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.7);
//        descriptionLabel.center = labelCenter;
        
    }
    return _viewFour;
    
}

-(UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        [_scrollView setDelegate:self];
        [_scrollView setPagingEnabled:YES];
        _scrollView.showsHorizontalScrollIndicator=NO;
        [_scrollView setContentSize:CGSizeMake(self.frame.size.width*3, self.frame.size.height-64)];
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    return _scrollView;
}

-(UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height-22, self.frame.size.width, 10)];
        [_pageControl setCurrentPageIndicatorTintColor:RGBA(255, 187, -17, 1)];
        _pageControl.pageIndicatorTintColor=RGBA(213, 213, 213, 1);
        [_pageControl setNumberOfPages:3];
    }
    return _pageControl;
}

-(UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width*2, 0, self.frame.size.width, self.frame.size.height)];
//        [_doneButton setTintColor:[UIColor whiteColor]];
//        [_doneButton setTitle:@"Let's Go!" forState:UIControlStateNormal];
//        [_doneButton.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
//        [_doneButton setBackgroundColor:RGBA(255, 187, -17, 1)];
        [_doneButton addTarget:self.delegate action:@selector(onDoneButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}



@end
