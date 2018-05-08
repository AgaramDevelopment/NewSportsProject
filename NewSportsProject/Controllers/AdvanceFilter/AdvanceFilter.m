//
//  AdvanceFilter.m
//  NewSportsProject
//
//  Created by Mac on 17/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "AdvanceFilter.h"
#import "AppCommon.h"
#import "CustomNavigation.h"
#import "Config.h"
#import "CRTableViewCell.h"
#import "FilterNavigation.h"
#import "Fixtures.h"

@interface AdvanceFilter ()
{
    BOOL isFormat;
    BOOL isSeason;
    BOOL iscompetetion;
    BOOL isvenue;
    BOOL isTeam;
}

@property (nonatomic,strong)  NSArray * FormatArray;

@property (strong, nonatomic)  NSMutableArray *selectedMarks;

@property (strong, nonatomic)IBOutlet  NSLayoutConstraint *ViewXposition;

@property (strong, nonatomic)IBOutlet  NSLayoutConstraint *ViewYposition;

@end

@implementation AdvanceFilter

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customnavigationmethod];
    
    self.img1.image = [UIImage imageNamed:@"Down Arrow"];
    self.img2.image = [UIImage imageNamed:@"Down Arrow"];
    self.img3.image = [UIImage imageNamed:@"Down Arrow"];
    self.img4.image = [UIImage imageNamed:@"Down Arrow"];
    self.img5.image = [UIImage imageNamed:@"Down Arrow"];
    
    self.FormatArray = [[NSArray alloc]init];
    self.FormatArray = @[@"T20",@"ODI",@"Test Cricket"];
    
    self.selectedMarks = [[NSMutableArray alloc]init];
    
    UIBezierPath *path = [UIBezierPath new];
    
    [path moveToPoint:(CGPoint){self.ResetBtn.frame.size.width,0 }];//w0
    [path addLineToPoint:(CGPoint){0, 0}];//00
    [path addLineToPoint:(CGPoint){0,self.ResetBtn.frame.size.height }];//0h
    [path addLineToPoint:(CGPoint){self.ResetBtn.frame.size.width-25, self.ResetBtn.frame.size.height}];//wh20
    
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = self.ResetBtn.bounds;
    mask.path = path.CGPath;
    self.ResetBtn.layer.mask = mask;
    
    
    UIBezierPath *path1 = [UIBezierPath new];
    
    [path1 moveToPoint:(CGPoint){self.applyBtn.frame.size.width,0 }];//w0
    [path1 addLineToPoint:(CGPoint){25, 0}];//00
    [path1 addLineToPoint:(CGPoint){0,self.applyBtn.frame.size.height }];//0h
    [path1 addLineToPoint:(CGPoint){self.applyBtn.frame.size.width, self.applyBtn.frame.size.height}];//wh20
    
    CAShapeLayer *mask1 = [CAShapeLayer new];
    mask1.frame = self.applyBtn.bounds;
    mask1.path = path1.CGPath;
    self.applyBtn.layer.mask = mask1;
    
    self.commonView.hidden = YES;
    
    
    
}

-(IBAction)didClickFormat:(id)sender
{
    
    if(isFormat == NO)
    {
        [self.applyBtn setUserInteractionEnabled:NO];
    self.img1.image = [UIImage imageNamed:@"Down Arrow"];
    isFormat = YES;
    isSeason = NO;
    iscompetetion =NO;
    isvenue = NO;
    isTeam =NO;
    self.ViewXposition.constant = self.v1.frame.origin.x;
    self.ViewYposition.constant = self.v1.frame.origin.y-30;
    self.commonView.hidden= NO;
    [self.MultiTbl reloadData];
    }
    else
    {
        [self.applyBtn setUserInteractionEnabled:YES];
        self.img1.image = [UIImage imageNamed:@"Down Arrow"];
        isFormat=NO;
        self.commonView.hidden= YES;
        
    }
}

