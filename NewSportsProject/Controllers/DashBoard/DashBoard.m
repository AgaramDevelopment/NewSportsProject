//
//  DashBoard.m
//  NewSportsProject
//
//  Created by Mac on 13/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "DashBoard.h"
#import "CustomNavigation.h"
#import "PagerViewDmeoController.h"

#import "FixtureView.h"

#import "Config.h"
#import "Fixtures.h"
#import "ResultsVc.h"
#import "PointsTableVC.h"
#import "TeamsVC.h"
#import "AppCommon.h"
#import "WebService.h"
#import "ScoreCardVC.h"
#import "AppDelegate.h"
@import SDWebImage;





@interface DashBoard () <SwipeViewDataSource, SwipeViewDelegate>
{
    
    
    
    UIImageView * gallary_img;
    NSMutableArray * frontImg;
    
    NSString *objkey;
    NSMutableArray *sendkeyArray;
    
    
    NSMutableArray *fixArr;
    NSUInteger cc;
    
    
    NSMutableArray *objarray;
    FixtureView *Fix;
    
    NSString *displayMatchCode;
    
    
    
    NSMutableArray *scoreArray;
    
    AppDelegate* Appobj;
    
}

@property (nonatomic, weak) IBOutlet SwipeView *swipeView;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint * imgWidth1;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint * imgWidth2;


@property (nonatomic,strong) NSMutableArray * resultsArray;
@property (nonatomic,strong) NSMutableArray * pointsTableArray;


@end

@implementation DashBoard



- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
    [self FixturesWebservice];
    
//    self.items = [NSMutableArray array];
//    for (int i = 0; i < cc; i++)
//    {
//        [_items addObject:@(i)];
//    }
    
//    [self.page_control addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
//    NSUInteger pageCount =self.items.count;
//    self.page_control.numberOfPages =pageCount;
//    [NSTimer scheduledTimerWithTimeInterval:3.5
//                                     target:self
//                                   selector:@selector(pageChanged)
//                                   userInfo:nil
//                                    repeats:YES];

    
}

- (void)dealloc
{
    _swipeView.delegate = nil;
    _swipeView.dataSource = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultsArray = [[NSMutableArray alloc]init];
    self.pointsTableArray = [[NSMutableArray alloc]init];
    [self customnavigationmethod];
    
    //[self FixturesWebservice];
    [self ResultsWebservice];
    
    Appobj = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    
//    self.items = [NSMutableArray array];
//    for (int i = 0; i < cc; i++)
//    {
//        [_items addObject:@(i)];
//    }
//
    
    _swipeView.pagingEnabled = YES;
//       [self.page_control addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
//    NSUInteger pageCount =self.items.count;
//    self.page_control.numberOfPages =pageCount;
//    [NSTimer scheduledTimerWithTimeInterval:3.5
//                                     target:self
//                                   selector:@selector(pageChanged)
//                                   userInfo:nil
//                                    repeats:YES];
    
    self.img1.layer.masksToBounds = true;
    self.img1.clipsToBounds = true;
    self.img1.layer.cornerRadius = self.img1.frame.size.width/2;
    self.img2.layer.masksToBounds = true;
    self.img2.clipsToBounds = true;
    self.img2.layer.cornerRadius = self.img1.frame.size.width/2;
    
    
    //Assign Data for Season Table Properies
    
    if (IS_IPAD) {
        self.teamLbl.text = @"Team";
        self.playedLbl.text = @"Played";
        self.wonLbl.text = @"Won";
        self.lostLbl.text = @"Lost";
        self.tiedLbl.text = @"Tied";
        self.noResultLbl.text = @"No Result";
        self.netRunRateLbl.text = @"Net RR";
        self.pointsLbl.text = @"Points";
    } else {
        self.teamLbl.text = @"T";
        self.playedLbl.text = @"P";
        self.wonLbl.text = @"W";
        self.lostLbl.text = @"L";
        self.tiedLbl.text = @"T";
        self.noResultLbl.text = @"NR";
        self.netRunRateLbl.text = @"NRR";
        self.pointsLbl.text = @"P";
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!appDel.MainArray.count) {
        [COMMON getIPLteams];
    }
}
-(IBAction)didClickBtn:(id)sender
{
    
    Fixtures * objFix = [[Fixtures alloc]init];
    objFix = (Fixtures *)[self.storyboard instantiateViewControllerWithIdentifier:@"Fixtures"];
    objFix.backKey = @"yes";
    objFix.fixturesArray = objarray;
    [self.navigationController pushViewController:objFix animated:YES];
}

