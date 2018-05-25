//
//  MixedControllerVC.h
//  NewSportsProject
//
//  Created by Apple on 19/05/18.
//  Copyright © 2018 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
@import EHHorizontalSelectionView;

@interface MixedControllerVC : UIViewController

@property (nonatomic,strong) IBOutlet UIButton * ScoreCardBtn;
@property (nonatomic,strong) IBOutlet UIButton * CommentaryBtn;

@property (nonatomic,strong) IBOutlet UIView * mainView;
@property (weak, nonatomic)  NSString *matchCode;
@property (weak, nonatomic)  NSString *livetype;
@property (weak, nonatomic)  NSMutableArray *scoreArray;


@property (nonatomic, weak) IBOutlet EHHorizontalSelectionView * hSelView1;

@end
