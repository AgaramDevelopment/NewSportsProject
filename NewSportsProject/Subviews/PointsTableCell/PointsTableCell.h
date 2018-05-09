//
//  PointsTableCell.h
//  NewSportsProject
//
//  Created by Mac on 14/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PointsTableCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel * Position;


@property (nonatomic,strong) IBOutlet UILabel * TeamName;
@property (nonatomic,strong) IBOutlet UILabel * Played;
@property (nonatomic,strong) IBOutlet UILabel * Won;
@property (nonatomic,strong) IBOutlet UILabel * Lost;
@property (nonatomic,strong) IBOutlet UILabel * Tied;
@property (nonatomic,strong) IBOutlet UILabel * NoResult;
@property (nonatomic,strong) IBOutlet UILabel * NetRR;
@property (nonatomic,strong) IBOutlet UILabel * Points;

@end
