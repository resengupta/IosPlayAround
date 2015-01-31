//
//  AppDelegate.h
//  GreetingStoreDemo
//
//  Created by Sengupta, Reeya (US - Mumbai) on 1/13/15.
//  Copyright (c) 2015 ddstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MMNavigationController.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "LeftDrawerViewController.h"

@protocol HandleLeftDrawerClickDelegate <NSObject>

@required
-(void)onLeftDrawerOptionClicked:(Department*)department;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate, DepartmentSelectionDelegate>

@property (nonatomic,strong) MMDrawerController * drawerController;

@property (nonatomic, assign) id<HandleLeftDrawerClickDelegate> leftDrawerDelegate;

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

