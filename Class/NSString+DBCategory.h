//
//  NSString+DBCategory.h
//  Transition
//
//  Created by Xu Mengtong on 3/1/17.
//  Copyright © 2017年 Xu Mengtong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DBCategory)

-(NSMutableDictionary *)db_parseURLQuery;
-(NSString *)db_uppercaseFirstCharacterInString;

@end
