//
//  CommentaryVC.h
//  NewSportsProject
//
//  Created by Mac on 05/12/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveSummaryCell.h"
#import "PlayingXICell.h"

#import "CommentaryVCCell.h"

@interface CommentaryVC : UIViewController

@property (strong, nonatomic) IBOutlet UIView *navigationView;

@property (nonatomic,strong) IBOutlet UICollectionView * ballsTbl;

@property (nonatomic,strong) IBOutlet UITableView * commentTbl;

@property (nonatomic,strong) IBOutlet UIButton * next;
@property (nonatomic,strong) IBOutlet UIButton * previous;


@property (strong, nonatomic) IBOutlet UILabel *competitionTypeLbl;
@property (strong, nonatomic) IBOutlet UILabel *groundLbl;


@property (strong, nonatomic) IBOutlet UIImageView *teamALogo;
@property (strong, nonatomic) IBOutlet UILabel *teamANameLbl;
@property (strong, nonatomic) IBOutlet UILabel *teamAScoreLbl;
@property (strong, nonatomic) IBOutlet UILabel *teamAOversLbl;

@property (strong, nonatomic) IBOutlet UIImageView *teamBLogo;
@property (strong, nonatomic) IBOutlet UILabel *teamBNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *teamBScoreLbl;
@property (strong, nonatomic) IBOutlet UILabel *teamBOversLbl;

@property (strong, nonatomic) IBOutlet UILabel *runRateLbl;
@property (strong, nonatomic) IBOutlet UILabel *wonMatchLbl;


@property (nonatomic,strong) IBOutlet LiveSummaryCell * objcell;

@property (nonatomic,strong) IBOutlet CommentaryVCCell * objlistCell;



@property (nonatomic,strong) IBOutlet UILabel * Plbl;
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;
@property (strong, nonatomic) IBOutlet UIImageView *img4;

    //Batting Partnership Properties
@property (nonatomic,strong) IBOutlet UILabel * battingPartnershipLbl;
@property (strong, nonatomic) IBOutlet UILabel *partnershipRunsLbl;
@property (strong, nonatomic) IBOutlet UIImageView *battingStrikerImage;
@property (strong, nonatomic) IBOutlet UILabel *battingStrikerNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *battingStrikerRunsLbl;

@property (strong, nonatomic) IBOutlet UIImageView *battingNonStrikerImage;
@property (strong, nonatomic) IBOutlet UILabel *battingNonStrikerNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *battingNonStrikerRunsLbl;

    //Bowling Partnership Properties
@property (nonatomic,strong) IBOutlet UILabel * bowlingPartnershipLbl;
@property (strong, nonatomic) IBOutlet UILabel *partnershipOversLbl;
@property (strong, nonatomic) IBOutlet UIImageView *bowlingStrikerImage;
@property (strong, nonatomic) IBOutlet UILabel *bowlingStrikerNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *bowlingStrikerOversLbl;

@property (strong, nonatomic) IBOutlet UIImageView *bowlingNonStrikerImage;
@property (strong, nonatomic) IBOutlet UILabel *bowlingNonStrikerNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *bowlingNonStrikerOversLbl;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *naviHeight;
@property (strong, nonatomic)  NSString *livetype;
@property (strong, nonatomic)  NSString *matchCode;

@end
