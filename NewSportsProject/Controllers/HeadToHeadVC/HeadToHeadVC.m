//
//  HeadToHeadVC.m
//  NewSportsProject
//
//  Created by Mac on 04/12/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "HeadToHeadVC.h"
#import "CustomNavigation.h"
#import "Config.h"

@interface HeadToHeadVC ()

@end

@implementation HeadToHeadVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self customnavigationmethod];
    
    UIBezierPath *path = [UIBezierPath new];
    
    [path moveToPoint:(CGPoint){self.titlelbl.frame.size.width-15,0 }];//w0
    [path addLineToPoint:(CGPoint){0, 0}];//00
    [path addLineToPoint:(CGPoint){15,self.titlelbl.frame.size.height }];//0h
    [path addLineToPoint:(CGPoint){self.titlelbl.frame.size.width, self.titlelbl.frame.size.height}];//wh20
    
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = self.titlelbl.bounds;
    mask.path = path.CGPath;
    self.titlelbl.layer.mask = mask;
    
    
    self.team1WinPer.progress = 1-0.7;
    int num = 0.7*100;
    self.perValueTeam1.text = [NSString stringWithFormat:@"%d%%",num];
    
    //self.team1WinPer.layer.borderWidth = 1.0f;
    //self.team1WinPer.layer.borderColor = [UIColor blueColor].CGColor;
    
    self.team2WinPer.progress = 0.3;
    int num2 = self.team2WinPer.progress *100;
    self.perValueTeam2.text = [NSString stringWithFormat:@"%d%%",num2];
    
    
    self.team1Home.progress = 1-0.4;
    int num3 = 0.4 *100;
    self.perValueTeam3.text = [NSString stringWithFormat:@"%d%%",num3];
    self.team2Home.progress = 0.6;
    int num4 = self.team2Home.progress *100;
    self.perValueTeam4.text = [NSString stringWithFormat:@"%d%%",num4];

    
    self.team1Opp.progress = 1-0.4;
    int num5 = 0.4 *100;
    self.perValueTeam5.text = [NSString stringWithFormat:@"%d%%",num5];
    
    self.team2Opp.progress = 0.6;
    int num6 = self.team2Opp.progress *100;
    self.perValueTeam6.text = [NSString stringWithFormat:@"%d%%",num6];

    
    
    
    
}


-(void)customnavigationmethod
{
    CustomNavigation * objCustomNavigation;
    if(IS_IPHONE_DEVICE)
    {
        objCustomNavigation=[[CustomNavigation alloc] initWithNibName:@"CustomNavigation_iPhone" bundle:nil];
    }
    else
    {
        objCustomNavigation=[[CustomNavigation alloc] initWithNibName:@"CustomNavigation_iPad" bundle:nil];
    }
    
    
    [self.view addSubview:objCustomNavigation.view];
    
    objCustomNavigation.tittle_lbl.text=@"";
    if([objCustomNavigation.tittle_lbl.text isEqualToString: @""])
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withoutText"];
    }
    else
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withText"];
    }
    
    objCustomNavigation.summarybtn.hidden=YES;
    
    objCustomNavigation.btn_back.hidden = YES;
    objCustomNavigation.filter_btn.hidden = YES;
    objCustomNavigation.Cancelbtn.hidden = YES;
    
}

@end
