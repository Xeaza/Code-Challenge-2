//
//  City.m
//  Code Challenge 2
//
//  Created by Taylor Wright-Sanson on 10/10/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        if (name.length == 0)
        {
            [NSException raise:NSInvalidArgumentException format:@"Your city must have a name, call initWithName:"];
        }
        self.name = name;
    }
    return self;
}



@end
