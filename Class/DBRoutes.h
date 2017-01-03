//
//  DBRoutes.h
//  Transition
//
//  Created by Xu Mengtong on 29/12/16.
//  Copyright © 2016年 Xu Mengtong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewController+DBVCProperty.h"
#import "NSString+DBCategory.h"

@interface DBRoutes : NSObject

// register
+(void)registRoute:(NSString *)route forScheme:(NSString *)scheme handler:(DBR_callback)handler;
+(void)registRoute:(NSString *)route forScheme:(NSString *)scheme controller:(Class)controller_class;

// match
+(UIViewController *)matchController:(NSString *)route;
+(UIViewController *)matchController:(NSString *)route customContext:(NSString *)customContext;

+(DBR_callback)matchBlock:(NSString *)route;

+(BOOL)canRoute:(NSString *)route;

@end
