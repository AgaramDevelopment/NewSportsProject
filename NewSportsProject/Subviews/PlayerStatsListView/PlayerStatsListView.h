//
//  PlayerStatsListView.h
//  NewSportsProject
//
//  Created by Mac on 27/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerStatsListViewCell.h"

@interface PlayerStatsListView : UIViewController

@property (nonatomic,strong) IBOutlet PlayerStatsListViewCell * objCell;
@property (nonatomic,strong) IBOutlet UIButton * t20;
@property (nonatomic,strong) IBOutlet UIButton * odi;
@property (nonatomic,strong) IBOutlet UIButton * testmatch;

@property (nonatomic,strong) IBOutlet UIView * headerView;

@property (nonatomic,strong) IBOutlet UITableView * ListTbl;

@property (nonatomic,strong) IBOutlet UILabel * colorlbl;

@end
