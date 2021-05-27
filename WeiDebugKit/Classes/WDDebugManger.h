//
//  WDDebugManger.h
//  WeiDebugKit
//
//  Created by Wee on 2021/5/27.
//

#import <Foundation/Foundation.h>
#import "WDSelfDefineAction.h"

typedef NS_ENUM(NSInteger, WDDebugContentType) {
    WDDebugContentTypeSelfDefine,
};

@interface WDDebugManger : NSObject
@property (strong, nonatomic) NSMutableArray<WDSelfDefineAction*> * actions;
+ (instancetype)sharedManager;
- (void)showOrHiddenMenu;
- (void)hidden;
- (void)showContent:(WDDebugContentType)contentType;
- (void)addSelfDefineAction:(WDSelfDefineAction *)action;
@end