-(IBAction)didClickSeason:(id)sender
{
    if(isSeason == NO)
    {
    self.img2.image = [UIImage imageNamed:@"Down Arrow"];
    isFormat = NO;
    isSeason = YES;
    iscompetetion =NO;
    isvenue = NO;
    isTeam =NO;
    self.ViewXposition.constant = self.v2.frame.origin.x;
    self.ViewYposition.constant = self.v2.frame.origin.y-30;
    self.commonView.hidden= NO;
    [self.MultiTbl reloadData];
    }
    else
    {
        self.img2.image = [UIImage imageNamed:@"Down Arrow"];
        isSeason=NO;
        self.commonView.hidden= YES;
    }
}

-(IBAction)didClickCompetetion:(id)sender
{
    if(iscompetetion == NO)
    {
    self.img3.image = [UIImage imageNamed:@"Down Arrow"];
    isFormat = NO;
    isSeason = NO;
    iscompetetion =YES;
    isvenue = NO;
    isTeam =NO;
        self.ViewXposition.constant = self.v3.frame.origin.x;
        self.ViewYposition.constant = self.v3.frame.origin.y-30;
    self.commonView.hidden= NO;
    [self.MultiTbl reloadData];
    }
    else
    {
        self.img3.image = [UIImage imageNamed:@"Down Arrow"];
        iscompetetion=NO;
        self.commonView.hidden= YES;
    }
}


-(IBAction)didClickvenue:(id)sender
{
    if(isvenue == NO)
    {
    self.img4.image = [UIImage imageNamed:@"Down Arrow"];
    isFormat = NO;
    isSeason = NO;
    iscompetetion =NO;
    isvenue = YES;
    isTeam =NO;
        self.ViewXposition.constant = self.v4.frame.origin.x;
        self.ViewYposition.constant = self.v4.frame.origin.y-30;
    self.commonView.hidden= NO;
    [self.MultiTbl reloadData];
    }
    else
    {
        self.img4.image = [UIImage imageNamed:@"Down Arrow"];
        isvenue=NO;
        self.commonView.hidden= YES;
    }
}


-(IBAction)didClickTeam:(id)sender
{
    if(isTeam == NO)
    {
    self.img5.image = [UIImage imageNamed:@"Down Arrow"];
    isFormat = NO;
    isSeason = NO;
    iscompetetion =NO;
    isvenue = NO;
    isTeam =YES;
        self.ViewXposition.constant = self.v5.frame.origin.x;
        self.ViewYposition.constant = self.v5.frame.origin.y-30;
    self.commonView.hidden= NO;
    [self.MultiTbl reloadData];
    }
    else
    {
        self.img5.image = [UIImage imageNamed:@"Down Arrow"];
        isTeam=NO;
        self.commonView.hidden= YES;
    }
}



-(IBAction)Cancel:(id)sender
{
    self.commonView.hidden= YES;
//    self.img1.image = [UIImage imageNamed:@"righArrow"];
//    self.img2.image = [UIImage imageNamed:@"righArrow"];
//    self.img3.image = [UIImage imageNamed:@"righArrow"];
//    self.img4.image = [UIImage imageNamed:@"righArrow"];
//    self.img5.image = [UIImage imageNamed:@"righArrow"];
    [self.applyBtn setUserInteractionEnabled:YES];
}
-(IBAction)Submit:(id)sender
{
    self.commonView.hidden= YES;
//    self.img1.image = [UIImage imageNamed:@"righArrow"];
//    self.img2.image = [UIImage imageNamed:@"righArrow"];
//    self.img3.image = [UIImage imageNamed:@"righArrow"];
//    self.img4.image = [UIImage imageNamed:@"righArrow"];
//    self.img5.image = [UIImage imageNamed:@"righArrow"];
    [self.applyBtn setUserInteractionEnabled:YES];
}


-(IBAction)didClickApply:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//-(void)customnavigationmethod
//{
//    FilterNavigation * objCustomNavigation;
//    
//    if(IS_IPHONE_DEVICE)
//    {
//        objCustomNavigation=[[FilterNavigation alloc] initWithNibName:@"FilterNavigation_iPhone" bundle:nil];
//    }
//    else
//    {
//        objCustomNavigation=[[FilterNavigation alloc] initWithNibName:@"FilterNavigation_iPad" bundle:nil];
//    }
//    [self.view addSubview:objCustomNavigation.view];
//   // objCustomNavigation.tittle_lbl.text=@"FIXTURES";
//   // objCustomNavigation.btn_back.hidden = YES;
//
//    //objCustomNavigation.Cancelbtn.hidden = NO;
//    //objCustomNavigation.filter_btn.imageView.image =[UIImage imageNamed:@"Cancelbtn"];
//    
//    //objCustomNavigation.filter_btn.hidden = NO;
//    
//    //[objCustomNavigation.btn_back addTarget:self action:@selector(didClickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
//    //[objCustomNavigation.filter_btn addTarget:self action:@selector(didClickFilterBtn:) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    
//    
//    
//}

