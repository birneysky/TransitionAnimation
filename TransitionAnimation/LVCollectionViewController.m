//
//  ViewController.m
//  TransitionAnimation
//
//  Created by zhangguang on 16/1/14.
//  Copyright © 2016年 com.github. All rights reserved.
//

#import "LVCollectionViewController.h"
#import "LVDetailViewController.h"

@interface LVCollectionViewController () <UINavigationControllerDelegate>

@end

@implementation LVCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"]) {
        LVDetailViewController* dvc = segue.destinationViewController;
        dvc.image = [UIImage imageNamed:@"001"];
    }
}

#pragma mark - *** UINavigationControllerDelegate ***

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    return nil;
}

#pragma mark - *** Collectionview Data Source ***
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1000;
}


#pragma  mark - ***  Collectionview Delegate ***
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath:indexPath];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detail" sender:nil];
}

@end
