//
//  PlayingIXVC.m
//  NewSportsProject
//
//  Created by Mac on 02/12/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "PlayingIXVC.h"
#import "Config.h"
#import "ScoreCardCell.h"
#import "CustomNavigation.h"
#import "TeamMemDetails.h"

@interface PlayingIXVC ()
{
    NSArray *titleArray;
    NSArray *valuesArray;
    
    NSInteger selectedIndex;
    NSIndexPath *lastIndex;
}

@end

@implementation PlayingIXVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    titleArray = [NSArray arrayWithObjects:@"National Team",@"Age",@"Date of Birth",@"Weight",@"height",@"Role",@"Batting Style",@"Bowling Style", nil];
    valuesArray = [NSArray arrayWithObjects:@"India",@"28",@"5 Nvember 1988",@"69kg",@"1.75 m",@"Batsman",@"Right Handed Bat",@"Right-arm Medium", nil];
    
    
    selectedIndex = -1;
    [self customnavigationmethod];
    
    if(IS_IPHONE_DEVICE) {
        
        UIBezierPath *path = [UIBezierPath new];
        
        [path moveToPoint:(CGPoint){self.Team1.frame.size.width+50,0 }];//w0
        [path addLineToPoint:(CGPoint){0, 0}];//00
        [path addLineToPoint:(CGPoint){0,self.Team1.frame.size.height }];//0h
        [path addLineToPoint:(CGPoint){self.Team1.frame.size.width+50, self.Team1.frame.size.height}];//wh20
        
        CAShapeLayer *mask = [CAShapeLayer new];
        mask.frame = self.Team1.bounds;
        mask.path = path.CGPath;
        self.Team1.layer.mask = mask;
        
        
        UIBezierPath *path1 = [UIBezierPath new];
        
        [path1 moveToPoint:(CGPoint){self.Team2.frame.size.width+30,0 }];//w0
        [path1 addLineToPoint:(CGPoint){15, 0}];//00
        [path1 addLineToPoint:(CGPoint){0,self.Team2.frame.size.height }];//0h
        [path1 addLineToPoint:(CGPoint){self.Team2.frame.size.width+30, self.Team2.frame.size.height}];//wh20
        
        CAShapeLayer *mask1 = [CAShapeLayer new];
        mask1.frame = self.Team2.bounds;
        mask1.path = path1.CGPath;
        self.Team2.layer.mask = mask1;
        
    }else
    {
        UIBezierPath *path = [UIBezierPath new];
        
        [path moveToPoint:(CGPoint){self.Team1.frame.size.width,0 }];//w0
        [path addLineToPoint:(CGPoint){0, 0}];//00
        [path addLineToPoint:(CGPoint){0,self.Team1.frame.size.height }];//0h
        [path addLineToPoint:(CGPoint){self.Team1.frame.size.width-25, self.Team1.frame.size.height}];//wh20
        
        CAShapeLayer *mask = [CAShapeLayer new];
        mask.frame = self.Team1.bounds;
        mask.path = path.CGPath;
        self.Team1.layer.mask = mask;
        
        
        UIBezierPath *path1 = [UIBezierPath new];
        
        [path1 moveToPoint:(CGPoint){self.Team2.frame.size.width,0 }];//w0
        [path1 addLineToPoint:(CGPoint){25, 0}];//00
        [path1 addLineToPoint:(CGPoint){0,self.Team2.frame.size.height }];//0h
        [path1 addLineToPoint:(CGPoint){self.Team2.frame.size.width, self.Team2.frame.size.height}];//wh20
        
        CAShapeLayer *mask1 = [CAShapeLayer new];
        mask1.frame = self.Team2.bounds;
        mask1.path = path1.CGPath;
        self.Team2.layer.mask = mask1;
    }
    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    static NSString *MyIdentifier = @"MyIdentifier";
    
    
    
    PlayingXICell *cell = [self.listTbl dequeueReusableCellWithIdentifier:nil];
    if(IS_IPHONE_DEVICE)
    {
        [[NSBundle mainBundle] loadNibNamed:@"PlayingXICell_iPhone" owner:self options:nil];
    }
    else
    {
        [[NSBundle mainBundle] loadNibNamed:@"PlayingXICell_iPad" owner:self options:nil];
        
    }
    
    cell = self.objCell;

    if(indexPath.row == 0)
    {
        cell.playerName.text = @"Virat Kohli";
        cell.playertype.text = @"Batsman";
        cell.WagonImg.image = [UIImage imageNamed:@"virat"];
    }
    
    if(indexPath.row == 1)
    {
        cell.playerName.text = @"MS Dhoni";
        cell.playertype.text = @"Batsman & Wk";
        cell.WagonImg.image = [UIImage imageNamed:@"testimgplayer"];
    }

    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamMemDetails * objFix = [[TeamMemDetails alloc]init];
    objFix = (TeamMemDetails *)[self.storyboard instantiateViewControllerWithIdentifier:@"TeamMemDetails"];
    [self.navigationController pushViewController:objFix animated:YES];
}


-(IBAction)Team1Action:(id)sender
{
    [self setInningsBySelection:@"1"];
}

-(IBAction)Team2Action:(id)sender
{
    [self setInningsBySelection:@"2"];
}

-(void) setInningsBySelection: (NSString*) innsNo{
    
    [self setInningsButtonUnselect:self.Team1];
    [self setInningsButtonUnselect:self.Team2];
    
    if([innsNo isEqualToString:@"1"]){
        
        [self setInningsButtonSelect:self.Team1];
        
    }else if([innsNo isEqualToString:@"2"]){
        
        [self setInningsButtonSelect:self.Team2];
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
