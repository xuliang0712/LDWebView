//
//  ViewController.m
//  Quantum
//
//  Created by Sula on 2017/6/30.
//  Copyright © 2017年 com.daweiwenhua.SilkRoad. All rights reserved.
//

#import "ViewController.h"
#import "WebviewProgressLine.h"
#import "UIView+Frame.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;

@property (nonatomic,strong) WebviewProgressLine  *progressLine;///< 网页加载进度条

@end

@implementation ViewController

#pragma mark - 懒加载
/**********   webView   ************/
-(UIWebView *)webView{
    if (_webView == nil) {
        
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _webView.delegate = self;
        
        [self.view insertSubview:_webView atIndex:0];
    }
    
    return _webView;
}

/**********   进度条   ************/
-(WebviewProgressLine *)progressLine{
    
    if (_progressLine == nil) {
        
        _progressLine = [[WebviewProgressLine alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 4)];
        
        _progressLine.lineColor = [UIColor greenColor];
    }
    
    return _progressLine;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.lalzjt.org/client/index.aspx"]]];
    
    [self.view addSubview:self.progressLine];
    
    /**********   返回按钮   ************/
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backBtn.frame = CGRectMake(self.view.width - 60, self.view.height - 40, 80, 30);
    
    backBtn.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:.4];
    
    backBtn.layer.masksToBounds = YES;
    
    backBtn.layer.cornerRadius = 15;
    
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    
    [backBtn addTarget:self action:@selector(GoBack:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view insertSubview:backBtn atIndex:1];
    
}


#pragma mark - UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.progressLine startLoadingAnimation];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.progressLine endLoadingAnimation];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.progressLine endLoadingAnimation];
}



#pragma mark - 返回按钮事件
-(void)GoBack:(UIButton *)sender{
    
    if ([self.webView canGoBack]) {
        
        [self.webView goBack];
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
