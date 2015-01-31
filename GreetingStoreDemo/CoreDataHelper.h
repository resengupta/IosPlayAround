//
//  CoreDataHelper.h
//  GreetingStoreDemo
//
//  Created by Sengupta, Reeya (US - Mumbai) on 1/14/15.
//  Copyright (c) 2015 ddstudio. All rights reserved.
//

#import <Foundation/Foundation.h>
# import "AppDelegate.h"

@interface CoreDataHelper : NSObject

-(id)initWithContext;
-(void)setUpDepartment;
-(void)saveCategoryWith:(NSString *)categoryName saveWithNSDictionary:(NSDictionary *)dict;
-(void)saveProductWithNSDictionary:(NSDictionary *)dict saveWithRelation:(NSManagedObject *)categoryObj;
-(NSArray*)fetchAllProducts;
-(NSArray*)fetchAllDepartments;
-(NSArray*)fetchProductByDepartment:(Department*)department;

@end
