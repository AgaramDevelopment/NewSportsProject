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
#import "AppCommon.h"
#import "NewSportsProject-Swift.h"

#import "KYPopTransition.h"
#import "KYPushTransition.h"
#import "KYPopInteractiveTransition.h"

@class GemViewController1;
@interface AppDelegate ()
{
    KYPopInteractiveTransition *popInteractive;
}


@end

@implementation AppDelegate

@synthesize storyBoard,window;

@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

//    tabViewController *initViewController;
    GemViewController1 *initViewController;
    storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
//    initViewController = (tabViewController*)[storyBoard instantiateViewControllerWithIdentifier:@"tabViewController"];
    
    initViewController = (GemViewController1 *)[storyBoard instantiateViewControllerWithIdentifier:@"YawRotationViewController"];
//    [GemViewController1 make]
//    let viewController = YawRotationViewController.make(scrollDirection: .vertical, effect: .yawDown)
//    navigationController?.pushViewController(viewController, animated: true)

    navigationController = [[UINavigationController alloc] initWithRootViewController:initViewController];
    
    navigationController.navigationBarHidden = YES;
    
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    
//    [initViewController setupSwipeGestureRecognizersAllowCyclingThroughTabs:YES];
    
    [COMMON getIPLteams];
    
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

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        
        KYPushTransition *flip = [KYPushTransition new];
        return flip;
        
    }else if (operation == UINavigationControllerOperationPop){
        
        KYPopTransition *flip = [KYPopTransition new];
        return flip;
        
    }else{
        return nil;
    }
}


- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    return popInteractive.interacting ? popInteractive : nil;
}



@end
