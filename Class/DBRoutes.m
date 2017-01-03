//
//  DBRoutes.m
//  Transition
//
//  Created by Xu Mengtong on 29/12/16.
//  Copyright © 2016年 Xu Mengtong. All rights reserved.
//

#import "DBRoutes.h"
#import <objc/runtime.h>

@interface DBRoutes ()

+(DBRoutes *)instance;

@property (nonatomic ,strong) NSMutableDictionary *stores;

@end

@implementation DBRoutes

+(void)registRoute:(NSString *)route forScheme:(NSString *)scheme handler:(DBR_callback)handler{
    NSMutableDictionary *routes = [DBRoutes instance].stores[scheme] ? : ({
        id newDictionary = [@{} mutableCopy];
        [DBRoutes instance].stores[scheme] = newDictionary;
        newDictionary;
    });
    
    [routes setValue:handler forKey:route];
}

+(void)registRoute:(NSString *)route forScheme:(NSString *)scheme controller:(Class)controller_class{
    NSMutableDictionary *routes = [DBRoutes instance].stores[scheme] ? : ({
        id newDictionary = [@{} mutableCopy];
        [DBRoutes instance].stores[scheme] = newDictionary;
        newDictionary;
    });
    
    [routes setValue:controller_class forKey:route];
}

+(UIViewController *)matchController:(NSString *)route customContext:(NSString *)context{
    Class class = [DBRoutes matchAnyThing:route];
    if (!class) {return nil;}
    if (![DBRoutes isMetaClass:class]) {return nil;}
    if (![class isSubclassOfClass:[UIViewController class]]) {return nil;}
    
    UIViewController *controller = class.new;
    
    NSString *contextString = [NSString stringWithFormat:@"set%@:" ,[context db_uppercaseFirstCharacterInString]];
    SEL setParams = NSSelectorFromString(contextString);
    if ([controller respondsToSelector:setParams]) {
        [controller performSelector:setParams withObject:route.db_parseURLQuery];
    }
    
    return controller;
}

+(UIViewController *)matchController:(NSString *)route{
    return [DBRoutes matchController:route customContext:@"dbr_context"];
}

+(DBR_callback)matchBlock:(NSString *)route{
    id block = [DBRoutes matchAnyThing:route];
    if (!block) {return nil;}
    if ([DBRoutes isMetaClass:block]) {return nil;}
    return block;
}

+(id)matchAnyThing:(NSString *)route{
    NSURL *url = [NSURL URLWithString:route];
    NSString *scheme = url.scheme;
    NSString *path = [NSString stringWithFormat:@"%@%@" ,url.host ,url.path];
    NSDictionary *paths = [DBRoutes instance].stores[scheme];
    if (!paths) {return nil;}
    
    return paths[path];
}

+(BOOL)canRoute:(NSString *)route{
    return [DBRoutes matchAnyThing:route];
}

+(BOOL)isMetaClass:(id)obj{
    return class_isMetaClass(object_getClass(obj));
}

-(NSMutableDictionary *)stores{
    if (!_stores) {
        _stores = [@{} mutableCopy];
    }
    return _stores;
}

+(DBRoutes *)instance{
    static id dbr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!dbr) {
            dbr = DBRoutes.new;
        }
    });
    return dbr;
}

@end
