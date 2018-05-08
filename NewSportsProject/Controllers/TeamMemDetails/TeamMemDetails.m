//
//  TeamMemDetails.m
//  NewSportsProject
//
//  Created by Mac on 24/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "TeamMemDetails.h"
#import "CustomNavigation.h"
#import "Config.h"
#import "OverviewPlayer.h"
#import "StatsPlayer.h"
#import "PlayerStatsListView.h"

@interface TeamMemDetails ()
{
    OverviewPlayer *OverFix;
    StatsPlayer *StatsFix;
    PlayerStatsListView *lstView;
    
}

@end

@implementation TeamMemDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customnavigationmethod];
    self.listGridView.hidden = YES;
    self.v1.backgroundColor = [UIColor colorWithRed:(24/255.0f) green:(40/255.0f) blue:(126/255.0f) alpha:1.0f];
    
//                    OverFix = [[OverviewPlayer alloc] initWithNibName:@"OverviewPlayer" bundle:nil];
//                    OverFix.view.frame = CGRectMake(0, 320, self.view.bounds.size.width, self.view.bounds.size.height);
//                    [self.view addSubview:OverFix.view];
    
    
    if(IS_IPHONE_DEVICE) {
        
        UIBezierPath *path = [UIBezierPath new];
        
        [path moveToPoint:(CGPoint){self.OverBtn.frame.size.width+50,0 }];//w0
        [path addLineToPoint:(CGPoint){0, 0}];//00
        [path addLineToPoint:(CGPoint){0,self.OverBtn.frame.size.height }];//0h
        [path addLineToPoint:(CGPoint){self.OverBtn.frame.size.width+50, self.OverBtn.frame.size.height}];//wh20
        
        CAShapeLayer *mask = [CAShapeLayer new];
        mask.frame = self.OverBtn.bounds;
        mask.path = path.CGPath;
        self.OverBtn.layer.mask = mask;
        
        
        UIBezierPath *path1 = [UIBezierPath new];
        
        [path1 moveToPoint:(CGPoint){self.StatsBtn.frame.size.width+30,0 }];//w0
        [path1 addLineToPoint:(CGPoint){15, 0}];//00
        [path1 addLineToPoint:(CGPoint){0,self.StatsBtn.frame.size.height }];//0h
        [path1 addLineToPoint:(CGPoint){self.StatsBtn.frame.size.width+30, self.StatsBtn.frame.size.height}];//wh20
        
        CAShapeLayer *mask1 = [CAShapeLayer new];
        mask1.frame = self.StatsBtn.bounds;
        mask1.path = path1.CGPath;
        self.StatsBtn.layer.mask = mask1;
        
    }else
    {
    
    UIBezierPath *path = [UIBezierPath new];
    
    [path moveToPoint:(CGPoint){self.OverBtn.frame.size.width,0 }];//w0
    [path addLineToPoint:(CGPoint){0, 0}];//00
    [path addLineToPoint:(CGPoint){0,self.OverBtn.frame.size.height }];//0h
    [path addLineToPoint:(CGPoint){self.OverBtn.frame.size.width-25, self.OverBtn.frame.size.height}];//wh20
    
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = self.OverBtn.bounds;
    mask.path = path.CGPath;
    self.OverBtn.layer.mask = mask;
    
    
    UIBezierPath *path1 = [UIBezierPath new];
    
    [path1 moveToPoint:(CGPoint){self.StatsBtn.frame.size.width,0 }];//w0
    [path1 addLineToPoint:(CGPoint){25, 0}];//00
    [path1 addLineToPoint:(CGPoint){0,self.StatsBtn.frame.size.height }];//0h
    [path1 addLineToPoint:(CGPoint){self.StatsBtn.frame.size.width, self.StatsBtn.frame.size.height}];//wh20
    
    CAShapeLayer *mask1 = [CAShapeLayer new];
    mask1.frame = self.StatsBtn.bounds;
    mask1.path = path1.CGPath;
    self.StatsBtn.layer.mask = mask1;
    }
    
    UIImage *btnImage1 = [UIImage imageNamed:@"GridimgGray"];
    [self.GridBtn setImage:btnImage1 forState:UIControlStateNormal];
    
    UIImage *btnImage2 = [UIImage imageNamed:@"ListimgGray"];
    [self.ListBtn setImage:btnImage2 forState:UIControlStateNormal];
    
    
    [self.OverBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    //[self.GridBtn sendActionsForControlEvents:UIControlEventTouchUpInside];

    
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
    objCustomNavigation.nav_header_img.backgroundColor = [UIColor colorWithRed:(24/255.0f) green:(40/255.0f) blue:(126/255.0f) alpha:1.0f];
    objCustomNavigation.summarybtn.hidden=YES;
    objCustomNavigation.btn_back.hidden = NO;
    objCustomNavigation.filter_btn.hidden = YES;
    objCustomNavigation.Cancelbtn.hidden = YES;
    [objCustomNavigation.btn_back addTarget:self action:@selector(didClickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(IBAction)didClickOverBtn:(id)sender
{
    [self setClearView];
    [self setInningsBySelection:@"1"];
    self.listGridView.hidden = YES;
    
    
    if(IS_IPHONE_DEVICE)
    {
        OverFix = [[OverviewPlayer alloc] initWithNibName:@"OverviewPlayer_iPhone" bundle:nil];
        OverFix.view.frame = CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view addSubview:OverFix.view];
    }
    else
    {
        
    OverFix = [[OverviewPlayer alloc] initWithNibName:@"OverviewPlayer_iPad" bundle:nil];
    OverFix.view.frame = CGRectMake(0, 320, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:OverFix.view];
    }
    
}

-(IBAction)didClickStatsBtn:(id)sender
{

    [self setClearView];
    [self setInningsBySelection:@"2"];
    self.listGridView.hidden = NO;
    
    [self.GridBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    if(IS_IPHONE_DEVICE)
    {

        StatsFix = [[StatsPlayer alloc] initWithNibName:@"StatsPlayer_iPhone" bundle:nil];
        StatsFix.view.frame = CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view addSubview:StatsFix.view];
    }
    else
    {
    
        StatsFix = [[StatsPlayer alloc] initWithNibName:@"StatsPlayer_iPad" bundle:nil];
        StatsFix.view.frame = CGRectMake(0, 350, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view addSubview:StatsFix.view];
    }
}

-(IBAction)didClickGrid:(id)sender
{
    
    [self setClearView];
    [self setInningsBySelection:@"2"];
    self.listGridView.hidden = NO;
    
    if(IS_IPHONE_DEVICE)
    {
        
        StatsFix = [[StatsPlayer alloc] initWithNibName:@"StatsPlayer_iPhone" bundle:nil];
        StatsFix.view.frame = CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view addSubview:StatsFix.view];
    }
    else
    {
        
        
        StatsFix = [[StatsPlayer alloc] initWithNibName:@"StatsPlayer_iPad" bundle:nil];
        StatsFix.view.frame = CGRectMake(0, 350, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view addSubview:StatsFix.view];
    }

    
    UIImage *btnImage = [UIImage imageNamed:@"GridimgBlue"];
    [self.GridBtn setImage:btnImage forState:UIControlStateNormal];
    
    UIImage *btnImage1 = [UIImage imageNamed:@"ListimgGray"];
    [self.ListBtn setImage:btnImage1 forState:UIControlStateNormal];
}

-(IBAction)didClickList:(id)sender
{
    
    [self setClearView];
    [self setInningsBySelection:@"2"];
    self.listGridView.hidden = NO;
    
    
    if(IS_IPHONE_DEVICE)
    {
        
        lstView = [[PlayerStatsListView alloc] initWithNibName:@"PlayerStatsListView_iPhone" bundle:nil];
        lstView.view.frame = CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view addSubview:lstView.view];
    }
    else
    {
        
        lstView = [[PlayerStatsListView alloc] initWithNibName:@"PlayerStatsListView_iPad" bundle:nil];
        lstView.view.frame = CGRectMake(0, 350, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view addSubview:lstView.view];
    }

    
    UIImage *btnImage = [UIImage imageNamed:@"ListimgBlue"];
    [self.ListBtn setImage:btnImage forState:UIControlStateNormal];
    
    UIImage *btnImage1 = [UIImage imageNamed:@"GridimgGray"];
    [self.GridBtn setImage:btnImage1 forState:UIControlStateNormal];
    
}

