//
//  HeadToHeadVC.h
//  NewSportsProject
//
//  Created by Mac on 04/12/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadToHeadVC : UIViewController


@property (nonatomic,strong) IBOutlet UILabel * titlelbl;

@property (nonatomic,strong) IBOutlet UILabel * perValueTeam1;
@property (nonatomic,strong) IBOutlet UILabel * perValueTeam2;

@property (nonatomic,strong) IBOutlet UILabel * perValueTeam3;

@property (nonatomic,strong) IBOutlet UILabel * perValueTeam4;

@property (nonatomic,strong) IBOutlet UILabel * perValueTeam5;

@property (nonatomic,strong) IBOutlet UILabel * perValueTeam6;




@property (nonatomic,strong) IBOutlet UIProgressView * team1WinPer;
@property (nonatomic,strong) IBOutlet UIProgressView * team2WinPer;


@property (nonatomic,strong) IBOutlet UIProgressView * team1Home;
@property (nonatomic,strong) IBOutlet UIProgressView * team2Home;

@property (nonatomic,strong) IBOutlet UIProgressView * team1Opp;
@property (nonatomic,strong) IBOutlet UIProgressView * team2Opp;

@end
