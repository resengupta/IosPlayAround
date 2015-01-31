//
//  LeftDrawerViewController.h
//  GreetingStoreDemo
//
//  Created by Sengupta, Reeya (US - Mumbai) on 1/15/15.
//  Copyright (c) 2015 ddstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Department.h"

@protocol DepartmentSelectionDelegate <NSObject>

@required
-(void)onDepartmentClicked:(Department*)department;

@end

@interface LeftDrawerViewController : UIViewController

@property (nonatomic) NSArray *departmentList;
@property (nonatomic, assign) id<DepartmentSelectionDelegate> delegate;

@end
