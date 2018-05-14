	//
//  AppCommon.m
//  AlphaProTracker
//
//  Created by Mac on 21/08/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "AppCommon.h"
#import "Reachability.h"
#import "WebService.h"
#import "Config.h"
#import "AppDelegate.h"

@implementation AppCommon
AppCommon *sharedCommon = nil;

+ (AppCommon *)common {
    
    NSString *reqName;
    
    if (!sharedCommon) {
        
        sharedCommon = [[self alloc] init];
    }
    return sharedCommon;
}

- (id)init {
    
    return self;
}

-(void)loadingIcon:(UIView *)view
{
    loadingView = [[UIView alloc] initWithFrame:CGRectMake((view.frame.size.width)/2, (view.frame.size.height)/2, 37, 37)];
    
    [loadingView.layer setCornerRadius:5.0];
    
    [loadingView setBackgroundColor:[UIColor blackColor]];
    
    //Enable maskstobound so that corner radius would work.
    
    [loadingView.layer setMasksToBounds:YES];
    
    //Set the corner radius
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    [activityView setFrame:CGRectMake(0,0, 37, 37)];
    
    [activityView setHidesWhenStopped:YES];
    
    [activityView startAnimating];
    
    [loadingView addSubview:activityView];
    [view addSubview:loadingView];
    [view setUserInteractionEnabled:NO];
    
}

-(void)RemoveLoadingIcon
{
    [loadingView removeFromSuperview];
    
}
#pragma mark Reachable

-(BOOL) isInternetReachable
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    if (internetStatus != NotReachable) {
        NSLog(@"Data Connected");
        return YES;
    }
    else {
        [self reachabilityNotReachableAlert];
        return NO;
    }
}

-(void)reachabilityNotReachableAlert{
    
    [self RemoveLoadingIcon];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"] message:@"It appears that you have lost network connectivity. Please check your network settings!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alert show];
    
}

-(void)webServiceFailureError
{
    [self RemoveLoadingIcon];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"] message:@"Server Error" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alert show];
}
#pragma mark - Get Height of Control

- (CGSize)getControlHeight:(NSString *)string withFontName:(NSString *)fontName ofSize:(NSInteger)size withSize:(CGSize)LabelWidth {
    CGSize maxSize = LabelWidth;
    CGSize dataHeight;
    
    UIFont *font = [UIFont fontWithName:fontName size:size];
    //    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //    paragraphStyle.paragraphSpacing = 50 * font.lineHeight;
    NSString *version = [[UIDevice currentDevice] systemVersion];
    
    if ([version floatValue]>=7.0) {
        CGRect textRect = [string boundingRectWithSize:maxSize
                                               options:NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName:font}
                                               context:nil];
        
        
        dataHeight = CGSizeMake(textRect.size.width , textRect.size.height+20);
        
    }
    
    return CGSizeMake(dataHeight.width, dataHeight.height);
}

+(NSString *)getCurrentCompetitionCode
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"SelectedCompetitionCode"];
}

+(NSString *)getCurrentCompetitionName
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"SelectedCompetitionName"];
}

+(NSString *)getCurrentTeamCode
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"SelectedTeamCode"];
}

+(NSString *)getCurrentTeamName
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"SelectedTeamName"];
}

-(void)getIPLCompetetion
{
    if(![COMMON isInternetReachable])
        return;
    
    
        //    [AppCommon showLoading];
        
    WebService *objWebservice = [[WebService alloc]init];
    [objWebservice getIPLCompeteionCodesuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if(responseObject >0)
            {
            appDel.ArrayCompetition = [NSMutableArray new];
            appDel.ArrayCompetition = responseObject;
            
            NSString* Competetioncode = [[appDel.ArrayCompetition firstObject] valueForKey:@"CompetitionCode"];
            NSString* CompetetionName = [[appDel.ArrayCompetition firstObject] valueForKey:@"CompetitionName"];
            NSLog(@"IPL COMPETETION %@ ",responseObject);
            [[NSUserDefaults standardUserDefaults] setValue:CompetetionName forKey:@"SelectedCompetitionName"];
            [[NSUserDefaults standardUserDefaults] setValue:Competetioncode forKey:@"SelectedCompetitionCode"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            }
            //        [AppCommon hideLoading];
    } failure:^(AFHTTPRequestOperation *operation, id error) {
        NSLog(@"failed");
        [COMMON webServiceFailureError];
    }];
    
}

