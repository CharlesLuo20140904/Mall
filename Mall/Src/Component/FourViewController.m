//
//  FourViewController.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/6/20.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webV;
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    self.navigationItem.leftBarButtonItem = item;
    self.webV = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webV.delegate = self;
    [self.view addSubview:self.webV];
}

-(void)goback{
    if ([self.webV canGoBack]) {
        [self.webV goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}



-(void)setUrlStr:(NSString *)urlStr{
    if (urlStr) {
        [self.webV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
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