-(void)setClearView
{
    
    if(OverFix != nil)
    {
        
        [OverFix.view removeFromSuperview];
    }
    
    if(StatsFix != nil)
    {
        
        [StatsFix.view removeFromSuperview];
    }
    if(lstView != nil)
    {
        
        [lstView.view removeFromSuperview];
    }
}

-(void) setInningsBySelection: (NSString*) innsNo{
    
    [self setInningsButtonUnselect:self.OverBtn];
    [self setInningsButtonUnselect:self.StatsBtn];
    
    if([innsNo isEqualToString:@"1"]){
        
        [self setInningsButtonSelect:self.OverBtn];
        
    }else if([innsNo isEqualToString:@"2"]){
        
        [self setInningsButtonSelect:self.StatsBtn];
    }
    
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    //-----------------------------------------
    // Convert hex string to an integer
    //-----------------------------------------
    unsigned int hexint = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet
                                       characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexint];
    
    //-----------------------------------------
    // Create color object, specifying alpha
    //-----------------------------------------
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:1.0f];
    
    return color;
}

-(void) setInningsButtonSelect : (UIButton*) innsBtn{
    // innsBtn.layer.cornerRadius = 25;
    UIColor *extrasBrushBG = [self colorWithHexString : @"#2CA7DB"];
    
    innsBtn.layer.backgroundColor = extrasBrushBG.CGColor;
    
}

-(void) setInningsButtonUnselect : (UIButton*) innsBtn{
    //  innsBtn.layer.cornerRadius = 25;
    UIColor *extrasBrushBG = [self colorWithHexString : @"#2C2C2C"];
    
    innsBtn.layer.backgroundColor = extrasBrushBG.CGColor;
    
}


-(IBAction)didClickBackBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
