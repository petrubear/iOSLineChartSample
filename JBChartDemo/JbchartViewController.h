//
//  ViewController.h
//  JBChartDemo
//
//  Created by Edison Martinez on 2/13/14.
//  Copyright (c) 2014 Cronix cia. ltda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBLineChartView.h"

@interface JbchartViewController : UIViewController <JBLineChartViewDelegate, JBLineChartViewDataSource>
@property (nonatomic, strong) JBLineChartView *lineChartView;
@property (nonatomic, strong) NSMutableArray *chartData;
@end
