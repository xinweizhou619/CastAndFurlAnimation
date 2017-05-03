//
//  MenuItem.h
//  12-微博动画
//
//  Created by XinWeizhou on 2017/5/3.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuItem : NSObject
+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
//图片
@property (nonatomic, strong) UIImage *image;
//标题
@property (nonatomic, strong) NSString *title;
@end
