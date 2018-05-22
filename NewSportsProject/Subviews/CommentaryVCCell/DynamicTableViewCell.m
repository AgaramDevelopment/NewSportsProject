//
//  DynamicTableViewCell.m
//  NewSportsProject
//
//  Created by MAC on 17/05/18.
//  Copyright © 2018 agaraminfotech. All rights reserved.
//

#import "DynamicTableViewCell.h"

@implementation DynamicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //self.cellHeight.constant = 100;
    
    self.Ball.layer.masksToBounds = true;
    self.Ball.clipsToBounds = true;
    self.Ball.layer.cornerRadius = self.Ball.frame.size.width/2;
    
//    self.Ball.backgroundColor = [UIColor blackColor];
//    self.Ball.textColor = [UIColor whiteColor];
//    self.cmtText.textColor= [UIColor blackColor];
//    self.overs.textColor = [UIColor blackColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
