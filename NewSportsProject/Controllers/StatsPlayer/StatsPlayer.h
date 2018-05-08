//
//  StatsPlayer.h
//  NewSportsProject
//
//  Created by Mac on 24/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerStatsCell.h"

@interface StatsPlayer : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) IBOutlet UICollectionView * GridTbl;

@property (nonatomic,strong) IBOutlet UIButton * t20;
@property (nonatomic,strong) IBOutlet UIButton * odi;
@property (nonatomic,strong) IBOutlet UIButton * testmatch;

@property (nonatomic,strong) IBOutlet UIView * headerView;

@end
