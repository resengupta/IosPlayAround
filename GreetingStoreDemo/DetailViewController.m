//
//  DetailViewController.m
//  GreetingStoreDemo
//
//  Created by Sengupta, Reeya (US - Mumbai) on 1/27/15.
//  Copyright (c) 2015 ddstudio. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.productName.text = self.product.name;
    self.productPrice.text = [self.product.price stringValue];
    self.productDesc.text = self.product.desc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
