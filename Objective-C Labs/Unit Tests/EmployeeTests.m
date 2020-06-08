//
//  EmployeeTests.m
//  Objective-C Labs
//
//  Created by Jonathan on 10/20/13.
//  Copyright (c) 2013 About Objects. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "AOITestCase.h"
#import "Employee.h"

@interface EmployeeTests : AOITestCase

@end

@implementation EmployeeTests


- (void)testExample
{
    Employee *emp = [[Employee alloc] initWithFirstName:@"Jim"
                                               lastName:@"Bob"
                                                    age:29
                                                  title:@"Developer"];
    [emp setSalary:@1234.56];
    
    NSLog(@"%@", emp);
}

@end
