//
//  FilterNavigation.m
//  NewSportsProject
//
//  Created by Mac on 18/11/17.
//  Copyright © 2017 agaraminfotech. All rights reserved.
//

#import "FilterNavigation.h"

@interface FilterNavigation ()

@end

@implementation FilterNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.view.frame)-10)];

    UIBezierPath *path = [UIBezierPath new];
    
    [path moveToPoint:(CGPoint){self.v1.frame.size.width,0 }];//w0
    [path addLineToPoint:(CGPoint){0, 0}];//00
    [path addLineToPoint:(CGPoint){0,self.v1.frame.size.height }];//0h
    [path addLineToPoint:(CGPoint){self.v1.frame.size.width-25, self.v1.frame.size.height}];//wh20
    
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = self.v1.bounds;
    mask.path = path.CGPath;
    self.v1.layer.mask = mask;
//
//    
    UIBezierPath *path1 = [UIBezierPath new];
    
    [path1 moveToPoint:(CGPoint){self.v2.frame.size.width,0 }];//w0
    [path1 addLineToPoint:(CGPoint){25, 0}];//00
    [path1 addLineToPoint:(CGPoint){0,self.v2.frame.size.height }];//0h
    [path1 addLineToPoint:(CGPoint){self.v2.frame.size.width, self.v2.frame.size.height}];//wh20
    
    CAShapeLayer *mask1 = [CAShapeLayer new];
    mask1.frame = self.v2.bounds;
    mask1.path = path1.CGPath;
    self.v2.layer.mask = mask1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
