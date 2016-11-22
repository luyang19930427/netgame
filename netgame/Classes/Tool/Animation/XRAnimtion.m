//
//  XRAnimtion.m
//  game
//
//  Created by 张丹峰 on 16/8/31.
//  Copyright © 2016年 欣润科技. All rights reserved.
//

#import "XRAnimtion.h"



@implementation XRAnimtion


+(void)setCABasicAnimWithLayer:(CALayer *)layer keyPath:(NSString *)keyPath duration:(CGFloat)duration repeatCount:(NSInteger)count fromValue:(id)from toValue:(id)toValue autoreverses:(BOOL)isReverses delegate:(id)delegate{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:keyPath];
    anim.toValue = toValue;
    anim.duration = duration;
    anim.repeatCount = count;
    anim.delegate = delegate;
    anim.autoreverses = isReverses;
//    anim.cumulative = YES;//保留上次动画的值
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [layer addAnimation:anim forKey:@"CABasicAnimation"];
}


+(void)setPopBasicAnimWithLayer:(CALayer *)layer name:(NSString *)animName duration:(CGFloat)duration delay:(CGFloat)delay repeatCount:(NSInteger)count fromValue:(id)from toValue:(id)toValue completionBlock:(CompletionBlock)block{
    
    POPBasicAnimation *anBasic = [POPBasicAnimation animationWithPropertyNamed:animName];
    anBasic.fromValue = from;
    anBasic.toValue = toValue;
    anBasic.duration = duration;
    anBasic.repeatCount = count;
    anBasic.beginTime = CACurrentMediaTime() + delay;
    anBasic.completionBlock = block;
    anBasic.removedOnCompletion = NO;
    [layer pop_addAnimation:anBasic forKey:@"position"];
}


+(void)setPopStringAnimWithLayer:(CALayer *)layer name:(NSString *)animName bounciness:(CGFloat)bounci speed:(CGFloat)speed fromValue:(NSValue *)from toValue:(NSValue *)toValue completionBlock:(CompletionBlock)block{
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:animName];
    anim.springBounciness = bounci;
    anim.springSpeed = speed;
    anim.fromValue = from;
    anim.toValue = toValue;
    anim.completionBlock = block;
    [layer pop_addAnimation:anim forKey:@"Animation"];
}

+(void)setPopStringAnimWithLayer:(CALayer *)layer name:(NSString *)animName delay:(CGFloat)delay bounciness:(CGFloat)bounci speed:(CGFloat)speed fromValue:(NSValue *)from toValue:(NSValue *)toValue completionBlock:(CompletionBlock)block{
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:animName];
    anim.springBounciness = bounci;
    anim.springSpeed = speed;
    anim.fromValue = from;
    anim.toValue = toValue;
    anim.completionBlock = block;
    anim.beginTime = CACurrentMediaTime() + delay;
    [layer pop_addAnimation:anim forKey:@"Animation"];
}
@end
