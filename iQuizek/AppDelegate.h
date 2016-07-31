//
//  AppDelegate.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic) UIWindow * window;

@property (readonly, nonatomic) NSManagedObjectContext * managedObjectContext;
@property (readonly, nonatomic) NSManagedObjectModel * managedObjectModel;
@property (readonly, nonatomic) NSPersistentStoreCoordinator * persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
