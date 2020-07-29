//
//  Feature.m
//  HolaIphone
//
//  Created by Samuel Garcia Anato on 29-07-20.
//  Copyright © 2020 Samuel Garcia Anato. All rights reserved.
//

#import "Feature.h"

@implementation Feature

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _feature = [dictionary objectForKey:@"feature"];
    }
    return self;
}

@end
