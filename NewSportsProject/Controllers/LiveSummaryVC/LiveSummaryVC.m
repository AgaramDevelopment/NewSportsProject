//
//  LiveSummaryVC.m
//  NewSportsProject
//
//  Created by Mac on 28/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "LiveSummaryVC.h"
#import "CustomNavigation.h"
#import "Config.h"
#import "WebService.h"
#import "AppCommon.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface LiveSummaryVC () {
    NSMutableArray *recentLiveScore;
}

@end

@implementation LiveSummaryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customnavigationmethod];
    self.battingStrikerImage.layer.masksToBounds = true;
    self.battingStrikerImage.clipsToBounds = true;
    self.battingStrikerImage.layer.cornerRadius = self.battingStrikerImage.frame.size.width/2;
    self.battingNonStrikerImage.layer.masksToBounds = true;
    self.battingNonStrikerImage.clipsToBounds = true;
    self.battingNonStrikerImage.layer.cornerRadius = self.battingNonStrikerImage.frame.size.width/2;
    
    
    self.bowlingStrikerImage.layer.masksToBounds = true;
    self.bowlingStrikerImage.clipsToBounds = true;
    self.bowlingStrikerImage.layer.cornerRadius = self.bowlingStrikerImage.frame.size.width/2;
    self.bowlingNonStrikerImage.layer.masksToBounds = true;
    self.bowlingNonStrikerImage.clipsToBounds = true;
    self.bowlingNonStrikerImage.layer.cornerRadius = self.bowlingNonStrikerImage.frame.size.width/2;
    
    
    UIBezierPath *path = [UIBezierPath new];
    
    [path moveToPoint:(CGPoint){self.battingPartnershipLbl.frame.size.width-15,0 }];//w0
    [path addLineToPoint:(CGPoint){0, 0}];//00
    [path addLineToPoint:(CGPoint){15,self.battingPartnershipLbl.frame.size.height }];//0h
    [path addLineToPoint:(CGPoint){self.battingPartnershipLbl.frame.size.width, self.battingPartnershipLbl.frame.size.height}];//wh20
    
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = self.battingPartnershipLbl.bounds;
    mask.path = path.CGPath;
    self.battingPartnershipLbl.layer.mask = mask;
    
    
    UIBezierPath *path1 = [UIBezierPath new];
    
    [path1 moveToPoint:(CGPoint){self.bowlingPartnershipLbl.frame.size.width-15,0 }];//w0
    [path1 addLineToPoint:(CGPoint){0, 0}];//00
    [path1 addLineToPoint:(CGPoint){15,self.bowlingPartnershipLbl.frame.size.height }];//0h
    [path1 addLineToPoint:(CGPoint){self.bowlingPartnershipLbl.frame.size.width, self.bowlingPartnershipLbl.frame.size.height}];//wh20
    
    CAShapeLayer *mask1 = [CAShapeLayer new];
    mask1.frame = self.bowlingPartnershipLbl.bounds;
    mask1.path = path1.CGPath;
    self.bowlingPartnershipLbl.layer.mask = mask1;
    
    [self liveSummaryPostMethodWebService];
   
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

-(void)liveSummaryPostMethodWebService
{
    [COMMON loadingIcon:self.view];
    
    NSString *URLString =  @"http://192.168.0.152:8083/CSK.svc/MOBILE_FETCHLIVESCORE";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    manager.requestSerializer = requestSerializer;
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic    setObject:@"UCC0000274"     forKey:@"COMPETITIONCODE"];
    [dic    setObject:@"DMSC116D017C2AA4FC420180302114112079"     forKey:@"MATCHCODE"];
    
    NSLog(@"parameters : %@",dic);
    [manager POST:URLString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response ; %@",responseObject);
        
        if([[responseObject valueForKey:@"Status"] integerValue] == 1)
        {
            [self liveScoreDetails:responseObject];
        }
        
        
        [COMMON RemoveLoadingIcon];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failed");
        [COMMON RemoveLoadingIcon];
    }];
}

