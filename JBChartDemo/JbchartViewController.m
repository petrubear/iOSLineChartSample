//
//  ViewController.m
//  JBChartDemo
//
//  Created by Edison Martinez on 2/13/14.
//  Copyright (c) 2014 Cronix cia. ltda. All rights reserved.
//

#import "JbchartViewController.h"


@interface JbchartViewController ()

@end

@implementation JbchartViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self setSampleData];
	//self.view.backgroundColor = [UIColor lightGrayColor];
	self.lineChartView = [[JBLineChartView alloc] initWithFrame:CGRectMake(
	                          10.0f, 10.0f,
	                          self.view.bounds.size.width - 20.0f,
	                          250.0f)];
	self.lineChartView.delegate = self;
	self.lineChartView.dataSource = self;
	//self.lineChartView.backgroundColor = [UIColor grayColor];
	[self.view addSubview:self.lineChartView];
	[self.lineChartView reloadData];
}

- (void)setSampleData {
	self.chartData = [NSMutableArray array];
	[self.chartData addObject:[NSNumber numberWithInt:100]];
	[self.chartData addObject:[NSNumber numberWithInt:120]];
	[self.chartData addObject:[NSNumber numberWithInt:150]];
	[self.chartData addObject:[NSNumber numberWithInt:10]];
	[self.chartData addObject:[NSNumber numberWithInt:90]];
	[self.chartData addObject:[NSNumber numberWithInt:130]];
	[self.chartData addObject:[NSNumber numberWithInt:10]];
	[self.chartData addObject:[NSNumber numberWithInt:80]];
	[self.chartData addObject:[NSNumber numberWithInt:100]];
	[self.chartData addObject:[NSNumber numberWithInt:130]];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfPointsInLineChartView:(JBLineChartView *)lineChartView {
	return [self.chartData count]; // number of points in chart
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView heightForIndex:(NSInteger)index {
	return [[self.chartData objectAtIndex:index] floatValue];  // y-position of poinnt at index (x-axis)
}

- (UIColor *)lineColorForLineChartView:(JBLineChartView *)lineChartView {
	return [UIColor purpleColor];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.lineChartView setState:JBChartViewStateExpanded animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.lineChartView setState:JBChartViewStateCollapsed];
}

@end
