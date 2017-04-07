//
//  ViewController.m
//  IconChangeDemo
//
//  Created by xp on 2017/4/6.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)changeIconBtnAction:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSArray *strs = @[@"", @"b", @"c"];
//    NSString *string = [strs componentsJoinedByString:@","];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) changeIcon{
    if ([UIApplication sharedApplication].supportsAlternateIcons) {
        
        if ([UIApplication sharedApplication].alternateIconName) {
            [[UIApplication sharedApplication] setAlternateIconName:[UIApplication sharedApplication].alternateIconName completionHandler:^(NSError * _Nullable error) {
                NSLog(@"%@",error);
            }];
        }else{
            [[UIApplication sharedApplication] setAlternateIconName:@"NoImagePlac" completionHandler:^(NSError * _Nullable error) {
                NSLog(@"%@",error);
            }];
        }
        
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"该功能只支持iOS10.3及以上系统" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }];
        [alertController addAction:cancelAction];
        [alertController view];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    
}


- (IBAction)changeIconBtnAction:(UIButton *)sender {
    [self changeIcon];
}
@end
