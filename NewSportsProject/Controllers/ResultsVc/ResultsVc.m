//
//  ResultsVc.m
//  NewSportsProject
//
//  Created by Mac on 18/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "ResultsVc.h"
#import "CustomNavigation.h"
#import "Config.h"
#import "AdvanceFilter.h"
#import "AppCommon.h"
#import "WebService.h"
#import "ScoreCardVC.h"
#import "DropDownTableViewController.h"
@import SDWebImage;

@interface ResultsVc ()
{
    BOOL isPop;
    BOOL isList;
    
    NSString *displayMatchCode;
    
    NSString *CompetionCode;
    NSString* Teamcode;
}
@property (nonatomic,strong) IBOutlet NSLayoutConstraint * popXposition;

@property (nonatomic,strong) IBOutlet NSLayoutConstraint * popWidth;
@end

@implementation ResultsVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customnavigationmethod];
    
    self.ShawdowView.clipsToBounds = NO;
    self.ShawdowView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.ShawdowView.layer.shadowOffset = CGSizeMake(0,5);
    self.ShawdowView.layer.shadowOpacity = 0.5;
    isList = YES;
   // self.competitionLbl.text = [[self.listCompArray valueForKey:@"COMPETITIONNAME"] objectAtIndex:0];
    //CompetionCode = [[self.listCompArray valueForKey:@"COMPETITIONCODE"] objectAtIndex:0];
    
    self.competitionLbl.text = [AppCommon getCurrentCompetitionName];
    self.Teamnamelbl.text = @"TeamName";
    
    CompetionCode = [AppCommon getCurrentCompetitionCode];
    Teamcode = [AppCommon getCurrentTeamCode];
    
    [self ResultsWebservice];
    self.popTbl.hidden = YES;
    
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
    objCustomNavigation.summarybtn.hidden=YES;
    objCustomNavigation.tittle_lbl.text=@"RESULTS";
    if([objCustomNavigation.tittle_lbl.text isEqualToString: @""])
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withoutText"];
    }
    else
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withText"];
    }
    objCustomNavigation.btn_back.hidden = NO;
    objCustomNavigation.filter_btn.hidden = YES;
    objCustomNavigation.Cancelbtn.hidden = YES;
    [objCustomNavigation.btn_back addTarget:self action:@selector(didClickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}

//-(IBAction)didClickCompetetion:(id)sender
//{
//
//    if(isPop==NO)
//    {
//        [self.ListTbl setUserInteractionEnabled:NO];
//        self.popTbl.hidden = NO;
//        isPop = YES;
//        isList = NO;
//
//        self.popXposition.constant = self.v1.frame.origin.x;
//        self.popWidth.constant = self.CompetBtn.frame.size.width;
//
//        //[self.popTbl reloadData];
//
//
//    }
//    else
//    {
//        isPop=NO;
//        isList = YES;
//        self.popTbl.hidden = YES;
//        [self.ListTbl setUserInteractionEnabled:YES];
//    }
//}

//-(IBAction)didClickSeason:(id)sender
//{
//
//    if(isPop==NO)
//    {
//        self.popTbl.hidden = NO;
//        isPop = YES;
//        isList = NO;
//        self.popXposition.constant = self.v2.frame.origin.x;
//        self.popWidth.constant = self.SeasonBtn.frame.size.width;
//
//    }
//    else
//    {
//        isPop=NO;
//        isList = YES;
//        self.popTbl.hidden = YES;
//    }
//
//    [self.popTbl reloadData];
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isList)
    {
        return self.resultArr.count;
    }
    if(isPop)
    {
        return self.listCompArray.count;
    }
    
    return nil;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(isList==YES)
    {
        
        static NSString *MyIdentifier = @"MyIdentifier";
        
        
        
        ResultsCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
        if (cell == nil)
        {
            // cell = [[PointsTableCell alloc] initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:MyIdentifier];
            
            if(IS_IPHONE_DEVICE)
            {
                [[NSBundle mainBundle] loadNibNamed:@"ResultsCell_iPhone" owner:self options:nil];
            }
            else
            {
                [[NSBundle mainBundle] loadNibNamed:@"ResultsCell_iPad" owner:self options:nil];
            }
        }
        cell = self.objCell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        NSMutableArray *firstobj = [[NSMutableArray alloc]init];
        
        firstobj = [self.resultArr objectAtIndex:indexPath.row];
        
        NSString *dttime = [firstobj valueForKey:@"DateTime"];
        
        NSArray *components = [dttime componentsSeparatedByString:@" "];
        NSString *day = components[0];
        NSString *monthyear = components[1];
        NSString *time = components[2];
        NSString *local = components[3];
        
        cell.date.text = [NSString stringWithFormat:@"%@ %@",day,monthyear];
        cell.time.text = [NSString stringWithFormat:@"%@ %@",time,local];
        
        
        [cell.team1Img sd_setImageWithURL:[NSURL URLWithString: [self checkNull:[firstobj valueForKey:@"TeamALogo"]]] placeholderImage:[UIImage imageNamed:@"no-image"]];
        [cell.team2Img sd_setImageWithURL:[NSURL URLWithString: [self checkNull:[firstobj valueForKey:@"TeamBLogo"]]] placeholderImage:[UIImage imageNamed:@"no-image"]];

        
        //        NSString *ground = [firstobj valueForKey:@"Ground"];
        //        NSString *place = [firstobj valueForKey:@"GroundCode"];
        //        cell.groundName.text = [NSString stringWithFormat:@"%@,%@",ground,place];
        
        
        if(![[firstobj valueForKey:@"FIRSTINNINGSSCORE"] isEqual:[NSNull null]])
        {
            if(![[firstobj valueForKey:@"FIRSTINNINGSSCORE"] isEqualToString:@"0 /0 (0.0 Ov)"])
            {
                cell.firstInn.text = [firstobj valueForKey:@"FIRSTINNINGSSCORE"];
            }
            else
            {
                cell.firstInn.text = @"";
            }
        }
        
        if(![[firstobj valueForKey:@"SECONDINNINGSSCORE"] isEqual:[NSNull null]])
        {
            if(![[firstobj valueForKey:@"SECONDINNINGSSCORE"] isEqualToString:@"0 /0 (0.0 Ov)"])
            {
                cell.secondInn.text = [firstobj valueForKey:@"SECONDINNINGSSCORE"];
            }
            else
            {
                cell.secondInn.text = @"";
            }
        }
        
        if(![[firstobj valueForKey:@"THIRDINNINGSSCORE"] isEqual:[NSNull null]])
        {
            if(![[firstobj valueForKey:@"THIRDINNINGSSCORE"] isEqualToString:@"0 /0 (0.0 Ov)"])
            {
                cell.thirdInn.text = [firstobj valueForKey:@"THIRDINNINGSSCORE"];
            }
            else
            {
                cell.thirdInn.text = @"";
            }
            
            //cell.thirdInn.text = [firstobj valueForKey:@"THIRDINNINGSSCORE"];
        }
        
        
        if(![[firstobj valueForKey:@"FOURTHINNINGSSCORE"] isEqual:[NSNull null]])
        {
            if(![[firstobj valueForKey:@"FOURTHINNINGSSCORE"] isEqualToString:@"0 /0 (0.0 Ov)"])
            {
                cell.fourthInn.text = [firstobj valueForKey:@"FOURTHINNINGSSCORE"];
            }
            else
            {
                cell.fourthInn.text = @"";
            }
        }
        
        cell.team1.text = [firstobj valueForKey:@"TeamA"];
        cell.team2.text = [firstobj valueForKey:@"TeamB"];
        
        if(![[firstobj valueForKey:@"MATCHRESULTORRUNSREQURED"] isEqualToString:@""])
        {
            cell.resultDetails.text = [firstobj valueForKey:@"MATCHRESULTORRUNSREQURED"];
        }
        
        return cell;
    }
    
    if(isPop==YES)
    {
        
        
        static NSString *MyIdentifier = @"MyIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
        
        
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:nil];
        }
        
        cell.textLabel.text = [[self.listCompArray valueForKey:@"COMPETITIONNAME"] objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(isPop== YES)
    {
        return 50;
    }
    else
    {
        return 140;
    }
    
    
}
-(NSString *)checkNull:(NSString *)_value
{
    if ([_value isEqual:[NSNull null]] || _value == nil || [_value isEqual:@"<null>"]) {
        _value=@"";
    }
    return _value;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(isPop==YES)
    {
        self.competitionLbl.text = [[self.listCompArray valueForKey:@"COMPETITIONNAME"]objectAtIndex:indexPath.row];
        
        CompetionCode = [[self.listCompArray valueForKey:@"COMPETITIONCODE"]objectAtIndex:indexPath.row];
        isList = NO;
        isPop =NO;
        self.popTbl.hidden =YES;
        [self ResultsWebservice];
        [self.ListTbl setUserInteractionEnabled:YES];
    }
    if(isList==YES)
    {
        //        isList = NO;
        //        isPop =YES;
        displayMatchCode = [[self.resultArr valueForKey:@"MATCHCODE"] objectAtIndex:indexPath.row];
        NSMutableArray *scoreArray = [[NSMutableArray alloc]init];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        
        NSString *ground = [[self.resultArr valueForKey:@"Ground"]objectAtIndex:indexPath.row];
        NSString *place = [[self.resultArr valueForKey:@"GroundCode"]objectAtIndex:indexPath.row];
        
        [dic setValue:[NSString stringWithFormat:@"%@,%@",ground,place] forKey:@"ground"];
        [dic setValue:[[self.resultArr valueForKey:@"TeamA"] objectAtIndex:indexPath.row] forKey:@"team1"];
        [dic setValue:[[self.resultArr valueForKey:@"TeamB"]objectAtIndex:indexPath.row] forKey:@"team2"];
        [dic setValue:[[self.resultArr valueForKey:@"FIRSTINNINGSSCORE"]objectAtIndex:indexPath.row] forKey:@"Inn1Score"];
        [dic setValue:[[self.resultArr valueForKey:@"SECONDINNINGSSCORE"]objectAtIndex:indexPath.row] forKey:@"Inn2Score"];
        [dic setValue:[[self.resultArr valueForKey:@"THIRDINNINGSSCORE"]objectAtIndex:indexPath.row] forKey:@"Inn3Score"];
        [dic setValue:[[self.resultArr valueForKey:@"FOURTHINNINGSSCORE"]objectAtIndex:indexPath.row] forKey:@"Inn4Score"];
        [dic setValue:[[self.resultArr valueForKey:@"MATCHRESULTORRUNSREQURED"]objectAtIndex:indexPath.row] forKey:@"result"];
        [dic setValue:[[self.resultArr valueForKey:@"COMPETITIONNAME"]objectAtIndex:indexPath.row] forKey:@"Competition"];
        
        [scoreArray addObject:dic];
        
        ScoreCardVC * objFix = [[ScoreCardVC alloc]init];
        objFix = (ScoreCardVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"ScoreCardVC"];
        objFix.matchCode = displayMatchCode;
        objFix.matchDetails = scoreArray;
        objFix.backkey = @"yes";
        [self.navigationController pushViewController:objFix animated:YES];
        
    }
}

