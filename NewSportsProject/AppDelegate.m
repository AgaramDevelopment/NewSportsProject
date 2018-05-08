//
//  AppDelegate.m
//  NewSportsProject
//
//  Created by Mac on 13/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "AppDelegate.h"
#import "UITabBarController+Swipe.h"
#import "tabViewController.h"


@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    
    
    UIViewController *initViewController;
    UIStoryboard *storyBoard;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        // iPad
        
        storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
    } else {
        // iPhone
        
        storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    }
    
    //if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Skip"]) {
        //initViewController = [storyBoard instantiateViewControllerWithIdentifier:@"tabViewController"];
//    } else {
        initViewController = [storyBoard instantiateViewControllerWithIdentifier:@"tabViewController"];
//    }
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:initViewController];
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    navigationController.navigationBarHidden = YES;
    _window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    
    tabViewController *tab = [[tabViewController alloc]init];
    
   // tabViewController = (UITabBarController *)self.window.rootViewController;
    [tab setupSwipeGestureRecognizersAllowCyclingThroughTabs:YES];

    
    return YES;

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
