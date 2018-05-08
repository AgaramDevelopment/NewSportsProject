//
//  TeamsVC.m
//  NewSportsProject
//
//  Created by Mac on 21/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "TeamsVC.h"
#import "CustomNavigation.h"
#import "Config.h"
#import "TeamMemDetails.h"

@interface TeamsVC ()
{
    BOOL isPop;
    BOOL isList;
    
}
@property (nonatomic,strong) IBOutlet NSLayoutConstraint * popXposition;

@property (nonatomic,strong) IBOutlet NSLayoutConstraint * popWidth;


@end

@implementation TeamsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customnavigationmethod];
    
    self.ShawdowView.clipsToBounds = NO;
    self.ShawdowView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.ShawdowView.layer.shadowOffset = CGSizeMake(0,5);
    self.ShawdowView.layer.shadowOpacity = 0.5;
    
    isList = YES;
    
    self.popTbl.hidden = YES;
    self.GridTbl.hidden = YES;
    
//    self.gridBtn.imageView.image = [UIImage imageNamed:@"GridimgGray"];
//    self.listBtn.imageView.image = [UIImage imageNamed:@"ListimgGray"];
//    
    
    UIImage *btnImage1 = [UIImage imageNamed:@"ListimgGray"];
    [self.listBtn setImage:btnImage1 forState:UIControlStateNormal];
    
    UIImage *btnImage2 = [UIImage imageNamed:@"GridimgGray"];
    [self.gridBtn setImage:btnImage2 forState:UIControlStateNormal];
    
    [self.listBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    
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
    objCustomNavigation.tittle_lbl.text=@"TEAM";
    objCustomNavigation.nav_header_img.backgroundColor = [UIColor colorWithRed:(13/255.0f) green:(43/255.0f) blue:(129/255.0f) alpha:1.0f];
    objCustomNavigation.summarybtn.hidden=YES;
    objCustomNavigation.btn_back.hidden = NO;
    objCustomNavigation.filter_btn.hidden = YES;
    objCustomNavigation.Cancelbtn.hidden = YES;
    [objCustomNavigation.btn_back addTarget:self action:@selector(didClickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(IBAction)didClickCompetetion:(id)sender
{
    
    if(isPop==NO)
    {
        self.popTbl.hidden = NO;
        isPop = YES;
        isList = NO;
        
        self.popXposition.constant = self.v1.frame.origin.x;
        self.popWidth.constant = self.CompetBtn.frame.size.width;
        
        [self.popTbl reloadData];
    }
    else
    {
        isPop=NO;
        isList = YES;
        self.popTbl.hidden = YES;
    }
}

-(IBAction)didClickSeason:(id)sender
{
    
    if(isPop==NO)
    {
        self.popTbl.hidden = NO;
        isPop = YES;
        isList = NO;
        self.popXposition.constant = self.v2.frame.origin.x;
        self.popWidth.constant = self.SeasonBtn.frame.size.width;
        
    }
    else
    {
        isPop=NO;
        isList = YES;
        self.popTbl.hidden = YES;
    }
    
    [self.popTbl reloadData];
}

-(IBAction)didClickListView:(id)sender
{
    
    self.ListTbl.hidden = NO;
    self.GridTbl.hidden = YES;
    
    //self.listBtn.imageView.image = [UIImage imageNamed:@"ListimgBlue"];
    
    UIImage *btnImage = [UIImage imageNamed:@"ListimgBlue"];
    [self.listBtn setImage:btnImage forState:UIControlStateNormal];
    
    UIImage *btnImage1 = [UIImage imageNamed:@"GridimgGray"];
    [self.gridBtn setImage:btnImage1 forState:UIControlStateNormal];


    

    
}

-(IBAction)didClickGridview:(id)sender
{
    

    
    self.ListTbl.hidden = YES;
    self.GridTbl.hidden = NO;
    
    //self.gridBtn.imageView.image = [UIImage imageNamed:@"GridimgBlue"];
    
    UIImage *btnImage = [UIImage imageNamed:@"GridimgBlue"];
    [self.gridBtn setImage:btnImage forState:UIControlStateNormal];
    
    UIImage *btnImage1 = [UIImage imageNamed:@"ListimgGray"];
    [self.listBtn setImage:btnImage1 forState:UIControlStateNormal];

    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isList)
    {
        return 4;
    }
    else
    {
        return 0;
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(isList)
    {
        
        static NSString *MyIdentifier = @"MyIdentifier";
        
        
        
        TeamsCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
        if (cell == nil)
        {
            // cell = [[PointsTableCell alloc] initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:MyIdentifier];
            
            if(IS_IPHONE_DEVICE)
            {
                [[NSBundle mainBundle] loadNibNamed:@"TeamsCell_iPhone" owner:self options:nil];
            }
            else
            {
                [[NSBundle mainBundle] loadNibNamed:@"TeamsCell_iPad" owner:self options:nil];
            }
        }
        
        cell = self.objCell;
        int num = indexPath.row+1;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell = self.objsubcell;
        
        // cell.textLabel.text = self.playername[indexPath.row];
        
        //cell.textColor = [UIColor whiteColor];
        
        cell.Playername.text = @"Virat Kohli";
        
        //CGSize expectedLabelSize = [cell.Playername.text sizeWithFont:cell.Playername.font
                                        //constrainedToSize:maximumLabelSize
                                            //lineBreakMode:cell.Playername.lineBreakMode];
        CGSize size = [cell.Playername.text sizeWithAttributes:
                       @{NSFontAttributeName:
                             [UIFont systemFontOfSize:17.0f]}];
        
        //adjust the label the the new height.
        CGRect newFrame = cell.Playername.frame;
        newFrame.size.height = size.height;
        cell.Playername.frame = newFrame;
        
        
        cell.Playertype.text = @"Batsman";
        
        //CGSize expectedLabelSize = [cell.Playername.text sizeWithFont:cell.Playername.font
        //constrainedToSize:maximumLabelSize
        //lineBreakMode:cell.Playername.lineBreakMode];
        CGSize size1 = [cell.Playertype.text sizeWithAttributes:
                       @{NSFontAttributeName:
                             [UIFont systemFontOfSize:17.0f]}];
        
        //adjust the label the the new height.
        CGRect newFrame1 = cell.Playertype.frame;
        newFrame1.size.height = size1.height;
        cell.Playertype.frame = newFrame1;

        
        return cell;
    }
    
    return nil;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        TeamMemDetails * objFix = [[TeamMemDetails alloc]init];
        objFix = (TeamMemDetails *)[self.storyboard instantiateViewControllerWithIdentifier:@"TeamMemDetails"];
        [self.navigationController pushViewController:objFix animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
}

-(IBAction)didClickBackBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(IS_IPHONE_DEVICE)
    {
        if(!IS_IPHONE5)
        {
            return CGSizeMake(110, 110);
        }
        else
        {
            return CGSizeMake(90, 100);
        }
    }
    else
    {
        return CGSizeMake(200, 180);
    }
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

#pragma mark collection view cell paddings
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if(!IS_IPHONE_DEVICE)
    {
        return UIEdgeInsetsMake(20, 20, 20, 20); // top, left, bottom, right
    }
    else{
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if(!IS_IPHONE_DEVICE)
    {
        return 20.0;
    }
    else{
        return 5.0;
    }
}



- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if(!IS_IPHONE_DEVICE)
    {
        return 23.0;
    }
    else{
        return 10.0;
    }
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewCell *cell = [self.GridTbl dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    
    //cell.photos.image =[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    
    //cell.photos_title_lbl.text = titleArray[indexPath.row];
    
    //cell.backgroundColor= [UIColor colorWithRed:(0/255.0f) green:(0/255.0f) blue:(0/255.0f) alpha:0.27f];
    
    //cell.cellinView.backgroundColor = [UIColor colorWithRed:(0/255.0f) green:(0/255.0f) blue:(0/255.0f) alpha:0.27f];
    
    //cell.layer.borderWidth=0.5f;
    //cell.layer.borderColor=[UIColor colorWithRed:(255/255.0f) green:(255/255.0f) blue:(255/255.0f) alpha:0.5f].CGColor;
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TeamMemDetails * objFix = [[TeamMemDetails alloc]init];
    objFix = (TeamMemDetails *)[self.storyboard instantiateViewControllerWithIdentifier:@"TeamMemDetails"];
    [self.navigationController pushViewController:objFix animated:YES];

}



@end
