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
@import SDWebImage;

@interface CommentaryVC ()
{
    CGFloat tableRowHeight;
}

@property (nonatomic,strong)  NSMutableArray * BallType1;

@property (nonatomic,strong)  NSMutableArray * BallType2;

@property (nonatomic,strong)  NSMutableArray * RecentBallsArray;

@property (nonatomic,strong)  NSMutableArray * commonArray;
@end

@implementation CommentaryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customnavigationmethod];
    
    self.commonArray = [[NSMutableArray alloc]init];
    self.RecentBallsArray = [[NSMutableArray alloc]init];
    
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
    
   // self.commonArray = self.BallType1;
    self.previous.hidden = YES;
    
    [self ResultsWebservice];
    
    [NSTimer scheduledTimerWithTimeInterval:5
                                     target:self
                                   selector:@selector(pageRefresh:)
                                   userInfo:nil
                                    repeats:YES];
    
    
    
}

-(IBAction)pageRefresh:(id)sender
{
    NSLog(@"Commentry Refreshed");
    [self ResultsWebservice];
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
    return self.RecentBallsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    LiveSummaryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    if( [[self checkNull:[[self.RecentBallsArray valueForKey:@"TOTALRUNS"]objectAtIndex:indexPath.row]] isEqualToString:@"0NB"])
    {
        NSString *arr = [self checkNull:[[self.RecentBallsArray valueForKey:@"TOTALRUNS"]objectAtIndex:indexPath.row]];
        NSString *ss = [NSString stringWithFormat:@"%@",[arr substringFromIndex:1]];
        cell.Ball1.text = ss;
    }
    else
    {
    
    cell.Ball1.text = [self checkNull:[[self.RecentBallsArray valueForKey:@"TOTALRUNS"]objectAtIndex:indexPath.row]];
    }
    
    if([cell.Ball1.text isEqualToString:@"4"] || [cell.Ball1.text isEqualToString:@"6"] )
    {
        cell.Ball1.backgroundColor = [UIColor colorWithRed:(44/255.0f) green:(167/255.0f) blue:(219/255.0f) alpha:1.0f];
        cell.Ball1.textColor = [UIColor whiteColor];
    }
    else if([cell.Ball1.text isEqualToString:@"0"] || [cell.Ball1.text isEqualToString:@"1"] || [cell.Ball1.text isEqualToString:@"2"] || [cell.Ball1.text isEqualToString:@"3"] )
    {
        //cell.Ball1.backgroundColor = [UIColor colorWithRed:(93/255.0f) green:(93/255.0f) blue:(93/255.0f) alpha:1.0f];
        cell.Ball1.backgroundColor = [UIColor whiteColor];
        cell.Ball1.textColor = [UIColor blackColor];
    }
    else if([cell.Ball1.text isEqualToString:@"W"])
    {
        cell.Ball1.backgroundColor = [UIColor colorWithRed:(214/255.0f) green:(31/255.0f) blue:(38/255.0f) alpha:1.0f];
        cell.Ball1.textColor = [UIColor whiteColor];
    }
    else
    {
        cell.Ball1.backgroundColor = [UIColor whiteColor];
        cell.Ball1.textColor = [UIColor blackColor];
    }
    
    return cell;
    
}


