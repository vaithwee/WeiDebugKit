//
//  WDBaseViewController.m
//  WeiDebugKit
//
//  Created by Wee on 2021/5/27.
//

#import "WDBaseViewController.h"

@interface WDBaseViewController ()

@end

@implementation WDBaseViewController
+ (instancetype)controller {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"WeiDebugKit" ofType:@"bundle"]];
   id instance = [[UIStoryboard storyboardWithName:@"WeiDebugKit" bundle:bundle] instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
   return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end
