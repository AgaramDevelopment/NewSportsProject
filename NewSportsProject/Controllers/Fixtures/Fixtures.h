//
//  Fixtures.h
//  NewSportsProject
//
//  Created by Mac on 16/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FixturesCell.h"

@interface Fixtures : UIViewController

@property (nonatomic,strong) IBOutlet UITableView * ListTbl;
@property (nonatomic,strong) IBOutlet UITableView * popTbl;

@property (nonatomic,strong) IBOutlet FixturesCell * objCell;

@property (nonatomic,strong) IBOutlet UIView * ShawdowView;

@property (nonatomic,strong) IBOutlet UIButton * CompetBtn;
@property (nonatomic,strong) IBOutlet UIButton * SeasonBtn;

@property (nonatomic,strong)  NSString * backKey;

@property (nonatomic,strong) IBOutlet UIView * v1;
@property (nonatomic,strong) IBOutlet UIView * v2;


@property (nonatomic,strong) IBOutlet NSMutableArray * fixturesArray;

@property (nonatomic,strong)IBOutlet  UILabel * competitionLbl;





@end