-(void)ResultsWebservice
{
    [COMMON loadingIcon:self.view];
    if([COMMON isInternetReachable])
    {
        
        
        NSString *URLString =  [URL_FOR_RESOURCE(@"") stringByAppendingString:[NSString stringWithFormat:@"%@",ResultsKey]];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        manager.requestSerializer = requestSerializer;
        
        //NSString *competition = [[self.listCompArray valueForKey:@""] objectAtIndex:0];
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        if(CompetionCode)   [dic    setObject:CompetionCode     forKey:@"Competitioncode"];
        
        
        NSLog(@"parameters : %@",dic);
        [manager POST:URLString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"response ; %@",responseObject);
            
            if(responseObject >0)
            {
                
                self.resultArr = [[NSMutableArray alloc]init];
                NSMutableArray * filterarr = [[NSMutableArray alloc]init];
                filterarr = [responseObject valueForKey:@"lstFixturesGridValues"];
                
                for( int i=0;i<filterarr.count;i++)
                {
                    if(![[[filterarr valueForKey:@"FIRSTINNINGSSCORE"] objectAtIndex:i] isEqual:[NSNull null]] || ![[[filterarr valueForKey:@"SECONDINNINGSSCORE"] objectAtIndex:i] isEqual:[NSNull null]] || ![[[filterarr valueForKey:@"THIRDINNINGSSCORE"] objectAtIndex:i] isEqual:[NSNull null]] || ![[[filterarr valueForKey:@"FOURTHINNINGSSCORE"] objectAtIndex:i] isEqual:[NSNull null]]  )
                    {
                        
                        [self.resultArr addObject:[filterarr objectAtIndex:i]];
                        
                        isList=YES;
                    }
                    self.TotalMatchesArr = [[NSMutableArray alloc]init];
                    self.TotalMatchesArr = self.resultArr;
                }
                
                
                //self.resultArr = [responseObject valueForKey:@"lstFixturesGridValues"];
                
            }
            
            
            [self.ListTbl reloadData];
            
            [COMMON RemoveLoadingIcon];
            [self.view setUserInteractionEnabled:YES];
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"failed");
            [COMMON webServiceFailureError];
            [self.view setUserInteractionEnabled:YES];
            
        }];
    }
    
}

