//
//  ViewController.m
//  Transition
//
//  Created by Xu Mengtong on 29/12/16.
//  Copyright © 2016年 Xu Mengtong. All rights reserved.
//

#import "ViewController.h"

#import "DBRoutes.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    DBR_callback block = [DBRoutes matchBlock:@"inner://test"];
    block(@"inner://test" ,@"inner://test?query=text".db_parseURLQuery ,^(NSString *str){
        NSLog(@"%@" ,str);
    });
    
    NSLog(@"----> context=%@" ,self.dbr_context);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIViewController *c = [DBRoutes matchController:@"inner://controller?a=100"];
    [self.navigationController pushViewController:c animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
