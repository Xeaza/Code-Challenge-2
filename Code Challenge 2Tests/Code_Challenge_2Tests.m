//
//  Code_Challenge_2Tests.m
//  Code Challenge 2Tests
//
//  Created by Taylor Wright-Sanson on 10/10/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Code_Challenge_2Tests : XCTestCase

@end

@implementation Code_Challenge_2Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
