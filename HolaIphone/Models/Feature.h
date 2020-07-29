//
//  Feature.h
//  HolaIphone
//
//  Created by Samuel Garcia Anato on 29-07-20.
//  Copyright © 2020 Samuel Garcia Anato. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Feature : NSObject

@property (weak) NSString *feature;

-(instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
