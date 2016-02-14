//
//  MoveTransition.m
//  TransitionAnimation
//
//  Created by zhangguang on 16/1/21.
//  Copyright © 2016年 com.github. All rights reserved.
//

#import "MovePushTransition.h"
#import "LVCollectionViewController.h"
#import "LVDetailViewController.h"
#import "LVCollectionViewCell.h"

@implementation MovePushTransition


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    LVCollectionViewController* fromVC =  [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    LVDetailViewController* toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView* container =  [transitionContext containerView];
    
    //创建cell中的imageView的截图，并把该imageview隐藏，获取imageview在container中的坐标
    UIView* snapshotView  = [fromVC.selectCell.imageView snapshotViewAfterScreenUpdates:NO];
    snapshotView.frame = [container convertRect:fromVC.selectCell.imageView.frame fromView:fromVC.selectCell.contentView];
    fromVC.selectCell.imageView.hidden = YES;
    
    //设置目标控制器view的位置
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    
    //添加到container中
    [container addSubview:toVC.view];
    [container addSubview:snapshotView];
    
    //执行动画
    [toVC.avatarImageView layoutIfNeeded]; //avatarImageView提前布局，以便获取到在目标控制器View中正确的位置
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        snapshotView.frame = toVC.avatarImageView.frame;
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromVC.selectCell.imageView.hidden = NO;
        toVC.avatarImageView.image = toVC.image;
        [snapshotView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

@end