-(void)setFilterResults
{

    self.resultArr = [[NSMutableArray alloc]init];

    if(![_competitionLbl.text isEqualToString:@""])
    {

        if([Teamcode isEqualToString:@""])
        {
            self.resultArr = self.TotalMatchesArr;
        }
        else
        {
            NSMutableArray *ReqTeamArray = [[NSMutableArray alloc]init];
            ReqTeamArray = self.TotalMatchesArr;

            for( int i=0;i<ReqTeamArray.count;i++)
            {
                NSString *selectedTeamCodeA = [[ReqTeamArray valueForKey:@"TeamACode"] objectAtIndex:i];
                NSString *selectedTeamCodeB = [[ReqTeamArray valueForKey:@"TeamBCode"] objectAtIndex:i];
                NSString *GlobalteamCode = [AppCommon getCurrentTeamCode];
                if([Teamcode isEqualToString:selectedTeamCodeA] || [Teamcode isEqualToString:selectedTeamCodeB])
                {
                    [self.resultArr addObject:[ReqTeamArray objectAtIndex:i]];
                }
                //                else if([Teamcode isEqualToString:selectedTeamCodeB])
                //                {
                //                    [self.resultArr addObject:[ReqTeamArray objectAtIndex:i]];
                //                }
            }


        }

        //SelectedResultsArray =[NSMutableArray new];
        //SelectedResultsArray = self.resultArr;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.ListTbl reloadData];
        });
    }
}


