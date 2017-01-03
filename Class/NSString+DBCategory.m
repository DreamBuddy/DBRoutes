//
//  NSString+DBCategory.m
//  Transition
//
//  Created by Xu Mengtong on 3/1/17.
//  Copyright © 2017年 Xu Mengtong. All rights reserved.
//

#import "NSString+DBCategory.h"

@implementation NSString (DBCategory)

-(NSMutableDictionary *)db_parseURLQuery{
    NSMutableDictionary *queryItemDic = [@{} mutableCopy];
    NSURLComponents *components = [NSURLComponents componentsWithString:self];
    
    for (NSURLQueryItem *item in components.queryItems) {
        [queryItemDic setValue:item.value forKey:item.name];
    }
    return queryItemDic;
}

-(NSString *)db_uppercaseFirstCharacterInString{
    return self.length ? [self stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[self substringWithRange:NSMakeRange(0, 1)].uppercaseString] : @"";
}

@end
