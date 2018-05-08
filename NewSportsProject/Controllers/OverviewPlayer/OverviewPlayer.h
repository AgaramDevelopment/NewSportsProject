//
//  OverviewPlayer.h
//  NewSportsProject
//
//  Created by Mac on 24/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerStatsListViewCell.h"

@interface OverviewPlayer : UIViewController

@property (nonatomic,strong) IBOutlet UITableView * listTbl;

@property (nonatomic,strong) IBOutlet PlayerStatsListViewCell * objCell;

@end
