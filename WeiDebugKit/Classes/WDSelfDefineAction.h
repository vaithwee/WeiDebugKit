//
//  WDSelfDefineAction.h
//  Pods-WeiDebugKit_Example
//
//  Created by Wee on 2021/5/27.
//

#import <Foundation/Foundation.h>

typedef void(^WDSDAction)(void);

NS_ASSUME_NONNULL_BEGIN

@interface WDSelfDefineAction : NSObject
@property (strong, nonatomic) NSString * title;
@property (copy, nonatomic) WDSDAction action;
@end

NS_ASSUME_NONNULL_END
