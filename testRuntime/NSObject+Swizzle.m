//
//  NSObject+Swizzle.m
//  testRuntime
//
//  Created by M-SJ077 on 16/10/8.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "NSObject+Swizzle.h"


@implementation NSObject (Swizzle)

+(BOOL)swizzleMethod:(SEL)origSel withMethod:(SEL)aftSel{
    
//    Method originMethod =class_getInstanceMethod(self,origSel);
    Method originMethod = class_getInstanceMethod(self, origSel);
    Method newMethod=class_getInstanceMethod(self,aftSel);
    
    if(originMethod&&newMethod){//必须两个Method都要拿到
        if(class_addMethod(self,origSel,method_getImplementation(newMethod),method_getTypeEncoding(newMethod))){
            //实现成功添加后
            class_replaceMethod(self,aftSel,method_getImplementation(originMethod),method_getTypeEncoding(originMethod));
        }
        return YES;
    }
    return NO;
}
@end
