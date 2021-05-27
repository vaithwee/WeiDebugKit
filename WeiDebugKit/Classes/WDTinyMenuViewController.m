//
//  WDTinyMenuViewController.m
//  WeiDebugKit
//
//  Created by Wee on 2021/5/27.
//

#import "WDTinyMenuViewController.h"
#import "WDDebugManger.h"

#define kBBDebugLeanProportion (8/55.0)
#define kBBDebugVerticalMargin 15.0

@interface WDTinyMenuViewController ()

@end

@implementation WDTinyMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer setCornerRadius:8];
    [self.view.layer setMasksToBounds:YES];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    pan.delaysTouchesBegan = YES;
    [self.view addGestureRecognizer:pan];
}

- (void)handlePanGesture:(UIPanGestureRecognizer*)p
{
    UIWindow *appWindow = [UIApplication sharedApplication].delegate.window;
    CGPoint panPoint = [p locationInView:appWindow];
    
    if(p.state == UIGestureRecognizerStateBegan) {
    }else if(p.state == UIGestureRecognizerStateChanged) {
        self.view.window.center = CGPointMake(panPoint.x, panPoint.y);
    }else if(p.state == UIGestureRecognizerStateEnded
             || p.state == UIGestureRecognizerStateCancelled) {
        
        CGFloat ballWidth = self.view.frame.size.width;
        CGFloat ballHeight = self.view.frame.size.height;
        CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        
        CGFloat left = fabs(panPoint.x);
        CGFloat right = fabs(screenWidth - left);
        CGFloat top = fabs(panPoint.y);
        CGFloat bottom = fabs(screenHeight - top);
        
        CGFloat minSpace = MIN(MIN(MIN(top, left), bottom), right);
        CGPoint newCenter = CGPointZero;
        CGFloat targetY = 0;
        
        //Correcting Y
        if (panPoint.y < kBBDebugVerticalMargin + ballHeight / 2.0) {
            targetY = kBBDebugVerticalMargin + ballHeight / 2.0;
        }else if (panPoint.y > (screenHeight - ballHeight / 2.0 - kBBDebugVerticalMargin)) {
            targetY = screenHeight - ballHeight / 2.0 - kBBDebugVerticalMargin;
        }else{
            targetY = panPoint.y;
        }
        
        CGFloat centerXSpace = (0.5 - kBBDebugLeanProportion) * ballWidth;
        CGFloat centerYSpace = (0.5 - kBBDebugLeanProportion) * ballHeight;
        
        if (minSpace == left) {
            newCenter = CGPointMake(centerXSpace, targetY);
        }else if (minSpace == right) {
            newCenter = CGPointMake(screenWidth - centerXSpace, targetY);
        }else if (minSpace == top) {
            newCenter = CGPointMake(panPoint.x, centerYSpace);
        }else {
            newCenter = CGPointMake(panPoint.x, screenHeight - centerYSpace);
        }
        
        [UIView animateWithDuration:.25 animations:^{
            self.view.window.center = newCenter;
        }];
    }else{
        NSLog(@"pan state : %zd", p.state);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)showOrHiddenMenu:(id)sender {
    [[WDDebugManger sharedManager] showOrHiddenMenu];
}

@end