-(void)customnavigationmethod
{
    FilterNavigation * objCustomNavigation;
    
    if(IS_IPHONE_DEVICE)
    {
        objCustomNavigation=[[FilterNavigation alloc] initWithNibName:@"FilterNavigation_iPhone" bundle:nil];
    }
    else
    {
        objCustomNavigation=[[FilterNavigation alloc] initWithNibName:@"FilterNavigation_iPad" bundle:nil];
    }
    [self.view addSubview:objCustomNavigation.view];
    objCustomNavigation.tittle_lbl.text=@"FILTER";
    //objCustomNavigation.summarybtn.hidden=YES;
        objCustomNavigation.btn_back.hidden = YES;
    //objCustomNavigation.filter_btn.hidden = NO;
    objCustomNavigation.Cancelbtn.hidden = NO;
    [objCustomNavigation.Cancelbtn addTarget:self action:@selector(didClickCANCELBtn:) forControlEvents:UIControlEventTouchUpInside];
    //[objCustomNavigation.filter_btn addTarget:self action:@selector(didClickFilterBtn:) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)didClickCANCELBtn:(id)sender
{
//    Fixtures * objFix = [[Fixtures alloc]init];
//    objFix = (Fixtures *)[self.storyboard instantiateViewControllerWithIdentifier:@"Fixtures"];
//    [self.navigationController pushViewController:objFix animated:YES];
    
     [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isFormat)
    {
    return self.FormatArray.count;
    }
    else if(isSeason)
    {
        return 0;
    }
    else if(iscompetetion)
    {
        return 0;
    }
    else if(isvenue)
    {
        return 0;
    }
    else if(isTeam)
    {
        return 0;
    }
    
    return nil;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(isFormat==YES)
    {
        static NSString *CRTableViewCellIdentifier = @"cellIdentifier";
        
        
        CRTableViewCell *cell = (CRTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CRTableViewCellIdentifier];
        
        if (cell == nil) {
            cell = [[CRTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CRTableViewCellIdentifier];
        }
        
        
        //teamcode = [self.teamlist[indexPath.row] valueForKey:@"TeamCode"];
        
        NSString *text = self.FormatArray[indexPath.row];
        cell.isSelected = [self.selectedMarks containsObject:text] ? YES : NO;
        cell.textLabel.text = text;
        cell.textLabel.font=[UIFont fontWithName:@"Montserrat" size:15.0];
        return cell;
        
    }
   
    return nil;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    teamcode = [[self.teamlist objectAtIndex:indexPath.row] valueForKey:@"TeamCode"];
    
    NSString *text = self.FormatArray[indexPath.row];
    if ([self.selectedMarks containsObject:text])// Is selected?
        [self.selectedMarks removeObject:text];
    else
        [self.selectedMarks addObject:text];
    
    static NSString *CRTableViewCellIdentifier = @"cellIdentifier";
    
    CRTableViewCell *cell = (CRTableViewCell *)[self.MultiTbl dequeueReusableCellWithIdentifier:CRTableViewCellIdentifier];
    cell.isSelected = [self.selectedMarks containsObject:text] ? YES : NO;
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
//    int a = self.selectedMarks.count;
//    if(a == 0)
//    {
//        //NSString *b = [NSString stringWithFormat:@"%d", a];
//        self.teamlbl.text = @"";
//    }
//    else if(a == 1)
//    {
//        //NSString *b = [NSString stringWithFormat:@"%d", a];
//        self.teamlbl.text = [NSString stringWithFormat:@"%d item selected", a];
//    }
//    else
//    {
//        self.teamlbl.text = [NSString stringWithFormat:@"%d items selected", a];
//    }

    
}



@end
