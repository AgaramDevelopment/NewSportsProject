//
//  MixedControllerVC.m
//  NewSportsProject
//
//  Created by Apple on 19/05/18.
//  Copyright © 2018 agaraminfotech. All rights reserved.
//

#import "MixedControllerVC.h"
#import "ScoreCardVC.h"
#import "CommentaryVC.h"
#import "CustomNavigation.h"
#import "AppCommon.h"
#import "Config.h"


@interface MixedControllerVC ()
{
    ScoreCardVC * objFix ;
    CommentaryVC *objCommentry;
}

@end

@implementation MixedControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    if(IS_IPHONE_DEVICE) {
        
        UIBezierPath *path = [UIBezierPath new];
        
        [path moveToPoint:(CGPoint){self.ScoreCardBtn.frame.size.width+50,0 }];//w0
        [path addLineToPoint:(CGPoint){0, 0}];//00
        [path addLineToPoint:(CGPoint){0,self.ScoreCardBtn.frame.size.height }];//0h
        [path addLineToPoint:(CGPoint){self.ScoreCardBtn.frame.size.width+50, self.ScoreCardBtn.frame.size.height}];//wh20
        
        CAShapeLayer *mask = [CAShapeLayer new];
        mask.frame = self.ScoreCardBtn.bounds;
        mask.path = path.CGPath;
        self.ScoreCardBtn.layer.mask = mask;
        
        
        UIBezierPath *path1 = [UIBezierPath new];
        
        [path1 moveToPoint:(CGPoint){self.CommentaryBtn.frame.size.width+30,0 }];//w0
        [path1 addLineToPoint:(CGPoint){15, 0}];//00
        [path1 addLineToPoint:(CGPoint){0,self.CommentaryBtn.frame.size.height }];//0h
        [path1 addLineToPoint:(CGPoint){self.CommentaryBtn.frame.size.width+30, self.CommentaryBtn.frame.size.height}];//wh20
        
        CAShapeLayer *mask1 = [CAShapeLayer new];
        mask1.frame = self.CommentaryBtn.bounds;
        mask1.path = path1.CGPath;
        self.CommentaryBtn.layer.mask = mask1;
        
    }else
    {
        
        UIBezierPath *path = [UIBezierPath new];
        
        [path moveToPoint:(CGPoint){self.ScoreCardBtn.frame.size.width,0 }];//w0
        [path addLineToPoint:(CGPoint){0, 0}];//00
        [path addLineToPoint:(CGPoint){0,self.ScoreCardBtn.frame.size.height }];//0h
        [path addLineToPoint:(CGPoint){self.ScoreCardBtn.frame.size.width-25, self.ScoreCardBtn.frame.size.height}];//wh20
        
        CAShapeLayer *mask = [CAShapeLayer new];
        mask.frame = self.ScoreCardBtn.bounds;
        mask.path = path.CGPath;
        self.ScoreCardBtn.layer.mask = mask;
        
        
        UIBezierPath *path1 = [UIBezierPath new];
        
        [path1 moveToPoint:(CGPoint){self.CommentaryBtn.frame.size.width,0 }];//w0
        [path1 addLineToPoint:(CGPoint){25, 0}];//00
        [path1 addLineToPoint:(CGPoint){0,self.CommentaryBtn.frame.size.height }];//0h
        [path1 addLineToPoint:(CGPoint){self.CommentaryBtn.frame.size.width, self.CommentaryBtn.frame.size.height}];//wh20
        
        CAShapeLayer *mask1 = [CAShapeLayer new];
        mask1.frame = self.CommentaryBtn.bounds;
        mask1.path = path1.CGPath;
        self.CommentaryBtn.layer.mask = mask1;
    }

    
    
    [self customnavigationmethod];
   
    [self.ScoreCardBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    

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
    
    NSArray* arr = [[NSUserDefaults standardUserDefaults] valueForKey:@"selectedCompetetionArray"];
    //    NSLog(@"arr %@",arr);
    
    objCustomNavigation.tittle_lbl.text = @"LIVE";
    
    if([objCustomNavigation.tittle_lbl.text isEqualToString: @""])
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withoutText"];
    }
    else
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withText"];
    }
    
    
    objCustomNavigation.btn_back.hidden = NO;
    [objCustomNavigation.btn_back addTarget:self action:@selector(BackNavigation) forControlEvents:UIControlEventTouchUpInside];
    objCustomNavigation.filter_btn.hidden = YES;
    objCustomNavigation.Cancelbtn.hidden = YES;
    objCustomNavigation.summarybtn.hidden=YES;
    
}

-(void)BackNavigation{
    
    //    GemViewController1* VC = (GemViewController1 *)[appDel.storyBoard instantiateViewControllerWithIdentifier:@"YawRotationViewController"];
    //    appDel.window.rootViewController = VC;
    [appDel.navigationController popViewControllerAnimated:YES];
    
}

-(IBAction)didClickScoreCard:(id)sender
{
    [self setInningsBySelection:@"1"];
    
    objFix = (ScoreCardVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"ScoreCardVC"];
     objFix.LiveorOFFType = self.livetype;
    objFix.matchCode = self.matchCode;
    objFix.view.frame = CGRectMake(0,0, self.mainView.bounds.size.width, self.mainView.bounds.size.height);
    objFix.navi_View.hidden = YES;
    objFix.navigationHeight.constant = 0;
    // objFix.matchDetails = scoreArray;
    
    [self.mainView addSubview:objFix.view];

    
}


-(IBAction)didClickCommentary:(id)sender
{
    [self setInningsBySelection:@"2"];
    objCommentry = (CommentaryVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"CommentaryVC"];
    objCommentry.livetype = self.livetype;
    objCommentry.matchCode = self.matchCode;
    objCommentry.view.frame = CGRectMake(0,0, self.mainView.bounds.size.width, self.mainView.bounds.size.height);
    objCommentry.navigationView.hidden = YES;
    objCommentry.naviHeight.constant = 0;
    // objFix.matchCode = self.matchCode;
    // objFix.matchDetails = scoreArray;
    // objFix.backkey = @"yes";
    [self.mainView addSubview:objCommentry.view];
}


-(void) setInningsBySelection: (NSString*) innsNo{
    
    [self setInningsButtonUnselect:self.ScoreCardBtn];
    [self setInningsButtonUnselect:self.CommentaryBtn];
    
    if([innsNo isEqualToString:@"1"]){
        
        [self setInningsButtonSelect:self.ScoreCardBtn];
        
    }else if([innsNo isEqualToString:@"2"]){
        
        [self setInningsButtonSelect:self.CommentaryBtn];
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


@end
