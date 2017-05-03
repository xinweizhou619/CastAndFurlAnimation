//
//  ViewController.m
//  CastAndFurlAnimation
//
//  Created by XinWeizhou on 2017/5/3.
//  Copyright © 2017年 XinWeizhou. All rights reserved.
//

#import "ViewController.h"
#import "PresentVController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)addBtnClicked:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    PresentVController *pvc = [storyboard instantiateViewControllerWithIdentifier:@"pVc"];
    NSLog(@"pvc = %@",pvc);
    pvc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:pvc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
