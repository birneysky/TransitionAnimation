//
//  MoveTransition.h
//  TransitionAnimation
//
//  Created by zhangguang on 16/1/21.
//  Copyright © 2016年 com.github. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 1.push & pop 转场动画自定义，创建一个nsobject的子类，并遵守“UIViewControllerAnimatedTransitioning”协议
 2. 实现该协议的两个基本方法
        指定转场动画的持续时长
        - (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
        转场动画的具体内容
        - (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
 3.遵守“UINavigationControllerDelegate”协议，实现方法
         - (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
         animationControllerForOperation:(UINavigationControllerOperation)operation
         fromViewController:(UIViewController *)fromVC
         toViewController:(UIViewController *)toVC
 
 */
@interface MovePushTransition : NSObject <UIViewControllerAnimatedTransitioning>

@end
