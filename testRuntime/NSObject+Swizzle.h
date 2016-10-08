//
//  NSObject+Swizzle.h
//  testRuntime
//
//  Created by M-SJ077 on 16/10/8.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Swizzle)
+(BOOL)swizzleMethod:(SEL)origSel withMethod:(SEL)aftSel;
@end
