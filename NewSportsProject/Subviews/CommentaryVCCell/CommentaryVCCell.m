//
//  CommentaryVCCell.m
//  NewSportsProject
//
//  Created by Mac on 05/12/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "CommentaryVCCell.h"

@interface CommentaryVCCell ()

@end

@implementation CommentaryVCCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //self.cellHeight.constant = 100;
    
    self.Ball.layer.masksToBounds = true;
    self.Ball.clipsToBounds = true;
    self.Ball.layer.cornerRadius = self.Ball.frame.size.width/2;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
