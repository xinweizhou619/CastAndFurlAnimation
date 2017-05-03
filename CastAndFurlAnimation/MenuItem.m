//
//  MenuItem.m
//  12-微博动画
//
//  Created by XinWeizhou on 2017/5/3.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
- (void)setImage:(UIImage *)image {
    _image = [UIImage imageNamed:(NSString *)image];
}
@end
