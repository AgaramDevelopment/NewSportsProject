//
//  AppCommon.h
//  AlphaProTracker
//
//  Created by Mac on 21/08/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"


@interface AppCommon : NSObject
{
    UIView *loadingView;
    UIView * menuview;
    UIView * commonview;
    
   // NSString *reqName;
    NSString *nn;
    
     UIStoryboard *storyboard;
    UINavigationController* navigationController;
    
    BOOL isPlayer;
    
    
}
-(void) copyDatabaseIfNotExist;
@property (nonatomic, strong) NSArray *contents;

//@property (nonatomic, strong) NSString *reqName;

@property (strong, nonatomic) UIWindow *window;

+ (AppCommon *)common;
-(void)loadingIcon:(UIView *)view;
-(void)RemoveLoadingIcon;
-(BOOL) isInternetReachable;
-(void)webServiceFailureError;
-(void)reachabilityNotReachableAlert;
- (CGSize)getControlHeight:(NSString *)string withFontName:(NSString *)fontName ofSize:(NSInteger)size withSize:(CGSize)LabelWidth;
-(void)AddMenuView:(UIView *)view;
- (CGSize)getControlHeight:(NSString *)string withFontName:(NSString *)fontName ofSize:(NSInteger)size withSize:(CGSize)LabelWidth;
-(NSArray *)getCorrespondingTeamName:(NSString *)competetionName;
+(void)showAlertWithMessage:(NSString *)message;
-(void)getIPLCompetetion;
-(void)getIPLteams;

+(NSString *)getCurrentCompetitionCode;
+(NSString *)getCurrentCompetitionName;
+(NSString *)getCurrentTeamCode;
+(NSString *)getCurrentTeamName;

@end
extern AppCommon *sharedCommon;
#define COMMON (sharedCommon? sharedCommon:[AppCommon common])
