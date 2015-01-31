//
//  DepartmentViewController.m
//  GreetingStoreDemo
//
//  Created by Sengupta, Reeya (US - Mumbai) on 1/13/15.
//  Copyright (c) 2015 ddstudio. All rights reserved.
//

#import "DepartmentViewController.h"
#import "CoreDataHelper.h"
#import "Product.h"
#import "Department.h"
#import "ProductTableViewCell.h"
#import "DetailViewController.h"

@interface DepartmentViewController (){

    NSArray *categoryList;
    CoreDataHelper *mCoreDataHelperInstance;
    
}
@end

@implementation DepartmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    categoryList = [[NSArray alloc] init];
    mCoreDataHelperInstance = [[CoreDataHelper alloc]initWithContext];
    
    dispatch_queue_t myQueue = dispatch_queue_create("greetingStore", NULL);
    dispatch_async(myQueue, ^{
        
        //[mCoreDataHelperInstance setUpDepartment];
        categoryList = [mCoreDataHelperInstance fetchAllProducts];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            [self.categoryTable reloadData];
            
        });
    });
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
    return categoryList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"ProductTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell = [self generateProductCell:(ProductTableViewCell *)cell withIndexPath:indexPath];
    return cell;
}

- (UITableViewCell *)generateProductCell:(ProductTableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath{
    
    if (cell==nil) {
        cell = [[ProductTableViewCell alloc]init];
    }
    Product* product = [categoryList objectAtIndex:indexPath.row];
    cell.productNameLb.text = product.name;
    cell.productBrandLb.text = product.brand;
    [cell.productImage loadImageAsyncFromURL:product.image_url placeholderImage:[UIImage imageNamed:@"no_image_bg"]];
    cell.productPriceLb.text = [product.price stringValue];
    cell.productDescLb.text = product.desc;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    controller.product = [categoryList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)onLeftDrawerOptionClicked:(Department*)department{
    self.categoryLabel.text = department.name;
    categoryList = [mCoreDataHelperInstance fetchProductByDepartment:department];
    [self.categoryTable reloadData];
}

@end
