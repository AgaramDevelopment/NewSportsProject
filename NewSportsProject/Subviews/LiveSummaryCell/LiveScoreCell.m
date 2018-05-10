//
//  LiveScoreCell.m
//  NewSportsProject
//
//  Created by MAC on 10/05/18.
//  Copyright © 2018 agaraminfotech. All rights reserved.
//

#import "LiveScoreCell.h"

@interface LiveScoreCell ()


@end

@implementation LiveScoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
        // Initialization code
    
    self.Ball1.layer.masksToBounds = true;
    self.Ball1.clipsToBounds = true;
    self.Ball1.layer.cornerRadius = self.Ball1.frame.size.width/2;
}

@end
