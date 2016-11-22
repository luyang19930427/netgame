//
//  XRAnimtion.h
//  game
//
//  Created by 张丹峰 on 16/8/31.
//  Copyright © 2016年 欣润科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <POP/POP.h>
#import <POP/POPLayerExtras.h>

typedef void (^CompletionBlock) (POPAnimation *anim, BOOL finished);

@interface XRAnimtion : NSObject

/**
 *  CABasicAnimation 不带弹性和张力
 *
 *  @param layer      加动画的layer
 *  @param keyPath    如@"transform.scale"是缩放..
 *  @param duration   动画时长
 *  @param count      重复次数
 *  @param from       初始值
 *  @param toValue    目标值
 *  @param isReverses 动画结束时是否执行逆动画
 *  @param delegate   代理中有此动画开始和结束的回调方法
 */
+(void)setCABasicAnimWithLayer:(CALayer *)layer keyPath:(NSString *)keyPath duration:(CGFloat)duration repeatCount:(NSInteger)count fromValue:(id)from toValue:(id)toValue autoreverses:(BOOL)isReverses delegate:(id)delegate;

/**
 *  POP引擎的Basic动画 带弹性
 *
 *  @param animName 动画变化属性名字 如kPOPLayerScaleXY是缩放..
 *  @param delay    延时
 *  @param from     初始值
 *  @param toValue  目标值
 *  @param block    动画结束回调
 */
+(void)setPopBasicAnimWithLayer:(CALayer *)layer name:(NSString *)animName duration:(CGFloat)duration delay:(CGFloat)delay repeatCount:(NSInteger)count fromValue:(id)from toValue:(id)toValue completionBlock:(CompletionBlock)block;

/**
 *  StringAnimation
 *
 *  @param bounci   弹力（震动幅度），取值0-20
 *  @param speed    速度，越大动画结束越快，取值0-20
 *  @param block    动画结束回调
 */
+(void)setPopStringAnimWithLayer:(CALayer *)layer name:(NSString *)animName bounciness:(CGFloat)bounci speed:(CGFloat)speed fromValue:(NSValue *)from toValue:(NSValue *)toValue completionBlock:(CompletionBlock)block;
/**
 *  StringAnimation (带延时)
 */
+(void)setPopStringAnimWithLayer:(CALayer *)layer name:(NSString *)animName delay:(CGFloat)delay bounciness:(CGFloat)bounci speed:(CGFloat)speed fromValue:(NSValue *)from toValue:(NSValue *)toValue completionBlock:(CompletionBlock)block;
@end
