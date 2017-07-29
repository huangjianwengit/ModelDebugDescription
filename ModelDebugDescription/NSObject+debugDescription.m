//
//  NSObject+debugDescription.m
//  BezierPathText
//
//  Created by Jivan on 2017/7/29.
//  Copyright © 2017年 Jivan. All rights reserved.
//

#import "NSObject+debugDescription.h"
#import <objc/runtime.h>
@implementation NSObject (debugDescription)

-(NSString*)debugDescription
{
 
    if ([self isKindOfClass:[NSArray class]]||[self isKindOfClass:[NSString class]]||[self isKindOfClass:[NSNumber class]]||[self isKindOfClass:[NSDictionary class]]) {
        
        return self.debugDescription ;
    }
    
    
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
   uint count ;
    
    objc_property_t * properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0 ; i <count; i++) {
        
        objc_property_t property = properties[i];
        NSString* name = @(property_getName(property));
        id value = [self valueForKey:name]?:@"nil";
        [dictionary setObject:value forKey:name];
        
    }
//    释放
    free(properties);
    
    return [NSString stringWithFormat:@"<%@: %p>%@",[self class],self,dictionary];
    
    
}



@end
