//
//  PlayerStatsListViewCell.m
//  NewSportsProject
//
//  Created by Mac on 27/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "PlayerStatsListViewCell.h"

@interface PlayerStatsListViewCell ()


@property (nonatomic,strong) IBOutlet NSLayoutConstraint * cellHeight;
@end

@implementation PlayerStatsListViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //self.cellHeight.constant = 100;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
