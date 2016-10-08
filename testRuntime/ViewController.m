//
//  ViewController.m
//  testRuntime
//
//  Created by M-SJ077 on 16/10/8.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ViewController.h"

#import "MyString.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyString*string=[[MyString alloc]init];
    [string performSelector:@selector(countAll)];
    [string performSelector:@selector(pushViewController)];
    //<prename="code"class="objc">//---------------------------------------------------------------
    NSLog(@"finishtest");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
