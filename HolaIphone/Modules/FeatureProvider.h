//
//  FeatureProvider.h
//  HolaIphone
//
//  Created by Samuel Garcia Anato on 29-07-20.
//  Copyright © 2020 Samuel Garcia Anato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feature.h"

@interface FeatureProvider : NSObject

-(void) request:(NSString *)platform handler:(void(^)(Feature *feature, NSString *error))handler;

@end
