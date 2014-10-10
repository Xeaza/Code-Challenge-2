//
//  City.h
//  Code Challenge 2
//
//  Created by Taylor Wright-Sanson on 10/10/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol  CityDelegte

// Setting this to option because I won't have time to finish...
@optional
- (void) getCityURL;

@end

@interface City : NSObject

@property NSString *name;
@property NSString *provence;
@property NSString *state;
@property NSString *wikiUrlString;
@property UIImage *image;

- (instancetype)initWithName:(NSString *)name;
@property id <CityDelegte> delegate;


@end
