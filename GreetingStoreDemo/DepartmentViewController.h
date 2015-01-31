//
//  DepartmentViewController.h
//  GreetingStoreDemo
//
//  Created by Sengupta, Reeya (US - Mumbai) on 1/13/15.
//  Copyright (c) 2015 ddstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftDrawerViewController.h"
#import "AppDelegate.h"

@interface DepartmentViewController :  UIViewController <UITableViewDataSource, UITableViewDelegate , HandleLeftDrawerClickDelegate>
@property (strong, nonatomic) IBOutlet UITableView *categoryTable;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end
