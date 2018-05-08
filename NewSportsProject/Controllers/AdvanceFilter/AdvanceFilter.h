//
//  AdvanceFilter.h
//  NewSportsProject
//
//  Created by Mac on 17/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvanceFilter : UIViewController

@property (nonatomic,strong) IBOutlet UIButton * ResetBtn;

@property (nonatomic,strong) IBOutlet UIButton * applyBtn;

@property (nonatomic,strong) IBOutlet UITableView * MultiTbl;

@property (nonatomic,strong) IBOutlet UIView * commonView;


@property (nonatomic,strong) IBOutlet UIButton * SelectFormatBtn;

@property (nonatomic,strong) IBOutlet UIButton * SelectSeasonBtn;

@property (nonatomic,strong) IBOutlet UIButton * SelectCompetetionBtn;

@property (nonatomic,strong) IBOutlet UIButton * SelectVenueBtn;

@property (nonatomic,strong) IBOutlet UIButton * SelectTeamBtn;


@property (nonatomic,strong) IBOutlet UIImageView * img1;
@property (nonatomic,strong) IBOutlet UIImageView * img2;
@property (nonatomic,strong) IBOutlet UIImageView * img3;
@property (nonatomic,strong) IBOutlet UIImageView * img4;
@property (nonatomic,strong) IBOutlet UIImageView * img5;


@property (nonatomic,strong) IBOutlet UIView * v1;
@property (nonatomic,strong) IBOutlet UIView * v2;
@property (nonatomic,strong) IBOutlet UIView * v3;
@property (nonatomic,strong) IBOutlet UIView * v4;
@property (nonatomic,strong) IBOutlet UIView * v5;



@end
