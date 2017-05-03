//
//  ItemBtn.m
//  CastAndFurlAnimation
//
//  Created by XinWeizhou on 2017/5/3.
//  Copyright © 2017年 XinWeizhou. All rights reserved.
//

#import "ItemBtn.h"

@implementation ItemBtn

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUP];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUP];
    }
    return self;
}


//按钮的初始化
- (void)setUP {
    //    self.backgroundColor = [UIColor redColor];
    //    self.layer.cornerRadius = self.frame.size.width * 0.5;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)setHighlighted:(BOOL)highlighted {
}



- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.7;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat labelX = imageX;
    CGFloat labelY = imageH;
    CGFloat labelW = imageW;
    CGFloat labelH = self.bounds.size.height - imageH;
    
    self.titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
}
//-(CGRect)imageRectForContentRect:(CGRect)contentRect {
//
//}

//-(CGRect)titleRectForContentRect:(CGRect)contentRect {
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
