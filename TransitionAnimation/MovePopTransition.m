//
//  MovePopTransition.m
//  TransitionAnimation
//
//  Created by zhangguang on 16/2/14.
//  Copyright © 2016年 com.github. All rights reserved.
//

#import "MovePopTransition.h"
#import "LVDetailViewController.h"
#import "LVCollectionViewController.h"
#import "LVCollectionViewCell.h"

@implementation MovePopTransition


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    LVDetailViewController* fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    LVCollectionViewController* toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView* containerView = [transitionContext containerView];
    
    UIView* snapshotView = [fromVC.avatarImageView snapshotViewAfterScreenUpdates:NO];
    snapshotView.frame = [containerView convertRect:fromVC.avatarImageView.frame fromView:fromVC.view];
    fromVC.avatarImageView.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.selectCell.imageView.hidden = YES;
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView addSubview:snapshotView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        snapshotView.frame = [containerView convertRect:toVC.selectCell.imageView.frame fromView:toVC.selectCell];
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        toVC.selectCell.imageView.hidden = NO;
        [snapshotView removeFromSuperview];
        fromVC.avatarImageView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
