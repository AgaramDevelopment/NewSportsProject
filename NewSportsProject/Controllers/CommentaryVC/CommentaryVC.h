//
//  CommentaryVC.h
//  NewSportsProject
//
//  Created by Mac on 05/12/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveSummaryCell.h"
#import "PlayingXICell.h"

#import "CommentaryVCCell.h"

@interface CommentaryVC : UIViewController

@property (nonatomic,strong) IBOutlet UICollectionView * ballsTbl;

@property (nonatomic,strong) IBOutlet UITableView * commentTbl;

@property (nonatomic,strong) IBOutlet UIButton * next;
@property (nonatomic,strong) IBOutlet UIButton * previous;



@property (nonatomic,strong) IBOutlet LiveSummaryCell * objcell;

@property (nonatomic,strong) IBOutlet CommentaryVCCell * objlistCell;

@property (nonatomic,strong) IBOutlet UIImageView * img1;
@property (nonatomic,strong) IBOutlet UIImageView * img2;

@property (nonatomic,strong) IBOutlet UIImageView * img3;
@property (nonatomic,strong) IBOutlet UIImageView * img4;


@property (nonatomic,strong) IBOutlet UILabel * Plbl;


@end