-(IBAction)didClickViewResults:(id)sender
{
    ResultsVc * objFix = [[ResultsVc alloc]init];
    objFix = (ResultsVc *)[self.storyboard instantiateViewControllerWithIdentifier:@"ResultsVc"];
    objFix.listCompArray = sendkeyArray;
    objFix.backKey = @"yes";
    [self.navigationController pushViewController:objFix animated:YES];
}

-(IBAction)didClickViewTable:(id)sender
{
    PointsTableVC * objFix = [[PointsTableVC alloc]init];
    objFix = (PointsTableVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"PointsTableVC"];
    objFix.PointsArray = self.pointsTableArray;
    objFix.backKey = @"yes";
    [self.navigationController pushViewController:objFix animated:YES];
}

-(IBAction)didClickTeams:(id)sender
{
    TeamsVC * objFix = [[TeamsVC alloc]init];
    objFix = (TeamsVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"TeamsVC"];
    [self.navigationController pushViewController:objFix animated:YES];
}




- (void)pageChanged {
    int pageNumber = self.swipeView.currentPage;
    
    int nextItem = pageNumber + 1;
        if (nextItem == self.items.count) {
            nextItem=0;
           // [self.swipeView scrollToPage:nextItem duration:3];
        }
    
   [self.swipeView scrollToPage:nextItem duration:1];
    

  
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
    
    
    objCustomNavigation.btn_back.hidden = YES;
    objCustomNavigation.filter_btn.hidden = YES;
    objCustomNavigation.Cancelbtn.hidden = YES;
    objCustomNavigation.summarybtn.hidden=YES;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.pointsTableArray.count;
    if(self.pointsTableArray.count==0)
    {
        return 0;
    }
    else
    {
    return 4;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *MyIdentifier = @"MyIdentifier";
    
    
    
    PointsTableCell *cell = [self.PointsTable dequeueReusableCellWithIdentifier:nil];
    if (cell == nil)
    {
        // cell = [[PointsTableCell alloc] initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:MyIdentifier];
        
//        if(IS_IPHONE_DEVICE)
//        {
//            [[NSBundle mainBundle] loadNibNamed:@"PointsTableCell_iPhone" owner:self options:nil];
//        }
//        else
        //{
            [[NSBundle mainBundle] loadNibNamed:@"PointsTableCell_iPad" owner:self options:nil];
       // }
    }
    cell = self.objCell;

    cell.TeamName.text = [[self.pointsTableArray valueForKey:@"TEAMSHORTNAME"] objectAtIndex:indexPath.row];
    cell.Played.text = [[self.pointsTableArray valueForKey:@"MATCHPLAYED"] objectAtIndex:indexPath.row];
    cell.Won.text = [[self.pointsTableArray valueForKey:@"WON"] objectAtIndex:indexPath.row];
    cell.Lost.text = [[self.pointsTableArray valueForKey:@"LOST"] objectAtIndex:indexPath.row];
    cell.Tied.text = [[self.pointsTableArray valueForKey:@"TIED"] objectAtIndex:indexPath.row];
    cell.NoResult.text = [[self.pointsTableArray valueForKey:@"NORESULT"] objectAtIndex:indexPath.row];
    cell.NetRR.text = [[self.pointsTableArray valueForKey:@"NETRUNRATE"] objectAtIndex:indexPath.row];
    cell.Points.text = [[self.pointsTableArray valueForKey:@"POINTS"] objectAtIndex:indexPath.row];
    
    if([cell.TeamName.text isEqualToString:@" CSK"])
    {
        cell.contentView.backgroundColor = [UIColor yellowColor];
        
        cell.TeamName.textColor = [UIColor redColor];
        cell.Played.textColor = [UIColor redColor];
        cell.Won.textColor = [UIColor redColor];
        cell.Lost.textColor = [UIColor redColor];
        cell.Tied.textColor = [UIColor redColor];
        cell.NoResult.textColor = [UIColor redColor];
        cell.NetRR.textColor = [UIColor redColor];
        cell.Points.textColor = [UIColor redColor];
        
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}






- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    //return the total number of items in the carousel
    return [objarray count];
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
//    if (view == nil)
//    {
        view = [[UIView alloc] initWithFrame:self.swipeView.bounds];
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
//        if(IS_IPHONE_DEVICE)
//        {
//
//
//            Fix = [[FixtureView alloc] initWithNibName:@"FixtureView_iPhone" bundle:nil];
//            Fix.view.frame = CGRectMake(0, 0, self.swipeView.bounds.size.width, self.swipeView.bounds.size.height);
//
//
//            [Fix.btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
//
//
//
//        }
//        else
//        {
                Fix = [[FixtureView alloc] initWithNibName:@"FixtureView" bundle:nil];
                Fix.view.frame = CGRectMake(0, 0, self.swipeView.bounds.size.width, self.swipeView.bounds.size.height);
                
                Fix.datelbl.text = [[objarray valueForKey:@"date"] objectAtIndex:index];
                Fix.timelbl.text = [[objarray valueForKey:@"time"] objectAtIndex:index];
                Fix.groundname.text = [[objarray valueForKey:@"ground"] objectAtIndex:index];
                Fix.team1.text = [[objarray valueForKey:@"team1"] objectAtIndex:index];
                Fix.team2.text = [[objarray valueForKey:@"team2"] objectAtIndex:index];
                
                
                [Fix.team1logo sd_setImageWithURL:[NSURL URLWithString: [self checkNull:[[objarray valueForKey:@"TeamALogo"] objectAtIndex:index]]] placeholderImage:[UIImage imageNamed:@"no-image"]];
                [Fix.team2logo sd_setImageWithURL:[NSURL URLWithString: [self checkNull:[[objarray valueForKey:@"TeamBLogo"] objectAtIndex:index]]] placeholderImage:[UIImage imageNamed:@"no-image"]];
            
            
            
            //NSString *key1 = [[objarray valueForKey:@"team1"] objectAtIndex:index];
            
            if([ Fix.team1.text isEqualToString:@"KKR"])
            {
        
                Fix.team1img.image = [UIImage imageNamed:@"KKR-right"];
                
            }
            else if([ Fix.team1.text isEqualToString:@"MI"])
            {
            
                Fix.team1img.image = [UIImage imageNamed:@"MI-right"];
                
            } else if([ Fix.team1.text isEqualToString:@"RR"])
            {
                Fix.team1img.image = [UIImage imageNamed:@"RR-left"];
                
            } else if([ Fix.team1.text isEqualToString:@"DD"])
            {
                
                Fix.team1img.image = [UIImage imageNamed:@"DD-right"];
                
            } else if([ Fix.team1.text isEqualToString:@"SRH"])
            {
                
                Fix.team1img.image = [UIImage imageNamed:@"SRH-right"];
                
            }
            else if([ Fix.team1.text isEqualToString:@"CSK"])
            {
                Fix.team1img.image = [UIImage imageNamed:@"CSK-left"];
                
            } else if([ Fix.team1.text isEqualToString:@"RCB"])
            {
                Fix.team1img.image = [UIImage imageNamed:@"RCB-left"];
                
            } else if([ Fix.team1.text isEqualToString:@"KXIP"])
            {
                
                Fix.team1img.image = [UIImage imageNamed:@"KXIP-right"];
                
            }
            
            
            
            if([ Fix.team2.text isEqualToString:@"KKR"])
            {
                
                Fix.team2img.image = [UIImage imageNamed:@"KKR-left"];
                
            }
            else if([ Fix.team2.text isEqualToString:@"MI"])
            {
                
                Fix.team2img.image = [UIImage imageNamed:@"MI-left"];
                
            } else if([ Fix.team2.text isEqualToString:@"RR"])
            {
                Fix.team2img.image = [UIImage imageNamed:@"RR-right"];
                
            } else if([ Fix.team2.text isEqualToString:@"DD"])
            {
                
                Fix.team2img.image = [UIImage imageNamed:@"DD-left"];
                
            } else if([ Fix.team2.text isEqualToString:@"SRH"])
            {
                
                Fix.team2img.image = [UIImage imageNamed:@"SRH-left"];
                
            }
            else if([ Fix.team2.text isEqualToString:@"CSK"])
            {
                Fix.team2img.image = [UIImage imageNamed:@"CSK-right"];
                
            } else if([ Fix.team2.text isEqualToString:@"RCB"])
            {
                Fix.team2img.image = [UIImage imageNamed:@"RCB-right"];
                
            } else if([ Fix.team2.text isEqualToString:@"KXIP"])
            {
                
                Fix.team2img.image = [UIImage imageNamed:@"KXIP-left"];
                
            }

    [Fix.btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:Fix.view];

    return view;
}

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    return self.swipeView.bounds.size;
}

