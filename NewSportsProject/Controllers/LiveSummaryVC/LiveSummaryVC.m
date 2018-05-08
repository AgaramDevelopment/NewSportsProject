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

@interface LiveSummaryVC ()

@end

@implementation LiveSummaryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customnavigationmethod];
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
    
    
    UIBezierPath *path1 = [UIBezierPath new];
    
    [path1 moveToPoint:(CGPoint){self.Blbl.frame.size.width-15,0 }];//w0
    [path1 addLineToPoint:(CGPoint){0, 0}];//00
    [path1 addLineToPoint:(CGPoint){15,self.Blbl.frame.size.height }];//0h
    [path1 addLineToPoint:(CGPoint){self.Blbl.frame.size.width, self.Blbl.frame.size.height}];//wh20
    
    CAShapeLayer *mask1 = [CAShapeLayer new];
    mask1.frame = self.Blbl.bounds;
    mask1.path = path1.CGPath;
    self.Blbl.layer.mask = mask1;
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
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    LiveSummaryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    return cell;
    
}

@end
