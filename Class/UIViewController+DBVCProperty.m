//
//  UIViewController+DBVCProperty.m
//  Transition
//
//  Created by Xu Mengtong on 29/12/16.
//  Copyright © 2016年 Xu Mengtong. All rights reserved.
//

#import "UIViewController+DBVCProperty.h"

#import <objc/runtime.h>

@implementation UIViewController (DBVCProperty)

-(NSDictionary *)dbr_context{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setDbr_context:(NSDictionary *)dbr_context{
    objc_setAssociatedObject(self, @selector(dbr_context), dbr_context, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(DBR_callback)dbr_callback{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setDbr_callback:(DBR_callback)dbr_callback{
    objc_setAssociatedObject(self, @selector(dbr_callback), dbr_callback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