-(void)ResultsWebservice
{
    //[COMMON loadingIcon:self.view];
    if([COMMON isInternetReachable])
    {
        
        
        //NSString *URLString =  [URL_FOR_RESOURCE(@"") stringByAppendingString:[NSString stringWithFormat:@"%@",ResultsKey]];
        
    //    NSString *URLString = @"http://192.168.0.152:8083/CSK.svc/MOBILE_FETCHLIVESCORE";
//        NSString *URLString = @"https://csk.agaraminfotech.com/CSK.svc/MOBILE_FETCHLIVESCORE";
    NSString *URLString = @"http://192.168.0.152:8083/CSK.svc/MOBILE_FETCHLIVESCORE";
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        manager.requestSerializer = requestSerializer;
        
        
        //        NSString *competition = @"UCC0000274";
        //        NSString *matchCode = @"DMSC116D017C2AA4FC420180302113612078";
        
        NSString *competition = @"UCC0000274";
        NSString *matchCode = @"DMSC116D017C2AA4FC420180302114212080";
        
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        if(competition)   [dic    setObject:competition     forKey:@"COMPETITIONCODE"];
        if(matchCode)   [dic    setObject:matchCode     forKey:@"MATCHCODE"];
        
        
        NSLog(@"parameters : %@",dic);
        [manager POST:URLString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"response ; %@",responseObject);
            
            if(responseObject >0)
            {
                NSMutableArray *arr = [[NSMutableArray alloc]init];
                arr = [responseObject valueForKey:@"lstCommentry"];
                
                self.commonArray = [[NSMutableArray alloc]init];
                self.commonArray = arr;
                [self.commentTbl reloadData];
                
                
                NSMutableArray *groundDetails = [[NSMutableArray alloc]init];
                groundDetails = [responseObject valueForKey:@"lstMatchDetails"];
                
                self.competitionTypeLbl.text = [[groundDetails valueForKey:@"COMPETITIONNAME"] objectAtIndex:0];
                self.groundLbl.text = [[groundDetails valueForKey:@"GROUNDNAME"] objectAtIndex:0];
                
                
                NSMutableArray *matchDetails = [[NSMutableArray alloc]init];
                
                matchDetails = [responseObject valueForKey:@"lstLiveScore"];
                
                if(matchDetails.count>0)
                {
                self.teamANameLbl.text = [self checkNull:[[matchDetails valueForKey:@"FIRSTINNINGSSHORTNAME"] objectAtIndex:0]];
                self.teamBNameLbl.text = [self checkNull:[[matchDetails valueForKey:@"SECONDINNINGSSHORTNAME"] objectAtIndex:0]];
                
                self.teamAScoreLbl.text = [self checkNull:[[matchDetails valueForKey:@"FIRSTINNINGSSCORE"] objectAtIndex:0]];
                self.teamBScoreLbl.text = [self checkNull:[[matchDetails valueForKey:@"SECONDINNINGSSCORE"] objectAtIndex:0]];
                
                self.teamAOversLbl.text = [self checkNull:[[matchDetails valueForKey:@"FIRSTINNINGSOVERS"] objectAtIndex:0]];
                self.teamBOversLbl.text = [self checkNull:[[matchDetails valueForKey:@"SECONDINNINGSOVERS"] objectAtIndex:0]];
                
                self.wonMatchLbl.text = [self checkNull:[[matchDetails valueForKey:@"MATCHSTATUS"] objectAtIndex:0]];
                
                
                NSString *teamA = [NSString stringWithFormat:@"http://csk.agaraminfotech.com/%@",[self checkNull:[[matchDetails valueForKey:@"BATTEAMLOGO"] objectAtIndex:0]]];//BATTEAMLOGO
                [self.teamALogo sd_setImageWithURL:[NSURL URLWithString: [self checkNull:teamA]] placeholderImage:[UIImage imageNamed:@"no-image"]];
                
                NSString *teamB = [NSString stringWithFormat:@"http://csk.agaraminfotech.com/%@",[self checkNull:[[matchDetails valueForKey:@"BOWLTEAMLOGO"] objectAtIndex:0]]];//BOWLTEAMLOGO
                [self.teamBLogo sd_setImageWithURL:[NSURL URLWithString: [self checkNull:teamB]] placeholderImage:[UIImage imageNamed:@"no-image"]];
                
                }
                self.RecentBallsArray = [[NSMutableArray alloc]init];
                self.RecentBallsArray = [self checkNull:[responseObject valueForKey:@"lstRecentLiveScore"]];
                [self.ballsTbl reloadData];
                
                NSLog(@"Commentry Refreshed");
            }
            
            [COMMON RemoveLoadingIcon];
            [self.view setUserInteractionEnabled:YES];
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"failed");
            [COMMON webServiceFailureError];
            [self.view setUserInteractionEnabled:YES];
            
        }];
    }
    
}

