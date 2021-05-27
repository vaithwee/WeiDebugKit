//
//  WDMenuViewController.m
//  Pods-WeiDebugKit_Example
//
//  Created by Wee on 2021/5/27.
//

#import "WDMenuViewController.h"
#import "WDDebugManger.h"


@interface WDMenuViewController ()

@end

@implementation WDMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer setCornerRadius:8];
    [self.view.layer setMasksToBounds:YES];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)toShowContent:(UIButton *)sender {
    [[WDDebugManger sharedManager] showContent:sender.tag];
}
- (IBAction)toExit:(id)sender {
    [[WDDebugManger sharedManager] hidden];
}

@end
