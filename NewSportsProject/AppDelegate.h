//
//  AppDelegate.h
//  NewSportsProject
//
//  Created by Mac on 13/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"
#import "NewSportsProject-Bridging-Header.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, readwrite) NSString *Currentmatchcode;
@property (strong, readwrite) NSMutableArray *Scorearray;

@property (strong, readwrite) NSString *backkey;
@property (strong, readwrite) NSString *LiveMatchCode;
@property (strong, nonatomic) NSMutableArray *ArrayCompetition;
@property (strong, nonatomic) NSMutableArray *ArrayTeam;
@property (strong, nonatomic) NSMutableArray *MainArray;
@end

