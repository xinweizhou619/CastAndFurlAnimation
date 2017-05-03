//
//  PresentVController.m
//  CastAndFurlAnimation
//
//  Created by XinWeizhou on 2017/5/3.
//  Copyright © 2017年 XinWeizhou. All rights reserved.
//

#import "PresentVController.h"
#import "MenuItem.h"
#import "ItemBtn.h"

@interface PresentVController ()
@property(nonatomic,strong)NSMutableArray*btnArray;
@property(nonatomic,strong)UIButton *showAndHideBtn;
@property(nonatomic,strong)NSMutableArray<MenuItem *> *itemArray;
@property(nonatomic,assign)int btnIndex;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation PresentVController

static CGFloat btnWH = 50;

- (NSMutableArray *)itemArray {
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray arrayWithCapacity:5];
        NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"ItemList" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:pathStr];
        [dictArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            [_itemArray addObject:[MenuItem modelWithDict:dict]];
        }];
    }
    return _itemArray;
}
- (NSMutableArray *)btnArray {
    
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
        for(int i = 0 ;i < self.itemArray.count; i++){
            ItemBtn *btn = [ItemBtn buttonWithType:UIButtonTypeCustom];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.bounds = CGRectMake(0, 0, btnWH, btnWH);
            MenuItem *item = self.itemArray[i];
            //设置按钮图片
            [btn setImage:item.image forState:UIControlStateNormal];
            //设置按钮的文字
            [btn setTitle:item.title forState:UIControlStateNormal];
            
            [self.btnArray addObject:btn];
            
            //监听按钮点击
            [btn addTarget:self action:@selector(btnTouchDownClick:) forControlEvents:UIControlEventTouchDown];
            [btn addTarget:self action:@selector(btnTouchUpInsideClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return _btnArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    [self.btnArray enumerateObjectsUsingBlock:^(UIButton *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
        obj.alpha = 0;
        [weakSelf.view addSubview:obj];
    }];
    [self addShowBtn];
    self.btnIndex = -1;
    // xib导致这个值是300，300
    NSLog(@"----%@",NSStringFromCGPoint(self.view.center));
}

- (void)showAndFurl {
    //添加定时器
    self.timer =  [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(castAndFurlBtns) userInfo:nil repeats:YES];
    self.showAndHideBtn.enabled = NO;
}

//添加按钮
- (void)addShowBtn{
    UIButton *showAndHideBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btnWH, btnWH)];
    showAndHideBtn.center = self.view.center;
    //    showAndHideBtn.backgroundColor = [UIColor greenColor];
    [showAndHideBtn setTitle:@"✋" forState:UIControlStateNormal];
    [showAndHideBtn addTarget:self action:@selector(showAndFurl) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showAndHideBtn];
    self.showAndHideBtn = showAndHideBtn;
}
//
- (void)castAndFurlBtns {
    
    if (self.showAndHideBtn.selected == YES) {
        //如果当前的角标等于当前按钮的个数
        //让定时器停止
        self.btnIndex--;
        if (self.btnIndex == -1) {
            self.showAndHideBtn.selected = NO;
            self.showAndHideBtn.enabled = YES;
            [self.timer invalidate];
            return;
        }
        //每次取出一个按钮
        UIButton *btn = self.btnArray[self.btnIndex];
        //取消所有形变
        [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            //        btn.transform = CGAffineTransformMakeTranslation(circleCenter.x + circleRadius * cosf(angle), circleCenter.y - circleRadius * sinf(angle));
            btn.center = self.view.center;
            btn.alpha = 0;
        } completion:nil];
        
    } else {
        
        self.btnIndex++;
        if (self.btnIndex == self.btnArray.count) {
            self.showAndHideBtn.selected = YES;
            self.showAndHideBtn.enabled = YES;
            [self.timer invalidate];
            return;
        }
        //每次取出一个按钮
        UIButton *btn = self.btnArray[self.btnIndex];
        // 圆的半径
        CGFloat circleRadius = self.view.frame.size.width * 0.5 - btn.frame.size.width * 0.5;
        CGPoint circleCenter = self.view.center;
        // 每个item之间的角度
        CGFloat angleDelta = M_PI  / (self.btnArray.count - 1);
        
        // 计算当前item的角度
        CGFloat angle = self.btnIndex * angleDelta;
        
        //取消所有形变
        [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            //        btn.transform = CGAffineTransformMakeTranslation(circleCenter.x + circleRadius * cosf(angle), circleCenter.y - circleRadius * sinf(angle));
            btn.alpha = 1;
            btn.center = CGPointMake(circleCenter.x + circleRadius * cosf(angle), circleCenter.y - circleRadius * sinf(angle));
            
        } completion:nil];
        
    }
    
}




//当手指按下进调用
- (void)btnTouchDownClick:(UIButton *)btn{
    //让按钮放大
    [UIView animateWithDuration:0.5 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
    
}

//当手指抬起时调用.
- (void)btnTouchUpInsideClick:(UIButton *)btn{
    //让按钮放大.变成透明
    [UIView animateWithDuration:0.5 animations:^{
        btn.alpha = 0;
        btn.transform = CGAffineTransformMakeScale(2, 2);
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.btnArray enumerateObjectsUsingBlock:^(UIButton *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [UIView animateWithDuration:0.5 animations:^{
            obj.transform = CGAffineTransformIdentity;
        }];
    }];
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
