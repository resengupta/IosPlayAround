//
//  LeftDrawerViewController.m
//  GreetingStoreDemo
//
//  Created by Sengupta, Reeya (US - Mumbai) on 1/15/15.
//  Copyright (c) 2015 ddstudio. All rights reserved.
//

#import "LeftDrawerViewController.h"
#import "CoreDataHelper.h"


@interface LeftDrawerViewController (){
    CoreDataHelper *mCoreDataHelperInstance;
}
@end

@implementation LeftDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mCoreDataHelperInstance = [[CoreDataHelper alloc]initWithContext];
    self.departmentList = mCoreDataHelperInstance.fetchAllDepartments;
    
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

#pragma TableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.departmentList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Department *department = [self.departmentList objectAtIndex:indexPath.row];
    [cell.textLabel setText:department.name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.delegate!=nil){
        [self.delegate onDepartmentClicked:[self.departmentList objectAtIndex:indexPath.row]];
    }
}

@end
