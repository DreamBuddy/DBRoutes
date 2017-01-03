//
//  UIViewController+DBVCProperty.h
//  Transition
//
//  Created by Xu Mengtong on 29/12/16.
//  Copyright © 2016年 Xu Mengtong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DBR_callback)();

@interface UIViewController (DBVCProperty)

@property (nonatomic ,strong) NSDictionary *dbr_context;
@property (nonatomic ,copy) DBR_callback dbr_callback;

@end
