//
//  FeatureProvider.m
//  HolaIphone
//
//  Created by Samuel Garcia Anato on 29-07-20.
//  Copyright © 2020 Samuel Garcia Anato. All rights reserved.
//

#import "FeatureProvider.h"

@implementation FeatureProvider

-(void) request:(NSString *)platform handler:(void(^)(Feature *feature, NSString *error))handler {
    
    NSURL *url = [self createUrlForPlatform:platform];
    
    NSMutableURLRequest *urlRequest = [self createUrlRequestWith:url];
    
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            
            Feature *feature = [[Feature alloc] initWithDictionary: responseDictionary];
            
            handler(feature,nil);
        }
        else
        {
            handler(nil, @"Error");
        }
    }];
    
    [dataTask resume];
    
}

-(NSMutableURLRequest *) createUrlRequestWith:(NSURL *) url {
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest addValue:@"tucarro" forHTTPHeaderField:@"x-application-id"];
    [urlRequest addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    return urlRequest;
    
}

-(NSURL *) createUrlForPlatform:(NSString *) platform {
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://21b1b14ae4b6.ngrok.io/platforms/%@/feature",platform];
    return [[NSURL alloc] initWithString:urlString];
}

@end
