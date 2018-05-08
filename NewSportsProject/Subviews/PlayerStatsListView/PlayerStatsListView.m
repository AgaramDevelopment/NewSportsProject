//
//  PlayerStatsListView.m
//  NewSportsProject
//
//  Created by Mac on 27/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "PlayerStatsListView.h"
#import "Config.h"

@interface PlayerStatsListView ()
{
    NSArray *titleArray;
    NSArray *valuesArray;
}

@property (nonatomic,strong) IBOutlet NSLayoutConstraint * colorlblXposition;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint * colorlblXWidth;
@end

@implementation PlayerStatsListView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    titleArray = [NSArray arrayWithObjects:@"Matches",@"Innings",@"Runs",@"High Score",@"Average",@"Strike Rate",@"100s",@"200s",@"50s",@"4s",@"6s", nil];
    valuesArray = [NSArray arrayWithObjects:@"53",@"49",@"1878",@"90",@"53.66",@"136.98",@"0",@"0",@"17",@"199",@"38", nil];
    
    self.headerView.layer.cornerRadius = 5;
    self.headerView.layer.masksToBounds = true;
    self.headerView.layer.borderColor = [UIColor colorWithRed:(24/255.0f) green:(40/255.0f) blue:(126/255.0f) alpha:1.0f].CGColor;
    self.headerView.layer.borderWidth = 1.0f;
    
   // self.colorlblXWidth.constant = self.t20.frame.size.width;
    [self.t20 sendActionsForControlEvents:UIControlEventTouchUpInside];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
        
        static NSString *MyIdentifier = @"MyIdentifier";
        
        
        
        PlayerStatsListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
        if (cell == nil)
        {
            // cell = [[PointsTableCell alloc] initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:MyIdentifier];
            
            if(IS_IPHONE_DEVICE)
            {
                [[NSBundle mainBundle] loadNibNamed:@"PlayerStatsListViewCell_iPhone" owner:self options:nil];
            }
            else
            {
                [[NSBundle mainBundle] loadNibNamed:@"PlayerStatsListViewCell_iPad" owner:self options:nil];
            }
        }
        
        cell = self.objCell;
    
    cell.title.text = titleArray[indexPath.row];
    cell.value.text= valuesArray[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        
        
        return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}


-(IBAction)didClickt20Btn:(id)sender
{
    
    [self setInningsBySelection:@"1"];
//    self.colorlblXposition.constant = self.t20.frame.origin.x;
//    self.colorlblXWidth.constant = self.t20.frame.size.width;
    
}

-(IBAction)didClickodiBtn:(id)sender
{
   
    [self setInningsBySelection:@"2"];
//    self.colorlblXposition.constant = self.odi.frame.origin.x;
//    self.colorlblXWidth.constant = self.odi.frame.size.width;
    
}

-(IBAction)didClicktestmatchBtn:(id)sender
{
    [self setInningsBySelection:@"3"];
//    self.colorlblXposition.constant = self.testmatch.frame.origin.x;
//    self.colorlblXWidth.constant = self.testmatch.frame.size.width;
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
