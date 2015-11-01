//
//  ViewController.m
//  ArchiverDemo
//
//  Created by co-meite on 15/10/29.
//  Copyright © 2015年 co-meite. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"person.data"];
    UserModel *userModel = [[UserModel alloc]init];
    userModel.userName = @"Nian bing";
    userModel.userId = @"2214567";
    userModel.userMessage = @"Coco having calling you";
    [NSKeyedArchiver archiveRootObject:userModel toFile:file];
    
    UserModel *decodeModel = [[UserModel alloc]init];
    decodeModel = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"%@",decodeModel);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