-(void)getIPLteams
{
    if(![COMMON isInternetReachable])
        return;
    
    
        //    [AppCommon showLoading];
    
    WebService* objWebservice = [[WebService alloc]init];
    [objWebservice getIPLTeamCodessuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if(responseObject >0)
            {
            appDel.MainArray = [NSMutableArray new];
            appDel.MainArray = responseObject;
            NSLog(@"IPL TEAMS %@ ",appDel.MainArray);
            NSString* Teamcode = [[responseObject firstObject] valueForKey:@"TeamCode"];
            NSString* TeamName = [[responseObject firstObject] valueForKey:@"TeamName"];
            
            [[NSUserDefaults standardUserDefaults] setValue:TeamName forKey:@"SelectedTeamName"];
            [[NSUserDefaults standardUserDefaults] setValue:Teamcode forKey:@"SelectedTeamCode"];
            
            NSLog(@"IPL COMPETETION %@ ",appDel.MainArray);
            NSString* Competetioncode = [[responseObject firstObject] valueForKey:@"CompetitionCode"];
            NSString* CompetetionName = [[responseObject firstObject] valueForKey:@"CompetitionName"];
            
            [[NSUserDefaults standardUserDefaults] setValue:CompetetionName forKey:@"SelectedCompetitionName"];
            [[NSUserDefaults standardUserDefaults] setValue:Competetioncode forKey:@"SelectedCompetitionCode"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
                //            NSSet* set1 = [NSSet setWithArray:[responseObject valueForKey:@"CompetitionCode"]];
                //            [appDel.ArrayCompetition addObjectsFromArray:];
            
            appDel.ArrayCompetition = [NSMutableArray new];
            
                //            NSMutableArray* temp = [NSMutableArray new];
            for (NSDictionary* dict in responseObject) {
                
                NSLog(@"%@",dict[@"CompetitionCode"]);
                if (![[appDel.ArrayCompetition valueForKey:@"CompetitionCode"] containsObject:dict[@"CompetitionCode"]]) {
                    [appDel.ArrayCompetition addObject:dict];
                    NSLog(@"temp %@",[appDel.ArrayCompetition valueForKey:@"CompetitionCode"]);
                }
                
            }
            NSString* lastYearTeams = [[appDel.ArrayCompetition firstObject] valueForKey:@"CompetitionName"];
            NSArray* temp = [COMMON getCorrespondingTeamName:lastYearTeams];
                //            appDel.ArrayCompetition = temp;
            NSLog(@"appDel.ArrayCompetition %@ ",appDel.ArrayCompetition);
            
            }
        
            //        [AppCommon hideLoading];
        
            //        dispatch_async(dispatch_get_main_queue(), ^{
            //            [self getIPLCompetetion];
            //        });
        
    } failure:^(AFHTTPRequestOperation *operation, id error) {
            //        [AppCommon hideLoading];
        NSLog(@"failed");
        [COMMON webServiceFailureError];
        
    }];
    
}

-(NSArray *)getCorrespondingTeamName:(NSString *)competetionName
{
    
    if (![[NSUserDefaults standardUserDefaults] stringForKey:@"SelectedCompetitionName"]) {
        NSLog(@"Please select Competetion");
    }
    
    NSLog(@"competetionName %@",appDel.MainArray);
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"CompetitionName == %@", competetionName];
    NSArray* temparray = [appDel.MainArray filteredArrayUsingPredicate:resultPredicate];
    
    if (temparray.count > 0) {
        appDel.ArrayTeam = [NSMutableArray new];
        
        for (NSDictionary* temp1 in temparray) {
            if (![[appDel.ArrayTeam valueForKey:@"TeamCode"] containsObject:[temp1 valueForKey:@"TeamCode"]]) {
                [appDel.ArrayTeam addObject:temp1];
            }
        }
        
    }
    else
        {
        NSString* msg = [NSString stringWithFormat:@"NO Teams Founds in %@",competetionName];
        [AppCommon showAlertWithMessage:msg];
        }
    
    return appDel.ArrayTeam;
}

+(void)showAlertWithMessage:(NSString *)message
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:APP_NAME message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [appDel.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
