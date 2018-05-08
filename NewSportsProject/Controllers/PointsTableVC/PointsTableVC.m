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
        
        
        
        PointsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
        if (cell == nil)
        {
            // cell = [[PointsTableCell alloc] initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:MyIdentifier];
            
            if(IS_IPHONE_DEVICE)
            {
                [[NSBundle mainBundle] loadNibNamed:@"PointsTableCell_iPhone" owner:self options:nil];
            }
            else
            {
                [[NSBundle mainBundle] loadNibNamed:@"PointsTableCell_iPad" owner:self options:nil];
            }
        }
        
        cell = self.objCell;
        int num = indexPath.row+1;
        cell.Position.text = [NSString stringWithFormat:@"%d",num];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell = self.objsubcell;
        
        // cell.textLabel.text = self.playername[indexPath.row];
        
        //cell.textColor = [UIColor whiteColor];
        
        return cell;
    }
    
    return nil;
    
}



-(IBAction)didClickBackBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
