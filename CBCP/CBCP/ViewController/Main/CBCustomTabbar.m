//
//  CBCustomTabbar.m
//  CBCP
//
//  Created by LC on 2017/5/16.
//  Copyright © 2017年 LC. All rights reserved.
//

#import "CBCustomTabbar.h"

@interface CBCustomTabbar ()

@property (nonatomic, strong) UIButton *plusBtn;

@end

@implementation CBCustomTabbar

- (UIButton *)plusBtn{
    if(!_plusBtn){
        
        _plusBtn = [[UIButton alloc]init];
        [_plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_add"] forState:UIControlStateNormal];
        _plusBtn.backgroundColor = [UIColor redColor];
        _plusBtn.layer.cornerRadius = 20;
        _plusBtn.clipsToBounds = YES;
        _plusBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _plusBtn.layer.borderWidth = 2;
        [_plusBtn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _plusBtn;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.bounds.size.width/(self.items.count +1);
    CGFloat btnH = self.bounds.size.height;
    
    int i =0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i ++;
        }
    }
    
    self.plusBtn.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.plusBtn.bounds = CGRectMake(0, 0, 40, 40);
    
    [self addSubview:self.plusBtn];
    
    //    NSLog(@"%@",NSStringFromCGPoint(self.center));
    
    
    
}

-(void)plusBtnClick:(UIButton *)sender{
    self.clickBlock();
}



@end
