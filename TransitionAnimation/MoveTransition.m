//
//  MoveTransition.m
//  TransitionAnimation
//
//  Created by zhangguang on 16/1/21.
//  Copyright © 2016年 com.github. All rights reserved.
//

#import "MoveTransition.h"

@implementation MoveTransition


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* fromVC =  [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView* container =  [transitionContext containerView];
    UIImageView* view ;
    [view snapshotViewAfterScreenUpdates:NO];
}

@end
