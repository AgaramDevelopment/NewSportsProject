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

@end
