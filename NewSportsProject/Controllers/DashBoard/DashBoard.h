//
//  DashBoard.h
//  NewSportsProject
//
//  Created by Mac on 13/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PointsTableCell.h"
#import "SwipeView.h"

@interface DashBoard : UIViewController


@property (nonatomic,strong) IBOutlet UIPageControl * page_control;

@property (nonatomic,strong) IBOutlet UIScrollView * header_scroll;

@property (nonatomic,strong) IBOutlet UIView * CommonView;

@property (nonatomic,strong) IBOutlet UIView * ResultView;

@property (nonatomic,strong) IBOutlet UIImageView * img1;
@property (nonatomic,strong) IBOutlet UIImageView * img2;

@property (nonatomic,strong) IBOutlet UIImageView * img1logo;
@property (nonatomic,strong) IBOutlet UIImageView * img2logo;

@property (nonatomic,strong) IBOutlet UIImageView * resultImg1;
@property (nonatomic,strong) IBOutlet UIImageView * resultImg2;

@property (nonatomic,strong) IBOutlet UITableView * PointsTable;
@property (nonatomic,strong) IBOutlet PointsTableCell * objCell;



@property (nonatomic,strong) IBOutlet UILabel * resultDate;
@property (nonatomic,strong) IBOutlet UILabel * resulttime;

@property (nonatomic,strong) IBOutlet UILabel * firstInn;
@property (nonatomic,strong) IBOutlet UILabel * secondInn;
@property (nonatomic,strong) IBOutlet UILabel * thirdInn;
@property (nonatomic,strong) IBOutlet UILabel * fourthInn;

@property (nonatomic,strong) IBOutlet UILabel * groundName;

@property (nonatomic,strong) IBOutlet UILabel * team1Name;
@property (nonatomic,strong) IBOutlet UILabel * team2Name;


@property (nonatomic,strong) IBOutlet UILabel * resultDetails;

@property (nonatomic,strong) NSArray* selectedComptetionArray;
//Season Table Properties

@property (strong, nonatomic) IBOutlet UILabel *teamLbl;
@property (strong, nonatomic) IBOutlet UILabel *playedLbl;
@property (strong, nonatomic) IBOutlet UILabel *wonLbl;
@property (strong, nonatomic) IBOutlet UILabel *lostLbl;
@property (strong, nonatomic) IBOutlet UILabel *tiedLbl;
@property (strong, nonatomic) IBOutlet UILabel *noResultLbl;
@property (strong, nonatomic) IBOutlet UILabel *netRunRateLbl;
@property (strong, nonatomic) IBOutlet UILabel *pointsLbl;
@end
