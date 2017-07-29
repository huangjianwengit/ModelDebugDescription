//
//  ViewController.m
//  ModelDebugDescription
//
//  Created by Jivan on 2017/7/29.
//  Copyright © 2017年 Jivan. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    debugDescription方法只会在调试po的时候调用，而在代码中打印不会调用。但是我们需要在每个模型中都重写这个方法，而且代码都不一样，肯定受不了。我的解决方式是写一个NSObject的分类NSObject+DebugDescription并重写debugDescription，并处理了po其他类型的情况
    
    //    如果是其他数据类型，则返回self.debugDescription。这样的话只有打印model时会打印显示属性，而其他类型就不会受影响了

    
    Student*  stu  = [Student new];
    
    stu.age = [NSNumber numberWithInteger:24];
    stu.name = @"zhangsan" ;
    stu.sex = [NSNumber numberWithBool:YES];
    
    NSLog(@"student = %@",stu);
  


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





