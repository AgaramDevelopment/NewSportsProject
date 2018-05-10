//
//  PointsTableVC.m
//  NewSportsProject
//
//  Created by Mac on 20/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "PointsTableVC.h"
#import "CustomNavigation.h"
#import "Config.h"

@interface PointsTableVC ()
{
    BOOL isPop;
    BOOL isList;
}
@property (nonatomic,strong) IBOutlet NSLayoutConstraint * popXposition;

@property (nonatomic,strong) IBOutlet NSLayoutConstraint * popWidth;
@end

@implementation PointsTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customnavigationmethod];
    
    self.ShawdowView.clipsToBounds = NO;
    self.ShawdowView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.ShawdowView.layer.shadowOffset = CGSizeMake(0,5);
    self.ShawdowView.layer.shadowOpacity = 0.5;
    
    isList = YES;
    
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
    objCustomNavigation.tittle_lbl.text=@"POINTS TABLE";
    
    if([objCustomNavigation.tittle_lbl.text isEqualToString: @""])
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withoutText"];
    }
    else
    {
        objCustomNavigation.nav_header_img.image = [UIImage imageNamed:@"withText"];
    }

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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isList)
    {
        return self.PointsArray.count;
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
        
        PointsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
        if (cell == nil)
        {
            // cell = [[PointsTableCell alloc] initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:MyIdentifier];
            
//            if(IS_IPHONE_DEVICE)
//            {
//                [[NSBundle mainBundle] loadNibNamed:@"PointsTableCell_iPhone" owner:self options:nil];
//            }
//            else
//            {
                [[NSBundle mainBundle] loadNibNamed:@"PointsTableCell_iPad" owner:self options:nil];
           // }
        }
        
        cell = self.objCell;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.TeamName.text = [[self.PointsArray valueForKey:@"TEAMSHORTNAME"] objectAtIndex:indexPath.row];
        cell.Played.text = [[self.PointsArray valueForKey:@"MATCHPLAYED"] objectAtIndex:indexPath.row];
        cell.Won.text = [[self.PointsArray valueForKey:@"WON"] objectAtIndex:indexPath.row];
        cell.Lost.text = [[self.PointsArray valueForKey:@"LOST"] objectAtIndex:indexPath.row];
        cell.Tied.text = [[self.PointsArray valueForKey:@"TIED"] objectAtIndex:indexPath.row];
        cell.NoResult.text = [[self.PointsArray valueForKey:@"NORESULT"] objectAtIndex:indexPath.row];
        cell.NetRR.text = [[self.PointsArray valueForKey:@"NETRUNRATE"] objectAtIndex:indexPath.row];
        cell.Points.text = [[self.PointsArray valueForKey:@"POINTS"] objectAtIndex:indexPath.row];
        
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
        
        
        return cell;
    }
    
    return nil;
    
}



-(IBAction)didClickBackBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
