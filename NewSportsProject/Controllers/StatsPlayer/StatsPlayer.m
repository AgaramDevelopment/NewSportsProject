//
//  StatsPlayer.m
//  NewSportsProject
//
//  Created by Mac on 24/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "StatsPlayer.h"
#import "Config.h"


@interface StatsPlayer () 

@end

@implementation StatsPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.GridTbl registerNib:[UINib nibWithNibName:@"PlayerStatsCell_iPad" bundle:nil] forCellWithReuseIdentifier:@"photoCell"];
    
    self.headerView.layer.cornerRadius = 5;
    self.headerView.layer.masksToBounds = true;
    self.headerView.layer.borderColor = [UIColor colorWithRed:(24/255.0f) green:(40/255.0f) blue:(126/255.0f) alpha:1.0f].CGColor;
    self.headerView.layer.borderWidth = 1.0f;
    
    [self.t20 sendActionsForControlEvents:UIControlEventTouchUpInside];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
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
        return CGSizeMake(160, 140);
    }
}


//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    PlayerStatsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    if(indexPath.row == 0)
    {
        cell.title.text = @"Matches";
        cell.value.text = @"202";
    }

    
    if(indexPath.row == 1)
    {
        cell.title.text = @"Innings";
        cell.value.text = @"194";
    }
    
    if(indexPath.row == 2)
    {
        cell.title.text = @"Runs";
        cell.value.text = @"9030";
    }
    if(indexPath.row == 3)
    {
        cell.title.text = @"High Score";
        cell.value.text = @"183";
    }
    if(indexPath.row == 4)
    {
        cell.title.text = @"Average";
        cell.value.text = @"55.74";
    }
    if(indexPath.row == 5)
    {
        cell.title.text = @"Strike Rate";
        cell.value.text = @"91.73";
    }
    if(indexPath.row == 6)
    {
        cell.title.text = @"100s";
        cell.value.text = @"32";
    }
    if(indexPath.row == 7)
    {
        cell.title.text = @"200s";
        cell.value.text = @"0";
    }
    if(indexPath.row == 8)
    {
        cell.title.text = @"50s";
        cell.value.text = @"45";
    }
    
    return cell;
}

-(IBAction)didClickt20Btn:(id)sender
{
   
    [self setInningsBySelection:@"1"];
    
}

-(IBAction)didClickodiBtn:(id)sender
{
    [self setInningsBySelection:@"2"];
    
    
}

-(IBAction)didClicktestmatchBtn:(id)sender
{
    
    [self setInningsBySelection:@"3"];
}



-(void) setInningsBySelection: (NSString*) innsNo{
    
    [self setInningsButtonUnselect:self.t20];
    [self setInningsButtonUnselect:self.odi];
    [self setInningsButtonUnselect:self.testmatch];
    
    if([innsNo isEqualToString:@"1"]){
        
        [self setInningsButtonSelect:self.t20];
        
    }else if([innsNo isEqualToString:@"2"]){
        
        [self setInningsButtonSelect:self.odi];
    }else if([innsNo isEqualToString:@"3"]){
        
        [self setInningsButtonSelect:self.testmatch];
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
    UIColor *extrasBrushBG = [self colorWithHexString : @"#18287E"];
    
    innsBtn.layer.backgroundColor = extrasBrushBG.CGColor;
    
}

-(void) setInningsButtonUnselect : (UIButton*) innsBtn{
    //  innsBtn.layer.cornerRadius = 25;
    UIColor *extrasBrushBG = [self colorWithHexString : @"#2CA7DB"];
    
    innsBtn.layer.backgroundColor = extrasBrushBG.CGColor;
    
}


@end
