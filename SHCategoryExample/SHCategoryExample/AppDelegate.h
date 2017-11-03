//
//  AppDelegate.h
//  SHCategoryExample
//
//  Created by Motian on 2017/11/3.
//  Copyright © 2017年 Motian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