-(NSString *)checkNull:(NSString *)_value
{
    if ([_value isEqual:[NSNull null]] || _value == nil || [_value isEqual:@"<null>"]) {
        _value=@"";
    }
    return _value;
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
//    if(IS_IPHONE_DEVICE)
//    {
//        [[NSBundle mainBundle] loadNibNamed:@"CommentaryVCCell_iPhone" owner:self options:nil];
//    }
//    else
//    {
        [[NSBundle mainBundle] loadNibNamed:@"CommentaryVCCell_iPad" owner:self options:nil];
        
   // }
    
    
    
    cell = self.objlistCell;
    
    if([[self checkNull:[[self.commonArray valueForKey:@"COMMENTRYTYPE"] objectAtIndex:indexPath.row]] isEqualToString:@"1"])
    {
            cell.overs.text = [self checkNull:[[self.commonArray valueForKey:@"COMMENTRYTYPEDESC"] objectAtIndex:indexPath.row]];
        
            cell.cmtText.text = [self checkNull:[[self.commonArray valueForKey:@"COMMENTRY"] objectAtIndex:indexPath.row]];
        
    }
    else if([[self checkNull:[[self.commonArray valueForKey:@"COMMENTRYTYPE"] objectAtIndex:indexPath.row]] isEqualToString:@"3"])
    {
            cell.overs.text = @"";
        
//        //NSString *myString = [self checkNull:[[self.commonArray valueForKey:@"COMMENTRYTYPEDESC"] objectAtIndex:indexPath.row]];
//        //NSAttributedString *myBoldString = [[NSAttributedString alloc] initWithString:myString
//                                                                           attributes:@{ NSFontAttributeName: [UIFont boldSystemFontOfSize:35.0] }];
        
        if([[self checkNull:[[self.commonArray valueForKey:@"COMMENTRYTYPEDESC"] objectAtIndex:indexPath.row]] isEqualToString:@""])
        {
            NSString *reqCommentry = [NSString stringWithFormat:@"\n%@",[self checkNull:[[self.commonArray valueForKey:@"COMMENTRY"] objectAtIndex:indexPath.row]]];
            
            cell.cmtText.text = reqCommentry;
            
        }else
        {
            
            
            NSString *myString = [NSString stringWithFormat:@"%@:",[self checkNull:[[self.commonArray valueForKey:@"COMMENTRYTYPEDESC"] objectAtIndex:indexPath.row]]] ;
            
            NSMutableAttributedString *myBoldString = [[NSMutableAttributedString alloc] initWithString:myString
                                                                               attributes:@{ NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Bold" size:15.0] }];
            
            
            NSString *myString1 = [NSString stringWithFormat:@"\n%@",[self checkNull:[[self.commonArray valueForKey:@"COMMENTRY"] objectAtIndex:indexPath.row]]];
            
            ;
            NSMutableAttributedString *myBoldString1 = [[NSMutableAttributedString alloc] initWithString:myString1
                                                                                             attributes:@{ NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:14.0] }];
            
//        NSString *reqCommentry = [NSString stringWithFormat:@"%@:\n%@",[self checkNull:[[self.commonArray valueForKey:@"COMMENTRYTYPEDESC"] objectAtIndex:indexPath.row]],[self checkNull:[[self.commonArray valueForKey:@"COMMENTRY"] objectAtIndex:indexPath.row]]];
            
            [myBoldString appendAttributedString:myBoldString1];
        
            cell.cmtText.attributedText = myBoldString;
        }
    }
    
    cell.Ball.text = [self checkNull:[[self.commonArray valueForKey:@"RUNS"] objectAtIndex:indexPath.row]];
    
        if([cell.Ball.text isEqualToString:@"4"] || [cell.Ball.text isEqualToString:@"6"] )
        {
            cell.Ball.backgroundColor = [UIColor colorWithRed:(44/255.0f) green:(167/255.0f) blue:(219/255.0f) alpha:1.0f];
        }
        else if([cell.Ball.text isEqualToString:@"0"] || [cell.Ball.text isEqualToString:@"1"] || [cell.Ball.text isEqualToString:@"2"] || [cell.Ball.text isEqualToString:@"3"])
        {
            cell.Ball.backgroundColor = [UIColor colorWithRed:(93/255.0f) green:(93/255.0f) blue:(93/255.0f) alpha:1.0f];
        }
    
        else if([cell.Ball.text isEqualToString:@"W"])
        {
            cell.backgroundColor = [UIColor colorWithRed:(214/255.0f) green:(31/255.0f) blue:(38/255.0f) alpha:1.0f];
            cell.Ball.textColor = [UIColor colorWithRed:(214/255.0f) green:(31/255.0f) blue:(38/255.0f) alpha:1.0f];
            cell.overs.textColor = [UIColor whiteColor];
            cell.cmtText.textColor = [UIColor whiteColor];
        }
        else if([cell.Ball.text isEqualToString:@""])
        {
            cell.Ball.hidden = YES;
        }
        else
        {
            cell.Ball.backgroundColor = [UIColor blackColor];
            cell.Ball.textColor = [UIColor whiteColor];
        }
    
    [self setUpCell:cell atIndexPath:indexPath];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //static NSString *MyIdentifier = @"MyIdentifier";
    //CommentaryVCCell *cell = [self.commentTbl dequeueReusableCellWithIdentifier:MyIdentifier];
    return tableRowHeight;
}

- (void)setUpCell:(CommentaryVCCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    tableRowHeight = cell.contentView.frame.size.height;
}

-(IBAction)nextBtn:(id)sender
{
   // self.commonArray = self.BallType2;
    
   // [self.commentTbl reloadData];
    self.next.hidden = YES;
    self.previous.hidden = NO;
}

-(IBAction)previousBtn:(id)sender
{
    //self.commonArray = self.BallType1;
    
    //[self.commentTbl reloadData];
    self.previous.hidden = YES;
    self.next.hidden = NO;
}

@end
