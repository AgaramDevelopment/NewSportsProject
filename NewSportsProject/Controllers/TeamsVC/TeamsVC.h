//
//  TeamsVC.h
//  NewSportsProject
//
//  Created by Mac on 21/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamsCell.h"

@interface TeamsVC : UIViewController


@property (nonatomic,strong) IBOutlet UITableView * ListTbl;
@property (nonatomic,strong) IBOutlet UICollectionView * GridTbl;

@property (nonatomic,strong) IBOutlet TeamsCell * objCell;

@property (nonatomic,strong) IBOutlet UIView * ShawdowView;

@property (nonatomic,strong)  NSString * backKey;

@property (nonatomic,strong) IBOutlet UITableView * popTbl;

@property (nonatomic,strong) IBOutlet UIButton * CompetBtn;
@property (nonatomic,strong) IBOutlet UIButton * SeasonBtn;

@property (nonatomic,strong) IBOutlet UIButton * listBtn;
@property (nonatomic,strong) IBOutlet UIButton * gridBtn;

@property (nonatomic,strong) IBOutlet UIView * v1;
@property (nonatomic,strong) IBOutlet UIView * v2;


@end
