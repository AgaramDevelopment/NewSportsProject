//
//  DynamicTableViewCell.h
//  NewSportsProject
//
//  Created by MAC on 17/05/18.
//  Copyright © 2018 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *Ball;
@property (strong, nonatomic) IBOutlet UILabel *overs;
@property (strong, nonatomic) IBOutlet UILabel *cmtText;

@end
