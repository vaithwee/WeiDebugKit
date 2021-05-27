//
//  WDSelfDefineViewController.m
//  Pods-WeiDebugKit_Example
//
//  Created by Wee on 2021/5/27.
//

#import "WDSelfDefineViewController.h"
#import "WDDebugManger.h"
#import "WDSelfDefineTableViewCell.h"

@interface WDSelfDefineViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation WDSelfDefineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer setCornerRadius:8];
    [self.view.layer setMasksToBounds:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [WDDebugManger sharedManager].actions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WDSelfDefineTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kWDSelfDefineTableViewCellReuseIdentifier];
    [cell.textLabel setText:[WDDebugManger sharedManager].actions[indexPath.row].title];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([WDDebugManger sharedManager].actions[indexPath.row].action) {
        [WDDebugManger sharedManager].actions[indexPath.row].action();
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
