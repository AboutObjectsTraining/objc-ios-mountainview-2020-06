// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface ClassClusterTests : XCTestCase
@end

@implementation ClassClusterTests

- (void)testStringClassCluster {
    NSString *s1 = [NSString alloc];
//    NSString *s2 = [NSString alloc];
    s1 = [s1 initWithFormat:@"%@ %@", @"Hello", @"World!"];
    
    NSMutableString *s3 = [[NSMutableString alloc] initWithString:s1];
    [s3 appendString:@" Woo!"];
    
    NSLog(@"%@", s1);
    NSLog(@"%@", s3);
//    NSLog(@"%@", s2);
}

@end