- (void)liveScoreDetails:(id)liveScore {
    
    recentLiveScore = [NSMutableArray new];
    recentLiveScore = [liveScore valueForKey:@"lstRecentLiveScore"];
    NSMutableArray *matchDetailsArray = [liveScore valueForKey:@"lstMatchDetails"];
    for (id key in matchDetailsArray) {
        self.competitionTypeLbl.text = [key valueForKey:@"COMPETITIONNAME"];
        self.groundLbl.text = [key valueForKey:@"GROUNDNAME"];
    }
    
    NSMutableArray *liveScoreArray = [liveScore valueForKey:@"lstLiveScore"];
    
    for (id key in liveScoreArray) {
        
        [self.teamALogo sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://csk.agaraminfotech.com/%@", [key valueForKey:@"BATTEAMLOGO"]]] placeholderImage:[UIImage imageNamed:@"no-image"]];
        
        self.teamANameLbl.text = [self checkNull:[key valueForKey:@"BATTEAMSHORTNAME"]];
        self.teamAScoreLbl.text = [self checkNull:[key valueForKey:@"FIRSTINNINGSTOTAL"]];
        self.teamAOversLbl.text = [NSString stringWithFormat:@"(%@)", [self checkNull:[key valueForKey:@"FIRSTINNINGSOVERS"]]];
        
        [self.teamBLogo sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://csk.agaraminfotech.com/%@", [key valueForKey:@"BOWLTEAMLOGO"]]] placeholderImage:[UIImage imageNamed:@"no-image"]];
        self.teamBNameLbl.text = [self checkNull:[key valueForKey:@"BOWLTEAMSHORTNAME"]];
        
        if ([[key valueForKey:@"SECONDINNINGSSCORE"] isEqualToString:@""]) {
            self.teamBScoreLbl.text = @"0";
        } else {
             self.teamBScoreLbl.text = [self checkNull:[key valueForKey:@"SECONDINNINGSSCORE"]];
        }
        
        if ([[self checkNull:[key valueForKey:@"SECONDINNINGSOVERS"]] isEqualToString:@""]) {
            self.teamBOversLbl.text = @"(0)";
        } else {
            self.teamBOversLbl.text = [NSString stringWithFormat:@"(%@)", [self checkNull:[key valueForKey:@"SECONDINNINGSOVERS"]]];
        }
        
        self.runRateLbl.text = [NSString stringWithFormat:@"RR %@ / RRR %@", [self checkNull:[key valueForKey:@"RUNRATE"]], [self checkNull:[key valueForKey:@"REQRUNRATE"]]];
        
        self.matchWonLbl.text = [self checkNull:[key valueForKey:@"MATCHSTATUS"]];
        
        //Batting & Bowling
        self.partnershipRunsLbl.text = [NSString stringWithFormat:@"%@ [%@]", [self checkNull:[key valueForKey:@"PARTNERSHIPRUNS"]], [self checkNull:[key valueForKey:@"PARTNERSHIPBALLS"]]];
        [self.battingStrikerImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [key valueForKey:@"BATTEAMLOGO"]]] placeholderImage:[UIImage imageNamed:@"testimgplayer"]];
        self.battingStrikerNameLbl.text = [self checkNull:[key valueForKey:@"STRIKERNAME"]];
        self.battingStrikerRunsLbl.text = [NSString stringWithFormat:@"%@ [%@]", [self checkNull:[key valueForKey:@"STRIKERTOTALRUNS"]], [self checkNull:[key valueForKey:@"STRIKERTOTALBALLS"]]];
        
        
        [self.battingNonStrikerImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [key valueForKey:@"BATTEAMLOGO"]]] placeholderImage:[UIImage imageNamed:@"virat"]];
        self.battingNonStrikerNameLbl.text = [self checkNull:[key valueForKey:@"NONSTRIKERNAME"]];
        self.battingNonStrikerRunsLbl.text = [NSString stringWithFormat:@"%@ [%@]", [self checkNull:[key valueForKey:@"NONSTRIKERTOTALRUNS"]], [self checkNull:[key valueForKey:@"NONSTRIKERTOTALBALLS"]]];
    }
    
    NSMutableArray *matchOverSummaryArray = [liveScore valueForKey:@"lstMatchOverSummary"];
    
//     self.partnershipOversLbl.text = [self checkNull:[key valueForKey:@"MATCHSTATUS"]];
     [self.bowlingStrikerImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [[matchOverSummaryArray objectAtIndex:0] valueForKey:@"BATTEAMLOGO"]]] placeholderImage:[UIImage imageNamed:@"testimgplayer"]];
     self.bowlingStrikerNameLbl.text = [self checkNull:[[matchOverSummaryArray objectAtIndex:0] valueForKey:@"BOWLERNAME"]];
     self.bowlingStrikerOversLbl.text = [self checkNull:[[matchOverSummaryArray objectAtIndex:0] valueForKey:@"BOWLERDETAIL"]];
     
     [self.bowlingNonStrikerImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [[matchOverSummaryArray objectAtIndex:1] valueForKey:@"BATTEAMLOGO"]]] placeholderImage:[UIImage imageNamed:@"virat"]];
     self.bowlingNonStrikerNameLbl.text = [self checkNull:[[matchOverSummaryArray objectAtIndex:1] valueForKey:@"BOWLERNAME"]];
     self.bowlingNonStrikerOversLbl.text = [self checkNull:[[matchOverSummaryArray objectAtIndex:1] valueForKey:@"BOWLERDETAIL"]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.ballsTbl reloadData];
    });
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return recentLiveScore.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveSummaryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    if ([[[recentLiveScore objectAtIndex:indexPath.row] valueForKey:@"TOTALRUNS"] isEqualToString:@"W"] || [[[recentLiveScore objectAtIndex:indexPath.row] valueForKey:@"TOTALRUNS"] isEqualToString:@"w"]) {
        cell.Ball1.backgroundColor = [UIColor colorWithRed:(214/255.0f) green:(31/255.0f) blue:(38/255.0f) alpha:1.0f];
    } else if ([[[recentLiveScore objectAtIndex:indexPath.row] valueForKey:@"TOTALRUNS"] isEqualToString:@"4"] || [[[recentLiveScore objectAtIndex:indexPath.row] valueForKey:@"TOTALRUNS"] isEqualToString:@"4"]) {
        cell.Ball1.backgroundColor = [UIColor colorWithRed:(44/255.0f) green:(167/255.0f) blue:(219/255.0f) alpha:1.0f];
    }
    
    cell.Ball1.text = [[recentLiveScore objectAtIndex:indexPath.row] valueForKey:@"TOTALRUNS"];
    
    return cell;
    
}

- (NSString *)checkNull:(NSString *)_value
{
    if ([_value isEqual:[NSNull null]] || _value == nil || [_value isEqual:@"<null>"] || [_value isEqualToString:@""]) {
        _value=@"";
    }
    return _value;
}

@end
