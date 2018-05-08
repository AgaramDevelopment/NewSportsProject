//
//  TeamsCell.h
//  NewSportsProject
//
//  Created by Mac on 21/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamsCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel * Playername;
@property (nonatomic,strong) IBOutlet UILabel * Playertype;
@property (nonatomic,strong) IBOutlet UILabel * Teamname;

@property (nonatomic,strong) IBOutlet UIImageView * playerImg;
@property (nonatomic,strong) IBOutlet UIImageView * teamImg;

@end