- (void)swipeViewDidScroll:(SwipeView *)swipeView
{
    
}
- (void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView
{
    self.page_control.currentPage = self.swipeView.currentItemIndex;
}


-(NSString *)checkNull:(NSString *)_value
{
    if ([_value isEqual:[NSNull null]] || _value == nil || [_value isEqual:@"<null>"]) {
        _value=@"";
    }
    return _value;
}

-(void)ResultsWebservice
{
     //[COMMON loadingIcon:self.view];
    if([COMMON isInternetReachable])
    {
        
        
        NSString *URLString =  [URL_FOR_RESOURCE(@"") stringByAppendingString:[NSString stringWithFormat:@"%@",ResultsKey]];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        manager.requestSerializer = requestSerializer;
        
        
        NSString *competition = @"UCC0000274";
        
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        if(competition)   [dic    setObject:competition     forKey:@"Competitioncode"];
        
        
        NSLog(@"parameters : %@",dic);
        [manager POST:URLString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"response ; %@",responseObject);
            
            if(responseObject >0)
            {
                
                self.resultsArray = [responseObject valueForKey:@"lstFixturesGridValues"];
                
                if(self.resultsArray.count>0)
                {
                NSMutableArray *firstobj = [[NSMutableArray alloc]init];
                
                firstobj = [self.resultsArray objectAtIndex:0];
                
                NSString *dttime = [firstobj valueForKey:@"DateTime"];
                
                displayMatchCode = [firstobj valueForKey:@"MATCHCODE"];
                
                NSArray *components = [dttime componentsSeparatedByString:@" "];
                NSString *day = components[0];
                NSString *monthyear = components[1];
                NSString *time = components[2];
                NSString *local = components[3];
                
                self.resultDate.text = [NSString stringWithFormat:@"%@ %@",day,monthyear];
                self.resulttime.text = [NSString stringWithFormat:@"%@ %@",time,local];
                
                
//                NSString *key = [firstobj valueForKey:@"TeamA"];
//
//                if([ key isEqualToString:@"India"])
//                {
//                    self.img1.image = [UIImage imageNamed:@"Indialogo"];
//                    self.img2.image = [UIImage imageNamed:@"Srilankalogo"];
//
//                    self.resultImg1.image = [UIImage imageNamed:@"Indimage"];
//                    self.resultImg2.image = [UIImage imageNamed:@"Slimage"];
//                }
//                else
//                {
//                    self.img1.image = [UIImage imageNamed:@"Srilankalogo"];
//                    self.img2.image = [UIImage imageNamed:@"Indialogo"];
//
//                    self.resultImg1.image = [UIImage imageNamed:@"Slimage"];
//                    self.resultImg2.image = [UIImage imageNamed:@"Indimage"];
//                }
                    
                    
                    [self.img1 sd_setImageWithURL:[NSURL URLWithString: [self checkNull:[firstobj valueForKey:@"TeamALogo"] ]] placeholderImage:[UIImage imageNamed:@"no-image"]];
                    
                    [self.img2 sd_setImageWithURL:[NSURL URLWithString: [self checkNull:[firstobj valueForKey:@"TeamBLogo"]]] placeholderImage:[UIImage imageNamed:@"no-image"]];
                    
                    if([ [firstobj valueForKey:@"TeamA"] isEqualToString:@"KKR"])
                    {
                        
                        self.resultImg1.image = [UIImage imageNamed:@"KKR-right"];
                        
                    }
                    else if([ [firstobj valueForKey:@"TeamA"] isEqualToString:@"MI"])
                    {
                        
                        self.resultImg1.image = [UIImage imageNamed:@"MI-right"];
                        
                    } else if([ [firstobj valueForKey:@"TeamA"] isEqualToString:@"RR"])
                    {
                        self.resultImg1.image = [UIImage imageNamed:@"RR-left"];
                        
                    } else if([ [firstobj valueForKey:@"TeamA"] isEqualToString:@"DD"])
                    {
                        
                        self.resultImg1.image = [UIImage imageNamed:@"DD-right"];
                        
                    } else if([ [firstobj valueForKey:@"TeamA"] isEqualToString:@"SRH"])
                    {
                        
                        self.resultImg1.image = [UIImage imageNamed:@"SRH-right"];
                        
                    }
                    else if([ [firstobj valueForKey:@"TeamA"] isEqualToString:@"CSK"])
                    {
                        self.resultImg1.image = [UIImage imageNamed:@"CSK-left"];
                        
                    } else if([ [firstobj valueForKey:@"TeamA"] isEqualToString:@"RCB"])
                    {
                        self.resultImg1.image = [UIImage imageNamed:@"RCB-left"];
                        
                    } else if([ [firstobj valueForKey:@"TeamA"] isEqualToString:@"KXIP"])
                    {
                        
                        self.resultImg1.image = [UIImage imageNamed:@"KXIP-right"];
                        
                    }
                    
                    
                    
                    if([ [firstobj valueForKey:@"TeamB"] isEqualToString:@"KKR"])
                    {
                        
                        self.resultImg2.image = [UIImage imageNamed:@"KKR-left"];
                        
                    }
                    else if([ [firstobj valueForKey:@"TeamB"] isEqualToString:@"MI"])
                    {
                        
                        self.resultImg2.image = [UIImage imageNamed:@"MI-left"];
                        
                    } else if([ [firstobj valueForKey:@"TeamB"] isEqualToString:@"RR"])
                    {
                        self.resultImg2.image = [UIImage imageNamed:@"RR-right"];
                        
                    } else if([ [firstobj valueForKey:@"TeamB"] isEqualToString:@"DD"])
                    {
                        
                        self.resultImg2.image = [UIImage imageNamed:@"DD-left"];
                        
                    } else if([ [firstobj valueForKey:@"TeamB"] isEqualToString:@"SRH"])
                    {
                        
                        self.resultImg2.image = [UIImage imageNamed:@"SRH-left"];
                        
                    }
                    else if([ [firstobj valueForKey:@"TeamB"] isEqualToString:@"CSK"])
                    {
                        self.resultImg2.image = [UIImage imageNamed:@"CSK-right"];
                        
                    } else if([ [firstobj valueForKey:@"TeamB"] isEqualToString:@"RCB"])
                    {
                        self.resultImg2.image = [UIImage imageNamed:@"RCB-right"];
                        
                    } else if([ [firstobj valueForKey:@"TeamB"] isEqualToString:@"KXIP"])
                    {
                        
                        self.resultImg2.image = [UIImage imageNamed:@"KXIP-left"];
                        
                    }
                
                
                NSString *ground = [firstobj valueForKey:@"Ground"];
                NSString *place = [firstobj valueForKey:@"GroundCode"];
                self.groundName.text = [NSString stringWithFormat:@"%@,%@",ground,place];
                
            
                if(![[firstobj valueForKey:@"FIRSTINNINGSSCORE"] isEqualToString:@"0 /0 (0.0 Ov)"])
                {
                self.firstInn.text = [firstobj valueForKey:@"FIRSTINNINGSSCORE"];
                }
                
                if(![[firstobj valueForKey:@"SECONDINNINGSSCORE"] isEqualToString:@"0 /0 (0.0 Ov)"])
                {
                self.secondInn.text = [firstobj valueForKey:@"SECONDINNINGSSCORE"];
                }
                
                if(![[firstobj valueForKey:@"THIRDINNINGSSCORE"] isEqualToString:@"0 /0 (0.0 Ov)"])
                {
                self.thirdInn.text = [firstobj valueForKey:@"THIRDINNINGSSCORE"];
                }
                
                if(![[firstobj valueForKey:@"FOURTHINNINGSSCORE"] isEqualToString:@"0 /0 (0.0 Ov)"])
                {
                self.fourthInn.text = [firstobj valueForKey:@"FOURTHINNINGSSCORE"];
                }
                
                self.team1Name.text = [firstobj valueForKey:@"TeamA"];
                self.team2Name.text = [firstobj valueForKey:@"TeamB"];
                
                self.resultDetails.text = [firstobj valueForKey:@"MATCHRESULTORRUNSREQURED"];
                

               
                
                sendkeyArray = [[NSMutableArray alloc]init];
                
                sendkeyArray = [responseObject valueForKey:@"lstCompetitionVal"];
                
               // objkey = [[sendkeyArray valueForKey:@"COMPETITIONNAME"] objectAtIndex:0];
                
                
                scoreArray = [[NSMutableArray alloc]init];
                
                NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                
                
                [dic setValue:self.groundName.text forKey:@"ground"];
                [dic setValue:[firstobj valueForKey:@"TeamA"] forKey:@"team1"];
                [dic setValue:[firstobj valueForKey:@"TeamB"] forKey:@"team2"];
                [dic setValue:[firstobj valueForKey:@"FIRSTINNINGSSCORE"] forKey:@"Inn1Score"];
                [dic setValue:[firstobj valueForKey:@"SECONDINNINGSSCORE"] forKey:@"Inn2Score"];
                [dic setValue:[firstobj valueForKey:@"THIRDINNINGSSCORE"] forKey:@"Inn3Score"];
                [dic setValue:[firstobj valueForKey:@"FOURTHINNINGSSCORE"] forKey:@"Inn4Score"];
                [dic setValue:[firstobj valueForKey:@"MATCHRESULTORRUNSREQURED"] forKey:@"result"];
                [dic setValue:[firstobj valueForKey:@"COMPETITIONNAME"] forKey:@"Competition"];
                
                [scoreArray addObject:dic];

                
                //  Appobj = [[a alloc]init];
               // Appobj = (ScoreCardVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"ScoreCardVC"];
                Appobj.Currentmatchcode = displayMatchCode;
                Appobj.Scorearray = scoreArray;
                Appobj.backkey = @"no";
                //[self.navigationController pushViewController:objFix animated:YES];
                    [self PointsTableWebservice];
            }
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



-(void)FixturesWebservice
{
    [COMMON loadingIcon:self.view];
    if([COMMON isInternetReachable])
    {
        
        NSString *URLString =  [URL_FOR_RESOURCE(@"") stringByAppendingString:[NSString stringWithFormat:@"%@",FixturesKey]];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        manager.requestSerializer = requestSerializer;
        
        
        NSString *competition = @"";
        
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        if(competition)   [dic    setObject:competition     forKey:@"Competitioncode"];
        
        
        NSLog(@"parameters : %@",dic);
        [manager POST:URLString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"response ; %@",responseObject);
            
            if(responseObject >0)
            {
                
                fixArr = [[NSMutableArray alloc]init];
                fixArr = [responseObject valueForKey:@"lstFixturesGridValues"];
                //self.items = [NSMutableArray array];
                
                NSString *currentMatchCode = [[fixArr valueForKey:@"MATCHCODE"] objectAtIndex:0];
            
                appDel.LiveMatchCode = currentMatchCode;
                 cc = fixArr.count;

                [super awakeFromNib];
                
                self.items = [NSMutableArray array];
                for (int i = 0; i < cc; i++)
                {
                    [_items addObject:@(i)];
                }
                
                
                objarray = [[NSMutableArray alloc]init];
                
               NSMutableArray * sepArray = [[NSMutableArray alloc]init];
                
                for(int i=0;i<fixArr.count;i++)
                {
                
                sepArray = [fixArr objectAtIndex:i];
                
                NSString *dttime = [sepArray valueForKey:@"DateTime"];
                
                NSArray *components = [dttime componentsSeparatedByString:@" "];
                NSString *day = components[0];
                NSString *monthyear = components[1];
                NSString *time = components[2];
                NSString *local = components[3];
                
                NSString *realdate = [NSString stringWithFormat:@"%@ %@",day,monthyear];
                NSString *realtime = [NSString stringWithFormat:@"%@ %@",time,local];
                
                NSString *ground = [sepArray valueForKey:@"Ground"];
                NSString *place = [sepArray valueForKey:@"GroundCode"];
               NSString *realGroundname = [NSString stringWithFormat:@"%@,%@",ground,place];
                
                NSString *team1 = [sepArray valueForKey:@"TeamA"];
                NSString *team2 = [sepArray valueForKey:@"TeamB"];

                NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                
                [dic setValue:realdate forKey:@"date"];
                [dic setValue:realtime forKey:@"time"];
                [dic setValue:realGroundname forKey:@"ground"];
               // [dic setValue:realdate forKey:@"date"];
                [dic setValue:team1 forKey:@"team1"];
                [dic setValue:team2 forKey:@"team2"];
                [dic setValue:[sepArray valueForKey:@"TeamALogo"] forKey:@"TeamALogo"];
                [dic setValue:[sepArray valueForKey:@"TeamBLogo"] forKey:@"TeamBLogo"];
                    
                [objarray addObject:dic];
                    
            
                }
                
//                NSString *key = [sepArray valueForKey:@"TeamA"];
//                
//                if([ key isEqualToString:@"India"])
//                {
//                    self.img1.image = [UIImage imageNamed:@"Indialogo"];
//                    self.img2.image = [UIImage imageNamed:@"Srilankalogo"];
//                    
//                    self.resultImg1.image = [UIImage imageNamed:@"Indimage"];
//                    self.resultImg2.image = [UIImage imageNamed:@"Slimage"];
//                }
//                else
//                {
//                    self.img1.image = [UIImage imageNamed:@"Srilankalogo"];
//                    self.img2.image = [UIImage imageNamed:@"Indialogo"];
//                    
//                    self.resultImg1.image = [UIImage imageNamed:@"Slimage"];
//                    self.resultImg2.image = [UIImage imageNamed:@"Indimage"];
//                }
                
                
                
                [self.page_control addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
                NSUInteger pageCount =self.items.count;
                self.page_control.numberOfPages =pageCount;
                [NSTimer scheduledTimerWithTimeInterval:3.5
                                                 target:self
                                               selector:@selector(pageChanged)
                                               userInfo:nil
                                                repeats:YES];
                
                
                //[self viewDidLoad];
                [self.swipeView reloadData];
                
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

-(void)PointsTableWebservice
{
    [COMMON loadingIcon:self.view];
    if([COMMON isInternetReachable])
    {
        
        //NSString *URLString =  [URL_FOR_RESOURCE(@"") stringByAppendingString:[NSString stringWithFormat:@"%@",FixturesKey]];
        
        NSString *URLString = @"http://192.168.0.152:8083/CSK.svc/FETCHCSKPOINTTABLES";
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        AFHTTPRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        manager.requestSerializer = requestSerializer;
        
        
        NSString *YEAR = @"2018";
        
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        if(YEAR)   [dic    setObject:YEAR     forKey:@"YEAR"];
        
        
        NSLog(@"parameters : %@",dic);
        [manager POST:URLString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"response ; %@",responseObject);
            
            if(responseObject >0)
            {
                self.pointsTableArray = [[NSMutableArray alloc]init];
                self.pointsTableArray = [responseObject valueForKey:@"lstPointTable"];
                
                [self.PointsTable reloadData];
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

-(void)valuesCount
{
        self.items = [NSMutableArray array];
        for (int i = 0; i < 2; i++)
        {
            [_items addObject:@(i)];
        }
    
    _swipeView.pagingEnabled = YES;
    
        [self.page_control addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
        NSUInteger pageCount =self.items.count;
        self.page_control.numberOfPages =pageCount;
        [NSTimer scheduledTimerWithTimeInterval:3.5
                                         target:self
                                       selector:@selector(pageChanged)
                                       userInfo:nil
                                        repeats:YES];
    
    
    
}

-(IBAction)didClickResult:(id)sender
{
    ScoreCardVC * objFix = [[ScoreCardVC alloc]init];
    objFix = (ScoreCardVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"ScoreCardVC"];
    objFix.matchCode = displayMatchCode;
    objFix.matchDetails = scoreArray;
    objFix.backkey = @"yes";
    [self.navigationController pushViewController:objFix animated:YES];
}






@end
