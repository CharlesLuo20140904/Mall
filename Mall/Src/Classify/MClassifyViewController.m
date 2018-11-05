//
//  MClassifyViewController.m
//  Mall
//
//  Created by luo on 2017/5/11.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MClassifyViewController.h"

@interface MClassifyViewController ()

@end

@implementation MClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:15];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    NSString *string = @"aasdasdsadasssssssssasdasdasdadad大asdadasdsadasdasdadasdaasdasdsadasssssssssasdasdasdadad大asdadasdsadasdasdadasdaasdasdsadasssssssssasdasdasdadad大asdadasdsadasdasdadasdaasdasdsadasssssssssasdasdasdadad大asdadasdsadasdasdadasd";
    CGSize size = CGSizeMake(140.0, 1000000.0);
    NSMutableString *attributeString = [[NSMutableString alloc] initWithString:string];
    CGFloat h = [attributeString boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
    label.frame = CGRectMake(25.0, 10.0, 140.0, h);
//    label.backgroundColor = [UIColor redColor];
//    label.center = view.center;
    label.text = string;
    NSLog(@"-----%f",h);
    UIImage *image = [UIImage imageNamed:@"labelBackground"];
    UIImage *resultImage = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, h+35)];
    imageview.image = resultImage;
    imageview.center = self.view.center;
    [self.view addSubview:imageview];
//    label.center = imageview.center;
    [imageview addSubview:label];
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
