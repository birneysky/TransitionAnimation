//
//  ViewController.m
//  TransitionAnimation
//
//  Created by zhangguang on 16/1/14.
//  Copyright © 2016年 com.github. All rights reserved.
//

#import "LVCollectionViewController.h"
#import "LVDetailViewController.h"
#import "MovePushTransition.h"
#import "LVCollectionViewCell.h"

@interface LVCollectionViewController () <UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation LVCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.collectionView registerClass:[LVCollectionViewCell class] forCellWithReuseIdentifier:@"ItemCell"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
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
    if (operation == UINavigationControllerOperationPush) {
        return [[MovePushTransition alloc] init];
    }
    return nil;
}

#pragma mark - *** Collectionview Data Source ***
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}


#pragma  mark - ***  Collectionview Delegate ***
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath:indexPath];
    //NSLog(@"cell %p",cell);
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat cellLenght = (self.collectionView.frame.size.width - collectionViewLayout.sectionInset.left - collectionViewLayout.sectionInset.right - (4 - collectionViewLayout.minimumLineSpacing) * 1) / 4;
    return CGSizeMake(cellLenght, cellLenght);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectCell = (LVCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"detail" sender:nil];
}

@end
