//
//  MImagePickController.m
//  Mall
//
//  Created by luo on 2018/10/30.
//  Copyright © 2018 luo. All rights reserved.
//

#import "MImagePickController.h"

@interface MImagePickController ()<UINavigationBarDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) UIImagePickerController *pickController;
@end

@implementation MImagePickController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *defaultImage = [UIImage imageNamed:@"3.jpg"];
    self.photoImageView.image = [self addImage:defaultImage WithRadius:50.0];
    [self.view addSubview:self.photoImageView];
}

-(void)startAction{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"从相机采集" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.pickController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.pickController animated:YES completion:^{
            //
        }];
    }];
    UIAlertAction *albAction = [UIAlertAction actionWithTitle:@"从胶卷采集" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.pickController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:self.pickController animated:YES completion:^{
            //
        }];
    }];
    
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"从相册采集" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.pickController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.pickController animated:YES completion:^{
            //
        }];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cameraAction];
    [alertController addAction:albAction];
    [alertController addAction:libraryAction];
    [alertController addAction:cancelAction];
    [alertController setModalPresentationStyle:UIModalPresentationPopover];
    
//    UIPopoverPresentationController *popPresenter = [alertController
//                                                     popoverPresentationController];
//    popPresenter.sourceView = self.photoImageView;
//    popPresenter.sourceRect = self.photoImageView.bounds;
    [self presentViewController:alertController animated:YES completion:^{
        //
    }];
}


- (UIImageView *)photoImageView{
    if (!_photoImageView) {
        _photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];
        _photoImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *pickImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickImage:)];
        [_photoImageView addGestureRecognizer:pickImage];
        _photoImageView.center = self.view.center;
    }
    return _photoImageView;
}

-(UIImagePickerController *)pickController
{
    if(!_pickController){
        _pickController = [[UIImagePickerController alloc] init];
        _pickController.allowsEditing = YES;
        _pickController.delegate = self;
        _pickController.videoQuality = UIImagePickerControllerQualityTypeHigh;
        _pickController.showsCameraControls = YES;
        _pickController.cameraCaptureMode = UIApplicationShortcutIconTypeCaptureVideo;
    }
    return _pickController;
}

-(UIImage *)addImage:(UIImage*)image WithRadius:(CGFloat)radius {
    CGRect rect = CGRectMake(0.0, 0.0, 100.0, 100.0);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    [image drawInRect:rect];
    UIImage *tempImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tempImg;
}

-(void)pickImage:(UITapGestureRecognizer*)tap{
    [self startAction];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    NSLog(@"%@",info);
    [picker dismissViewControllerAnimated:YES completion:^{
        //
    }];
    self.photoImageView.image = [self addImage:[info objectForKey:UIImagePickerControllerOriginalImage] WithRadius:50.0];
}


//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
