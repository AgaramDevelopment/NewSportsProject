//
//  CommentaryVCCell.h
//  NewSportsProject
//
//  Created by Mac on 05/12/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentaryVCCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel * Ball;

//@property (nonatomic,strong) IBOutlet UILabel * cmtText;
@property (strong, nonatomic) IBOutlet UITextView *cmtText;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constraintTextViewHeight;

@property (nonatomic,strong) IBOutlet UILabel * overs;

@property (nonatomic,strong) IBOutlet UILabel * title;


@property (nonatomic,strong) IBOutlet NSLayoutConstraint * flexibleHeight;





@end
