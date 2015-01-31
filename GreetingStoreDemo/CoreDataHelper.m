//
//  CoreDataHelper.m
//  GreetingStoreDemo
//
//  Created by Sengupta, Reeya (US - Mumbai) on 1/14/15.
//  Copyright (c) 2015 ddstudio. All rights reserved.
//

#import "CoreDataHelper.h"
#import "AppDelegate.h"
#import "Department.h"
#import "Product.h"

@implementation CoreDataHelper

NSManagedObjectContext *context;
NSString * const kCoreProductName = @"name";
NSString * const kCoreProductDesc = @"description";
NSString * const kCoreProductBrand = @"brand";
NSString * const kCoreProductPrice = @"price";
NSString * const kCoreProductImageUrl = @"image_url";


-(id)initWithContext{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    return self;
}

-(void)setUpDepartment {

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"department" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSDictionary *items = [json valueForKeyPath:@"categories"];
    for(id key in items){
        [self saveCategoryWith:key saveWithNSDictionary:[items objectForKey:key]];
    }
    
}
-(void)saveCategoryWith:(NSString *)categoryName saveWithNSDictionary:(NSDictionary *)dict{
    
    Department *categoriesObj = [NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:context];
    [categoriesObj setValue:categoryName forKey:@"name"];
    
    for (NSDictionary* product in dict) {
        [self saveProductWithNSDictionary:product saveWithRelation:categoriesObj];
    }
}

-(void)saveProductWithNSDictionary:(NSDictionary *)dict saveWithRelation:(Department *)categoryObj{
    
    Product *productObj = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
    [productObj setValue:dict[kCoreProductName] forKey:kCoreProductName];
    [productObj setValue:dict[kCoreProductBrand] forKey:kCoreProductBrand];
    [productObj setValue:dict[kCoreProductDesc] forKey:@"desc"];
    NSNumber *price = dict[kCoreProductPrice];
    [productObj setValue:[NSNumber numberWithInt:[price floatValue]] forKey:kCoreProductPrice];
    [productObj setValue:dict[kCoreProductImageUrl] forKey:kCoreProductImageUrl];
    [categoryObj addProductsObject:productObj];
    NSError *error = nil;
    [context save:&error];
}

-(NSArray*)fetchAllProducts{
    NSArray* list = [[NSArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSUInteger count = [context countForFetchRequest:fetchRequest error:&error];
    
    if (!count){
        [self setUpDepartment];
    }
    list = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    return list;
}

-(NSArray*)fetchAllDepartments{
    NSArray* list = [[NSArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Department" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSUInteger count = [context countForFetchRequest:fetchRequest error:&error];
    
    if (!count){
        [self setUpDepartment];
    }
    list = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Unable to execute Department fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    return list;
}

-(NSArray*)fetchProductByDepartment:(Department*)department{
    NSArray* list = [[NSArray alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Product"];
    
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:context];
//    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"price" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
     
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"department.name CONTAINS %@", department.name];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;

    list = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Unable to execute Department fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    return list;
}


@end
