//
//  ViewController.m
//  HolaIphone
//
//  Created by Samuel Garcia Anato on 29-07-20.
//  Copyright © 2020 Samuel Garcia Anato. All rights reserved.
//

#import "ViewController.h"
#import "FeatureProvider.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FeatureProvider *feature = [[FeatureProvider alloc] init];
    [feature request:@"ios" handler:^(Feature *feature, NSString *error) {
        if (error) {
            NSLog(error);
            return;
        }
        NSLog(@"%@", feature.feature);
    }];
}

@end
