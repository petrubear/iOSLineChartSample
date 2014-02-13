//
//  LinechartViewController.m
//  JBChartDemo
//
//  Created by Edison Martinez on 2/13/14.
//  Copyright (c) 2014 Cronix cia. ltda. All rights reserved.
//

#import "LinechartViewController.h"

@interface LinechartViewController ()

@end

@implementation LinechartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.

	[self setChart];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)setChart {
	//Set chart Data
	LCLineChartData *dataGlucosa = [self getGlucosaChartData];
	LCLineChartData *dataPresionSis = [self getPresionSisChartData];
	LCLineChartData *dataPresionDia = [self getPresionDiaChartData];

	//Set Chart
	LCLineChartView *chartView = [[LCLineChartView alloc] initWithFrame:CGRectMake(
	                                  10.0f, 10.0f,
	                                  self.view.bounds.size.width - 20.0f,
	                                  250.0f)];

	chartView.yMin = 0;
	chartView.yMax = 250;
	chartView.ySteps = @[@"0.0",
	                     [NSString stringWithFormat:@"%.1f", chartView.yMax / 2],
	                     [NSString stringWithFormat:@"%.1f", chartView.yMax]];
	chartView.data = @[dataGlucosa, dataPresionSis, dataPresionDia];

	[self.view addSubview:chartView];
}

- (LCLineChartData *)getGlucosaChartData {
	LCLineChartData *dataGlucosa = [LCLineChartData new];
	dataGlucosa.xMin = 1;
	dataGlucosa.xMax = 10;
	dataGlucosa.title = @"Glucosa";
	dataGlucosa.color = [UIColor colorWithRed:132 / 255.0f green:84 / 255.0f blue:191 / 255.0f alpha:1.0f];
	dataGlucosa.itemCount = 10;

	NSMutableArray *valuesGlucosa = [NSMutableArray new];
	[valuesGlucosa addObject:[NSNumber numberWithInt:120]];
	[valuesGlucosa addObject:[NSNumber numberWithInt:210]];
	[valuesGlucosa addObject:[NSNumber numberWithInt:220]];
	[valuesGlucosa addObject:[NSNumber numberWithInt:180]];
	[valuesGlucosa addObject:[NSNumber numberWithInt:230]];
	[valuesGlucosa addObject:[NSNumber numberWithInt:70]];
	[valuesGlucosa addObject:[NSNumber numberWithInt:120]];
	[valuesGlucosa addObject:[NSNumber numberWithInt:160]];
	[valuesGlucosa addObject:[NSNumber numberWithInt:180]];
	[valuesGlucosa addObject:[NSNumber numberWithInt:220]];
	/*[values sortUsingComparator: ^NSComparisonResult (id obj1, id obj2) {
	   return [obj1 compare:obj2];
	   }];*/

	dataGlucosa.getData = ^(NSUInteger item) {
		float y = [valuesGlucosa[item] floatValue];
		float x = item; //powf(2, x / 7);
		NSString *label1 = [NSString stringWithFormat:@"%d", item];
		NSString *label2 = [NSString stringWithFormat:@"%.1f", y];

		return [LCLineChartDataItem dataItemWithX:x y:y xLabel:label1 dataLabel:label2];
	};

	return dataGlucosa;
}

- (LCLineChartData *)getPresionSisChartData {
	LCLineChartData *dataPresionSis = [LCLineChartData new];
	dataPresionSis.xMin = 1;
	dataPresionSis.xMax = 10;
	dataPresionSis.title = @"Presion Sistolica";
	dataPresionSis.color = [UIColor colorWithRed:6 / 255.0f green:133 / 255.0f blue:245 / 255.0f alpha:1.0f];
	dataPresionSis.itemCount = 10;

	NSMutableArray *valuesPsis = [NSMutableArray new];
	[valuesPsis addObject:[NSNumber numberWithInt:110]];
	[valuesPsis addObject:[NSNumber numberWithInt:120]];
	[valuesPsis addObject:[NSNumber numberWithInt:140]];
	[valuesPsis addObject:[NSNumber numberWithInt:130]];
	[valuesPsis addObject:[NSNumber numberWithInt:120]];
	[valuesPsis addObject:[NSNumber numberWithInt:110]];
	[valuesPsis addObject:[NSNumber numberWithInt:150]];
	[valuesPsis addObject:[NSNumber numberWithInt:160]];
	[valuesPsis addObject:[NSNumber numberWithInt:130]];
	[valuesPsis addObject:[NSNumber numberWithInt:130]];
	/*[values sortUsingComparator: ^NSComparisonResult (id obj1, id obj2) {
	   return [obj1 compare:obj2];
	   }];*/

	dataPresionSis.getData = ^(NSUInteger item) {
		float y = [valuesPsis[item] floatValue];
		float x = item; //powf(2, x / 7);
		NSString *label1 = [NSString stringWithFormat:@"%d", item];
		NSString *label2 = [NSString stringWithFormat:@"%.1f", y];

		return [LCLineChartDataItem dataItemWithX:x y:y xLabel:label1 dataLabel:label2];
	};

	return dataPresionSis;
}

- (LCLineChartData *)getPresionDiaChartData {
	LCLineChartData *dataPresionDia = [LCLineChartData new];
	dataPresionDia.xMin = 1;
	dataPresionDia.xMax = 10;
	dataPresionDia.title = @"Presion Diastolica";
	dataPresionDia.color = [UIColor colorWithRed:162 / 255.0f green:44 / 255.0f blue:120 / 255.0f alpha:1.0f];
	dataPresionDia.itemCount = 10;

	NSMutableArray *valuesPsis = [NSMutableArray new];
	[valuesPsis addObject:[NSNumber numberWithInt:80]];
	[valuesPsis addObject:[NSNumber numberWithInt:82]];
	[valuesPsis addObject:[NSNumber numberWithInt:70]];
	[valuesPsis addObject:[NSNumber numberWithInt:85]];
	[valuesPsis addObject:[NSNumber numberWithInt:60]];
	[valuesPsis addObject:[NSNumber numberWithInt:83]];
	[valuesPsis addObject:[NSNumber numberWithInt:80]];
	[valuesPsis addObject:[NSNumber numberWithInt:78]];
	[valuesPsis addObject:[NSNumber numberWithInt:63]];
	[valuesPsis addObject:[NSNumber numberWithInt:90]];
	/*[values sortUsingComparator: ^NSComparisonResult (id obj1, id obj2) {
	   return [obj1 compare:obj2];
	   }];*/

	dataPresionDia.getData = ^(NSUInteger item) {
		float y = [valuesPsis[item] floatValue];
		float x = item; //powf(2, x / 7);
		NSString *label1 = [NSString stringWithFormat:@"%d", item];
		NSString *label2 = [NSString stringWithFormat:@"%.1f", y];

		return [LCLineChartDataItem dataItemWithX:x y:y xLabel:label1 dataLabel:label2];
	};

	return dataPresionDia;
}

@end
