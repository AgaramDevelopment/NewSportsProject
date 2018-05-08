//
//  ScoreCardVC.h
//  NewSportsProject
//
//  Created by Mac on 30/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerStatsListViewCell.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ScoreCardVC : UIViewController

@property (nonatomic,strong) IBOutlet UIImageView * ww;
@property (nonatomic,strong) IBOutlet UIButton * Team1;
@property (nonatomic,strong) IBOutlet UIButton * Team2;

@property (nonatomic,strong) IBOutlet UIButton * Team3;
@property (nonatomic,strong) IBOutlet UIButton * Team4;



@property (nonatomic,strong) IBOutlet UIButton * Inn1;
@property (nonatomic,strong) IBOutlet UIButton * Inn2;
@property (nonatomic,strong) IBOutlet UIButton * Inn3;
@property (nonatomic,strong) IBOutlet UIButton * Inn4;


@property (nonatomic,strong) IBOutlet UIScrollView * commonScroll;

@property (nonatomic,strong) IBOutlet UITableView * popTbl;
@property (nonatomic,strong) IBOutlet UITableView * listTbl;
@property (nonatomic,strong) IBOutlet UITableView * bowlingTbl;

@property (nonatomic,strong) IBOutlet UIView * containerUIView;
@property (nonatomic,strong) IBOutlet UIView * teamsUIView;
@property (nonatomic,strong) IBOutlet UIView * headerUIView;
@property (nonatomic,strong) IBOutlet UIView * headerUIViewTestmatch;

@property (nonatomic,strong)  NSString * matchCode;
@property (nonatomic,strong)  NSString * backkey;
@property (nonatomic,strong)  NSMutableArray * matchDetails;



@property (nonatomic,strong) IBOutlet UILabel * competitionTypelbl;
@property (nonatomic,strong) IBOutlet UILabel * groundlbl;
@property (nonatomic,strong) IBOutlet UILabel * teamAlbl;
@property (nonatomic,strong) IBOutlet UILabel * teamBlbl;
@property (nonatomic,strong) IBOutlet UILabel * teamAScorelbl;
@property (nonatomic,strong) IBOutlet UILabel * teamBScorelbl;
@property (nonatomic,strong) IBOutlet UILabel * teamAinn2Scorelbl;
@property (nonatomic,strong) IBOutlet UILabel * teamBinn2Scorelbl;
@property (nonatomic,strong) IBOutlet UILabel * resultlbl;

@property (nonatomic,strong) IBOutlet UILabel * didNotbatlbl;
@property (nonatomic,strong) IBOutlet UILabel * extraslbl;
@property (nonatomic,strong) IBOutlet UILabel * extrastypelbl;
@property (nonatomic,strong) IBOutlet UILabel * fallofWicketslbl;
@property (nonatomic,strong) IBOutlet UILabel * totallbl;
@property (nonatomic,strong) IBOutlet UILabel * wktsOverslbl;

@property (nonatomic,strong) IBOutlet UIImageView * teamAlogo;
@property (nonatomic,strong) IBOutlet UIImageView * teamBlogo;



@property (nonatomic,strong) NSString *selectRegionCode;
@property (nonatomic,strong) NSString *selectRuns;
@property (nonatomic,strong) NSString *selectBattingStyle;
@property (nonatomic,strong) NSString *sectorrr;

@property (strong, nonatomic) IBOutlet UILabel *lbl_striker;
@property (strong,nonatomic) AVPlayerViewController *avPlayerViewController;
@property (strong,nonatomic) AVPlayer *avPlayer;


@property (strong, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) IBOutlet UIView *rootVideoView;
@property (strong, nonatomic) IBOutlet UICollectionView *ballsColView;


@end
