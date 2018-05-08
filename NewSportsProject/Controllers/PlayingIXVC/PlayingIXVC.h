//
//  PlayingIXVC.h
//  NewSportsProject
//
//  Created by Mac on 02/12/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingXICell.h"

@interface PlayingIXVC : UIViewController

@property (nonatomic,strong) IBOutlet UIButton * Team1;
@property (nonatomic,strong) IBOutlet UIButton * Team2;


@property (nonatomic,strong) IBOutlet UITableView * listTbl;

@property (nonatomic,strong) IBOutlet PlayingXICell * objCell;



@end
