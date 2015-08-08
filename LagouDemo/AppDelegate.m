//
//  AppDelegate.m
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright (c) 2015年 范东. All rights reserved.
//

#import "AppDelegate.h"
#import "FDTabBarController.h"
#import "FDJobViewController.h"
#import "FDSearchViewController.h"
#import "FDMyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self createTBC];
    [self customTBC];
    return YES;
}
/**创建根视图控制器*/
-(void)createTBC
{
    NSArray *vcNames=@[@"FDJobViewController",
                       @"FDSearchViewController",
                       @"FDMyViewController"];
    NSMutableArray *ncObjects=[NSMutableArray array];
    for (NSString *vcName in vcNames) {
        Class vcClass=NSClassFromString(vcName);
        UIViewController *vc=[[vcClass alloc]init];
        UINavigationController *nc=[[UINavigationController alloc]initWithRootViewController:vc];
        [ncObjects addObject:nc];
    }
    UITabBarController *tbc=[[UITabBarController alloc]init];
    tbc.viewControllers=ncObjects;
    self.window.rootViewController=tbc;
}
-(void)customTBC
{
    UITabBarController *tbc=(UITabBarController *)self.window.rootViewController;
    NSArray *normalImages=@[@"job_normal",@"search_normal",@"my_normal"];
    NSArray *selectImages=@[@"job_highlighted",@"search_highlighted",@"my_highlighted"];
    NSArray *titles=@[@"职位",@"搜索",@"我的"];
    for (NSInteger i=0; i<tbc.viewControllers.count; i++) {
        UINavigationController *nc=tbc.viewControllers[i];
        nc.tabBarItem=[[UITabBarItem alloc]initWithTitle:titles[i] image:[UIImage imageNamed:normalImages[i]] selectedImage:[UIImage imageNamed:selectImages[i]]];
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
