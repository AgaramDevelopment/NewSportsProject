//
//  FixtureView.h
//  NewSportsProject
//
//  Created by Mac on 15/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FixtureView : UIViewController

@property (nonatomic,strong) IBOutlet UIButton * btn;

@property (nonatomic,strong) IBOutlet UIImageView * team1img;
@property (nonatomic,strong) IBOutlet UIImageView * team2img;
@property (nonatomic,strong) IBOutlet UIImageView * team1logo;
@property (nonatomic,strong) IBOutlet UIImageView * team2logo;


@property (nonatomic,strong) IBOutlet UILabel * team1;
@property (nonatomic,strong) IBOutlet UILabel * team2;
@property (nonatomic,strong) IBOutlet UILabel * datelbl;
@property (nonatomic,strong) IBOutlet UILabel * timelbl;
@property (nonatomic,strong) IBOutlet UILabel * groundname;





@end