-(IBAction)didClickBackBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)didClickCompetetion:(id)sender
{
    /*
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
     */
    
    DropDownTableViewController* dropVC = [[DropDownTableViewController alloc] init];
    dropVC.protocol = self;
    dropVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    dropVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [dropVC.view setBackgroundColor:[UIColor clearColor]];
    
    if ([sender tag] == 1) { // TEAM
        
        dropVC.array = [COMMON getCorrespondingTeamName:self.competitionLbl.text];
        dropVC.key = @"TeamName";
        if (IS_IPAD) {
            [dropVC.tblDropDown setFrame:CGRectMake(CGRectGetMinX(self.v2.frame), CGRectGetMaxY(self.v2.superview.frame), CGRectGetWidth(self.v2.frame), 300)];
        } else {
            [dropVC.tblDropDown setFrame:CGRectMake(CGRectGetMinX(self.v2.frame), CGRectGetMaxY(self.v2.superview.frame)+20, CGRectGetWidth(self.v2.frame), 300)];
        }
    }
    else // COMPETETION
    {
        dropVC.array = appDel.ArrayCompetition;
        dropVC.key = @"CompetitionName";
        if (IS_IPAD) {
            [dropVC.tblDropDown setFrame:CGRectMake(CGRectGetMinX(self.v1.frame), CGRectGetMaxY(self.v1.superview.frame), CGRectGetWidth(self.v1.frame), 300)];
        } else {
            [dropVC.tblDropDown setFrame:CGRectMake(CGRectGetMinX(self.v1.frame), CGRectGetMaxY(self.v1.superview.frame)+20, CGRectGetWidth(self.v1.frame), 300)];
        }
    }
    
    //    [appDel.frontNavigationController presentViewController:dropVC animated:YES completion:^{
    //        NSLog(@"DropDown loaded");
    //    }];
    
    [self.navigationController presentViewController:dropVC animated:YES completion:nil];
}

-(void)selectedValue:(NSMutableArray *)array andKey:(NSString*)key andIndex:(NSIndexPath *)Index
{
    if ([key isEqualToString: @"CompetitionName"]) {
        
        NSLog(@"%@",array[Index.row]);
        NSLog(@"selected value %@",key);
        self.competitionLbl.text = [[array objectAtIndex:Index.row] valueForKey:key];
        NSString* Competetioncode = [[array objectAtIndex:Index.row] valueForKey:@"CompetitionCode"];
        CompetionCode = [[array objectAtIndex:Index.row] valueForKey:@"CompetitionCode"];
        [[NSUserDefaults standardUserDefaults] setValue:self.competitionLbl.text forKey:@"SelectedCompetitionName"];
        [[NSUserDefaults standardUserDefaults] setValue:Competetioncode forKey:@"SelectedCompetitionCode"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        self.Teamnamelbl.text = @"Team Name";
        [self ResultsWebservice];
        
    } else {
        self.Teamnamelbl.text = [[array objectAtIndex:Index.row] valueForKey:key];
        Teamcode = [[array objectAtIndex:Index.row] valueForKey:@"TeamCode"];
        
        [[NSUserDefaults standardUserDefaults] setValue:self.Teamnamelbl.text forKey:@"SelectedTeamName"];
        [[NSUserDefaults standardUserDefaults] setValue:Teamcode forKey:@"SelectedTeamCode"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    [self setFilterResults];
}


@end
