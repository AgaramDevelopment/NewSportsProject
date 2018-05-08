//
//  LiveSummaryVC.h
//  NewSportsProject
//
//  Created by Mac on 28/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LiveSummaryCell.h"

@interface LiveSummaryVC : UIViewController

@property (nonatomic,strong) IBOutlet UICollectionView * ballsTbl;

@property (nonatomic,strong) IBOutlet LiveSummaryCell * objcell;

@property (nonatomic,strong) IBOutlet UIImageView * img1;
@property (nonatomic,strong) IBOutlet UIImageView * img2;

@property (nonatomic,strong) IBOutlet UIImageView * img3;
@property (nonatomic,strong) IBOutlet UIImageView * img4;


@property (nonatomic,strong) IBOutlet UILabel * Plbl;
@property (nonatomic,strong) IBOutlet UILabel * Blbl;

@end
