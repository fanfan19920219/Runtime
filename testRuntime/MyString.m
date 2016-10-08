//
//  MyString.m
//  testRuntime
//
//  Created by M-SJ077 on 16/10/8.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "MyString.h"
#import "NSObject+Swizzle.h"

@implementation MyString

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        Class clazz=object_getClass((id)self);
        [clazz swizzleMethod:@selector(resolveInstanceMethod:)withMethod:@selector(myResolveInstanceMethod:)];
    });
}


+(BOOL)myResolveInstanceMethod:(SEL)sel{
    
    if(![self myResolveInstanceMethod:sel]){
        
        
        NSString*selString=NSStringFromSelector(sel);
        if([selString isEqualToString:@"countAll"]||[selString isEqualToString:@"pushViewController"]){
            class_addMethod(self,sel,class_getMethodImplementation(self,@selector(dynamicMethodIMP)),"v@:");
            return YES;
        }else{
            return NO;
        }
    }
    return YES;
}

-(void)dynamicMethodIMP{
    NSLog(@"我是动态加入的函数");
}

@end
