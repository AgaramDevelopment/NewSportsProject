//
//  tabViewController.m
//  UPCA
//
//  Created by Lexicon on 15/06/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "tabViewController.h"
#import "DashBoard.h"
#import "Fixtures.h"
#import "DashBoard.h"
@interface tabViewController ()
{
    DashBoard *dash;
}

@end

@implementation tabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = self.tabBar;
    
    UITabBarItem *tabItem1 = [tabBar.items objectAtIndex:0];
    //[tabItem1 setSelectedImage:[UIImage imageNamed:@"Home_white"]];
    tabItem1.selectedImage = [[UIImage imageNamed:@"Home_white"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabItem1.image = [[UIImage imageNamed:@"Home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabItem1.title = @"HOME";

    
    UITabBarItem *tabItem2 = [tabBar.items objectAtIndex:1];
    tabItem2.selectedImage = [[UIImage imageNamed:@"Schedule_white"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabItem2.image = [[UIImage imageNamed:@"Schedule"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabItem2.title = @"SCHEDULE";
    
//    UITabBarItem *tabItem3 = [tabBar.items objectAtIndex:2];
//    tabItem3.selectedImage = [[UIImage imageNamed:@"GameCenterWhite"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem3.image = [[UIImage imageNamed:@"GameCenterBlue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem3.title = @"GAME CENTER";
    
//    UITabBarItem *tabItem4 = [tabBar.items objectAtIndex:2];
//    tabItem4.selectedImage = [[UIImage imageNamed:@"LiveWhite"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem4.image = [[UIImage imageNamed:@"LiveBlue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem4.title = @"LIVE";
    
    UITabBarItem *tabItem5 = [tabBar.items objectAtIndex:2];
    tabItem5.selectedImage = [[UIImage imageNamed:@"ScorecardWhite"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabItem5.image = [[UIImage imageNamed:@"ScorecardBlue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabItem5.title = @"SCORE CARD";
    
//    UITabBarItem *tabItem6 = [tabBar.items objectAtIndex:5];
//    tabItem6.selectedImage = [[UIImage imageNamed:@"PlayingIXWhite"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem6.image = [[UIImage imageNamed:@"PlayengXIBlue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem6.title = @"PLAYING XI";
    
//    UITabBarItem *tabItem7 = [tabBar.items objectAtIndex:4];
//    tabItem7.selectedImage = [[UIImage imageNamed:@"HeadWhite"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem7.image = [[UIImage imageNamed:@"HeadBlue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem7.title = @"HEAD2HEAD";
    
    UITabBarItem *tabItem8 = [tabBar.items objectAtIndex:3];
    tabItem8.selectedImage = [[UIImage imageNamed:@"CommentaryWhite"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabItem8.image = [[UIImage imageNamed:@"CommentaryBlue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabItem8.title = @"LIVE COMMENTARY";


    
    self.tabBar.barTintColor=[UIColor colorWithRed:(24/255.0f) green:(40/255.0f) blue:(126/255.0f) alpha:1.0f];
    //self.tabBar.tintColor = [UIColor whiteColor];
    //self.tabBar.unselectedItemTintColor = [UIColor colorWithRed:(80/255.0f) green:(177/255.0f) blue:(215/255.0f) alpha:1.0f];
    
//
    
    // Add this code to change StateNormal text Color,
    [UITabBarItem.appearance setTitleTextAttributes:
  @{NSForegroundColorAttributeName : [UIColor colorWithRed:(80/255.0f) green:(177/255.0f) blue:(215/255.0f) alpha:1.0f]}
                                           forState:UIControlStateNormal];
    
    // then if StateSelected should be different, you should add this code
    [UITabBarItem.appearance setTitleTextAttributes:
  @{NSForegroundColorAttributeName : [UIColor whiteColor]}
                                           forState:UIControlStateSelected];
    
//
//    UITabBarItem *tabItem4 = [tabBar.items objectAtIndex:3];
//    tabItem4.selectedImage = [[UIImage imageNamed:@"selectimg"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem4.image = [[UIImage imageNamed:@"deselectimg"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabItem4.title = @"xxxx";
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedRightButton:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedLeftButton:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
    
    
    }
-(void) viewWillLayoutSubviews
{
    
    
    CGRect tabFrame = self.objTabbar.frame;
    tabFrame.size.height = 55;
    tabFrame.origin.y = self.view.frame.size.height-55;
    [self.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -50)];
    self.objTabbar.frame = tabFrame;
   
}


- (IBAction)tappedRightButton:(id)sender
{
    NSUInteger selectedIndex = [self.tabBarController selectedIndex];
    
    [self.tabBarController setSelectedIndex:selectedIndex + 1];
}

- (IBAction)tappedLeftButton:(id)sender
{
    NSUInteger selectedIndex = [dash.tabBarController selectedIndex];
    
    [self.tabBarController setSelectedIndex:selectedIndex - 1];
}

#pragma mark UITABBAR DELEGATES
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0)
{
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"Selected tabbar %@ ",viewController.description);
}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED
{
    NSLog(@"willBeginCustomizingViewControllers");
}
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED
{
    NSLog(@"willEndCustomizingViewControllers");
}
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed __TVOS_PROHIBITED
{
    NSLog(@"didEndCustomizingViewControllers");
}

//- (UIInterfaceOrientationMask)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED
//{
//
//}
//- (UIInterfaceOrientation)tabBarControllerPreferredInterfaceOrientationForPresentation:(UITabBarController *)tabBarController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED
//{
//
//}

//- (nullable id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
//                               interactionControllerForAnimationController: (id <UIViewControllerAnimatedTransitioning>)animationController NS_AVAILABLE_IOS(7_0)
//{
//
//}
//
//- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
//                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
//                                                       toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
//{
//
//}
@end
