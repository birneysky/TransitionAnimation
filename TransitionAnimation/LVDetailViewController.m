//
//  LVDetailViewController.m
//  TransitionAnimation
//
//  Created by zhangguang on 16/1/21.
//  Copyright © 2016年 com.github. All rights reserved.
//

#import "LVDetailViewController.h"
#import "MovePopTransition.h"

@interface LVDetailViewController () <UINavigationControllerDelegate>

@property (nonatomic,strong) UIPercentDrivenInteractiveTransition* percentDrivenTransition;

@end

@implementation LVDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.avatarImageView.image = self.image;
    
    UIScreenEdgePanGestureRecognizer* edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanGesture:)];
    edgePan.edges = UIRectEdgeLeft;
    
    [self.view addGestureRecognizer:edgePan];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - *** Gesture Selector ***
- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer*)edgePan
{
    CGFloat progress = [edgePan translationInView:self.view].x / self.view.bounds.size.width;
    
    if (UIGestureRecognizerStateBegan == edgePan.state) {
        self.percentDrivenTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (UIGestureRecognizerStateChanged == edgePan.state)
    {
        [self.percentDrivenTransition updateInteractiveTransition:progress];
    }
    else if (UIGestureRecognizerStateCancelled == edgePan.state )
    {
        if (progress > 0.5) {
            [self.percentDrivenTransition finishInteractiveTransition];
        }
        else
        {
             [self.percentDrivenTransition updateInteractiveTransition:0];
             [self.percentDrivenTransition cancelInteractiveTransition];
        }
        
        //[self.percentDrivenTransition finishInteractiveTransition];
       // self.percentDrivenTransition = nil;
    }
    else if(UIGestureRecognizerStateEnded == edgePan.state){
//        if (progress > 0.5) {
//            [self.percentDrivenTransition finishInteractiveTransition];
//        }
//        else
//        {
            [self.percentDrivenTransition updateInteractiveTransition:0];
            //self.percentDrivenTransition = nil;
            [self.percentDrivenTransition cancelInteractiveTransition];
//        }
    }
    
}


#pragma mark - *** UINavigationControllerDelegate ***

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return [[MovePopTransition alloc] init];
    }
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    return self.percentDrivenTransition;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
