//
//  OverviewPlayer.m
//  NewSportsProject
//
//  Created by Mac on 24/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "OverviewPlayer.h"
#import "Config.h"

@interface OverviewPlayer ()
{
    NSArray *titleArray;
    NSArray *valuesArray;
}

@property (nonatomic,strong) IBOutlet NSLayoutConstraint * colorlblXposition;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint * colorlblXWidth;
@end

@implementation OverviewPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    titleArray = [NSArray arrayWithObjects:@"National Team",@"Age",@"Date of Birth",@"Weight",@"height",@"Role",@"Batting Style",@"Bowling Style", nil];
    valuesArray = [NSArray arrayWithObjects:@"India",@"28",@"5 Nvember 1988",@"69kg",@"1.75 m",@"Batsman",@"Right Handed Bat",@"Right-arm Medium", nil];
    
    
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

@end
