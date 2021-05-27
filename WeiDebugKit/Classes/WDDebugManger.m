//
//  WDDebugManger.m
//  WeiDebugKit
//
//  Created by Wee on 2021/5/27.
//

#import "WDDebugManger.h"
#import "WDTinyMenuViewController.h"
#import "WDMenuViewController.h"
#import "WDSelfDefineViewController.h"


#define kWDDebugMenuWindowHeight [UIScreen mainScreen].bounds.size.height * 0.3
#define kWDDebugMeneFrame CGRectMake(10, [UIScreen mainScreen].bounds.size.height-kWDDebugMenuWindowHeight-10, [UIScreen mainScreen].bounds.size.width-20, kWDDebugMenuWindowHeight)
#define kWDDebugContentFrame CGRectMake(10, 20, [UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.height-kWDDebugMenuWindowHeight - 40)

static WDDebugManger * _manager;

@interface WDDebugManger()
@property (strong, nonatomic) UIWindow * tinyWindow;
@property (strong, nonatomic) UIWindow * menuWindow;
@property (strong, nonatomic) UIWindow * contentWindow;

@end

@implementation WDDebugManger
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_manager == nil) {
            _manager = [[WDDebugManger alloc] init];
        }
    });
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tinyWindow = [[UIWindow alloc] init];
        [self.tinyWindow setFrame:CGRectMake(0, 0, 60, 60)];
        [self.tinyWindow setBackgroundColor:[UIColor clearColor]];
        [self.tinyWindow setHidden:NO];
        [self.tinyWindow.layer setCornerRadius:8];
        [self.tinyWindow.layer setShadowOffset:CGSizeMake(0, 2)];
        [self.tinyWindow.layer setShadowColor:[UIColor lightGrayColor].CGColor];
        [self.tinyWindow.layer setShadowOpacity:0.5];
        
        [self.tinyWindow setRootViewController:[WDTinyMenuViewController controller]];
        [self.tinyWindow setWindowLevel:99999];
        
        
        
        
        self.menuWindow = [[UIWindow alloc] init];
        [self.menuWindow setFrame:kWDDebugMeneFrame];
        [self.menuWindow setBackgroundColor:[UIColor clearColor]];
        [self.menuWindow setHidden:YES];
        
        [self.menuWindow.layer setCornerRadius:8];
        [self.menuWindow.layer setShadowOffset:CGSizeMake(0, 2)];
        [self.menuWindow.layer setShadowColor:[UIColor lightGrayColor].CGColor];
        [self.menuWindow.layer setShadowOpacity:0.5];
        
        
        [self.menuWindow setRootViewController:[WDMenuViewController controller]];
        [self.menuWindow setWindowLevel:999999];
        
        self.contentWindow = [[UIWindow alloc] init];
        [self.contentWindow setFrame:kWDDebugContentFrame];
        [self.contentWindow setBackgroundColor:[UIColor redColor]];
        [self.contentWindow setHidden:YES];
        
        
        [self.contentWindow.layer setCornerRadius:8];
        [self.contentWindow.layer setShadowOffset:CGSizeMake(0, 2)];
        [self.contentWindow.layer setShadowColor:[UIColor lightGrayColor].CGColor];
        [self.contentWindow.layer setShadowOpacity:0.5];
        
        [self.contentWindow setRootViewController:[WDMenuViewController controller]];
        [self.contentWindow setWindowLevel:999999];
        
        self.actions = [NSMutableArray array];
        
    }
    return self;
}

- (void)showOrHiddenMenu {
    [self.menuWindow setFrame:kWDDebugMeneFrame];
    [self.menuWindow setHidden:!self.menuWindow.hidden];
}

- (void)showContent:(WDDebugContentType)contentType {
    switch (contentType) {
        case WDDebugContentTypeSelfDefine:
        {
            WDSelfDefineViewController * controller = [WDSelfDefineViewController controller];
            [self.contentWindow setRootViewController:controller];
            break;
        }
        default:
            break;
    }
    [self.contentWindow setFrame:kWDDebugContentFrame];
    [self.contentWindow setHidden:NO];
}

- (void)hidden {
    [self.contentWindow setHidden:YES];
    [self.menuWindow setHidden:YES];
}

- (void)addSelfDefineAction:(WDSelfDefineAction *)action {
    [self.actions addObject:action];
}
@end
