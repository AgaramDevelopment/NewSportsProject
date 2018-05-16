//
//  PointsTableVC.h
//  NewSportsProject
//
//  Created by Mac on 20/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PointsTableCell.h"

@interface PointsTableVC : UIViewController

@property (nonatomic,strong) IBOutlet UITableView * ListTbl;
@property (nonatomic,strong) IBOutlet PointsTableCell * objCell;

@property (nonatomic,strong) IBOutlet UIView * ShawdowView;

@property (nonatomic,strong)  NSString * backKey;

@property (nonatomic,strong) IBOutlet UITableView * popTbl;

@property (nonatomic,strong) IBOutlet UIButton * CompetBtn;
@property (nonatomic,strong) IBOutlet UIButton * SeasonBtn;

@property (nonatomic,strong) IBOutlet UIView * v1;
@property (nonatomic,strong) IBOutlet UIView * v2;

@property (nonatomic,strong)  NSMutableArray * PointsArray;

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
