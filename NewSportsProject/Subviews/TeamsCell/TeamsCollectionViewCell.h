//
//  TeamsCollectionViewCell.h
//  NewSportsProject
//
//  Created by MAC on 15/05/18.
//  Copyright © 2018 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamsCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *playerImage;
@property (strong, nonatomic) IBOutlet UILabel *playerRuns;
@property (strong, nonatomic) IBOutlet UILabel *playerName;

@end
