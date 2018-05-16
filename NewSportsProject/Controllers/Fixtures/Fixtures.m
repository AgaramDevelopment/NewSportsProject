//
//  Fixtures.m
//  NewSportsProject
//
//  Created by Mac on 16/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "Fixtures.h"
#import "CustomNavigation.h"
#import "Config.h"
#import "AdvanceFilter.h"
#import "AppCommon.h"
#import "WebService.h"
@import SDWebImage;


@interface Fixtures ()
{
    BOOL isPop;
    BOOL isList;
    NSMutableArray *objarray;
    NSMutableArray * popArray;
}

@property (nonatomic,strong) IBOutlet NSLayoutConstraint * popXposition;

@property (nonatomic,strong) IBOutlet NSLayoutConstraint * popWidth;

@end

@implementation Fixtures

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customnavigationmethod];
    
    
    self.ShawdowView.clipsToBounds = NO;
    self.ShawdowView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.ShawdowView.layer.shadowOffset = CGSizeMake(0,5);
    self.ShawdowView.layer.shadowOpacity = 0.5;
    
    isList = YES;
   // self.competitionLbl.text = [[self.fixturesArray valueForKey:@"COMPETITIONNAME"] objectAtIndex:0];
    [self FixturesWebservice];

    
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
    objCustomNavigation.tittle_lbl.text=@"FIXTURES";
    
    if([objCustomNavigation.tittle_lbl.text isEqualToString: @""])
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withoutText"];
    }
    else
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withText"];
    }
    if([self.backKey isEqualToString:@"yes"])
    {
    objCustomNavigation.btn_back.hidden = NO;
    }
    else
    {
        objCustomNavigation.btn_back.hidden = YES;
    }
    objCustomNavigation.summarybtn.hidden=YES;
    objCustomNavigation.filter_btn.hidden = NO;
    objCustomNavigation.Cancelbtn.hidden = YES;
    [objCustomNavigation.btn_back addTarget:self action:@selector(didClickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [objCustomNavigation.filter_btn addTarget:self action:@selector(didClickFilterBtn:) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)didClickCompetetion:(id)sender
{
    
    if(isPop==NO)
    {
    self.popTbl.hidden = NO;
        [self.ListTbl setUserInteractionEnabled:NO];
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
        [self.ListTbl setUserInteractionEnabled:YES];
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isList)
    {
    return objarray.count;
    }
    else
    {
        return popArray.count;
    }
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(isList)
    {
    
    static NSString *MyIdentifier = @"MyIdentifier";
    
    FixturesCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil)
    {
        // cell = [[PointsTableCell alloc] initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:MyIdentifier];
        
//        if(IS_IPHONE_DEVICE)
//        {
//            [[NSBundle mainBundle] loadNibNamed:@"FixturesCell_iPhone" owner:self options:nil];
//        }
//        else
//        {
        [[NSBundle mainBundle] loadNibNamed:@"FixturesCell_iPad" owner:self options:nil];
        //}
    }
    
    cell = self.objCell;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell = self.objsubcell;
    
    // cell.textLabel.text = self.playername[indexPath.row];
    
    //cell.textColor = [UIColor whiteColor];
        
        cell.date.text = [[objarray valueForKey:@"date"] objectAtIndex:indexPath.row];
        cell.time.text = [[objarray valueForKey:@"time"] objectAtIndex:indexPath.row];
        cell.groundName.text = [[objarray valueForKey:@"ground"] objectAtIndex:indexPath.row];
        cell.team1.text = [[objarray valueForKey:@"team1"] objectAtIndex:indexPath.row];
        cell.team2.text = [[objarray valueForKey:@"team2"] objectAtIndex:indexPath.row];
        
        [cell.team1Img sd_setImageWithURL:[NSURL URLWithString: [self checkNull:[[objarray valueForKey:@"TeamALogo"] objectAtIndex:indexPath.row]]] placeholderImage:[UIImage imageNamed:@"no-image"]];
        [cell.team2Img sd_setImageWithURL:[NSURL URLWithString: [self checkNull:[[objarray valueForKey:@"TeamBLogo"] objectAtIndex:indexPath.row]]] placeholderImage:[UIImage imageNamed:@"no-image"]];
        
//        NSString *key = [[objarray valueForKey:@"team1"] objectAtIndex:indexPath.row];
//
//        if([ key isEqualToString:@"India"])
//        {
//           cell.team1Img.image = [UIImage imageNamed:@""];
//           cell.team2Img.image = [UIImage imageNamed:@""];
//
//        }
//        else
//        {
//            cell.team1Img.image = [UIImage imageNamed:@""];
//            cell.team2Img.image = [UIImage imageNamed:@""];
//        }

    
    return cell;
    }
    if(isPop==YES)
    {
        
        
        static NSString *MyIdentifier = @"MyIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:nil];
        }
        
        cell.textLabel.text = [[popArray valueForKey:@"COMPETITIONNAME"] objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font=[UIFont fontWithName:@"Montserrat" size:15.0];
        return cell;
        
    }

    
    
    return nil;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(isPop==YES)
    {
        self.competitionLbl.text = [[popArray valueForKey:@"COMPETITIONNAME"]objectAtIndex:indexPath.row];
        
        isList = YES;
        isPop =NO;
        [self FixturesWebservice];
        self.popTbl.hidden =YES;
        [self.ListTbl setUserInteractionEnabled:YES];
    }
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

-(void)FixturesWebservice
{
    //[COMMON loadingIcon:self.view];
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
                objarray = [[NSMutableArray alloc]init];
                NSMutableArray * fixArr = [[NSMutableArray alloc]init];
                fixArr = [responseObject valueForKey:@"lstFixturesGridValues"];
                if(fixArr.count >0)
                {
                self.competitionLbl.text = [[fixArr valueForKey:@"COMPETITIONNAME"] objectAtIndex:0];
                
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
                
                popArray = [[NSMutableArray alloc]init];
                popArray = [responseObject valueForKey:@"lstCompetitionVal"];
                
                [self.ListTbl reloadData];

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


-(IBAction)didClickBackBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)didClickFilterBtn:(id)sender
{
    AdvanceFilter * objFix = [[AdvanceFilter alloc]init];
    objFix = (AdvanceFilter *)[self.storyboard instantiateViewControllerWithIdentifier:@"AdvanceFilter"];
    [self.navigationController pushViewController:objFix animated:YES];
}

@end
