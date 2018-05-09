//
//  CommentaryVC.m
//  NewSportsProject
//
//  Created by Mac on 05/12/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "CommentaryVC.h"
#import "CustomNavigation.h"
#import "Config.h"
#import "WebService.h"
#import "AppCommon.h"


@interface CommentaryVC ()

@property (nonatomic,strong)  NSMutableArray * BallType1;

@property (nonatomic,strong)  NSMutableArray * BallType2;

@property (nonatomic,strong)  NSMutableArray * commonArray;
@end

@implementation CommentaryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customnavigationmethod];
    
    self.img1.layer.masksToBounds = true;
    self.img1.clipsToBounds = true;
    self.img1.layer.cornerRadius = self.img1.frame.size.width/2;
    self.img2.layer.masksToBounds = true;
    self.img2.clipsToBounds = true;
    self.img2.layer.cornerRadius = self.img1.frame.size.width/2;
    
    
    self.img3.layer.masksToBounds = true;
    self.img3.clipsToBounds = true;
    self.img3.layer.cornerRadius = self.img3.frame.size.width/2;
    self.img4.layer.masksToBounds = true;
    self.img4.clipsToBounds = true;
    self.img4.layer.cornerRadius = self.img4.frame.size.width/2;
    
    
    UIBezierPath *path = [UIBezierPath new];
    
    [path moveToPoint:(CGPoint){self.Plbl.frame.size.width-15,0 }];//w0
    [path addLineToPoint:(CGPoint){0, 0}];//00
    [path addLineToPoint:(CGPoint){15,self.Plbl.frame.size.height }];//0h
    [path addLineToPoint:(CGPoint){self.Plbl.frame.size.width, self.Plbl.frame.size.height}];//wh20
    
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = self.Plbl.bounds;
    mask.path = path.CGPath;
    self.Plbl.layer.mask = mask;
    
    
    
    
    self.BallType1  = [NSMutableArray arrayWithObjects:@"W",@"0",@"0",@"4",@"6",@"1", nil];
    
    self.BallType2  = [NSMutableArray arrayWithObjects:@"6",@"1",@"0",@"1",@"W",@"4", nil];
    
    self.commonArray = self.BallType1;
    self.previous.hidden = YES;
    
    
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    LiveSummaryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    return cell;
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commonArray.count ;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    static NSString *MyIdentifier = @"MyIdentifier";
    
    
    CommentaryVCCell *cell = [self.commentTbl dequeueReusableCellWithIdentifier:MyIdentifier];
    if(IS_IPHONE_DEVICE)
    {
        [[NSBundle mainBundle] loadNibNamed:@"CommentaryVCCell_iPhone" owner:self options:nil];
    }
    else
    {
        [[NSBundle mainBundle] loadNibNamed:@"CommentaryVCCell_iPad" owner:self options:nil];
        
    }
    
    
    
    cell = self.objlistCell;
    
    cell.Ball.text = self.commonArray[indexPath.row];
    
    if([cell.Ball.text isEqualToString:@"4"] || [cell.Ball.text isEqualToString:@"6"] )
    {
        cell.Ball.backgroundColor = [UIColor colorWithRed:(44/255.0f) green:(167/255.0f) blue:(219/255.0f) alpha:1.0f];
    }
    else if([cell.Ball.text isEqualToString:@"0"] || [cell.Ball.text isEqualToString:@"1"] )
    {
        cell.Ball.backgroundColor = [UIColor colorWithRed:(93/255.0f) green:(93/255.0f) blue:(93/255.0f) alpha:1.0f];
    }

    if([cell.Ball.text isEqualToString:@"W"])
    {
        cell.backgroundColor = [UIColor colorWithRed:(214/255.0f) green:(31/255.0f) blue:(38/255.0f) alpha:1.0f];
        cell.Ball.textColor = [UIColor colorWithRed:(214/255.0f) green:(31/255.0f) blue:(38/255.0f) alpha:1.0f];
        cell.overs.textColor = [UIColor whiteColor];
        cell.cmtText.textColor = [UIColor whiteColor];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


-(IBAction)nextBtn:(id)sender
{
    self.commonArray = self.BallType2;
    
    [self.commentTbl reloadData];
    self.next.hidden = YES;
    self.previous.hidden = NO;
}

-(IBAction)previousBtn:(id)sender
{
    self.commonArray = self.BallType1;
    
    [self.commentTbl reloadData];
    self.previous.hidden = YES;
    self.next.hidden = NO;
}

@end
