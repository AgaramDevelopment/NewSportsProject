//
//  LiveSummaryCell.m
//  NewSportsProject
//
//  Created by Mac on 28/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "LiveSummaryCell.h"

@interface LiveSummaryCell ()

@end

@implementation LiveSummaryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    self.Ball1.layer.masksToBounds = true;
    self.Ball1.clipsToBounds = true;
    self.Ball1.layer.cornerRadius = self.Ball1.frame.size.width/2;
    
    self.Ball2.layer.masksToBounds = true;
    self.Ball2.clipsToBounds = true;
    self.Ball2.layer.cornerRadius = self.Ball2.frame.size.width/2;

    
    self.Ball3.layer.masksToBounds = true;
    self.Ball3.clipsToBounds = true;
    self.Ball3.layer.cornerRadius = self.Ball3.frame.size.width/2;

    
    self.Ball4.layer.masksToBounds = true;
    self.Ball4.clipsToBounds = true;
    self.Ball4.layer.cornerRadius = self.Ball4.frame.size.width/2;

    
    self.Ball5.layer.masksToBounds = true;
    self.Ball5.clipsToBounds = true;
    self.Ball5.layer.cornerRadius = self.Ball5.frame.size.width/2;

    
    self.Ball6.layer.masksToBounds = true;
    self.Ball6.clipsToBounds = true;
    self.Ball6.layer.cornerRadius = self.Ball6.frame.size.width/2;

    
    //self.Ball1.backgroundColor = [UIColor colorWithRed:(214/255.0f) green:(31/255.0f) blue:(38/255.0f) alpha:1.0f];
    //self.Ball4.backgroundColor = [UIColor colorWithRed:(44/255.0f) green:(167/255.0f) blue:(219/255.0f) alpha:1.0f];
    //self.Ball5.backgroundColor = [UIColor colorWithRed:(44/255.0f) green:(167/255.0f) blue:(219/255.0f) alpha:1.0f];

    
    
    
    
}


@end
