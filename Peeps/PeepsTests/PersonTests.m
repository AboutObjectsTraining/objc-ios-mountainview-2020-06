// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testCreatePerson {
    Person *fred = [[Person alloc] init];
    NSLog(@"Description of fred: %@", fred);
//    NSString *desc = [fred description];
//    NSLog(@"Description of fred: %s", desc);
    
    fred.firstName = @"Fred";
//    [fred setFirstName:@"Fred"];
    NSLog(@"Description of fred: %@", fred);
}

- (void)testFullName {
    
//    Person *p = [Person alloc];
//    p = [p init];

    Person *fred = [[Person alloc] init];
    NSLog(@"%@", fred);
    
//    [fred setFirstName:@"Fred"];
//    [fred setLastName:@"Smith"];
    
    fred.firstName = @"Fred";
    fred.lastName = @"Smith";
    
    NSLog(@"%@", fred);
}

- (void)testCustomDesignatedInitializer {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith"];
    NSLog(@"%@", fred);
    
    Person *sue = [[Person alloc] initWithFirstName:@"Sue" lastName:@"Yu" age:42];
    NSLog(@"%@", sue);
    
    Person *bob = [Person personWithFirstName:@"Bob" lastName:@"Jones" age:33];
    NSLog(@"%@", bob);
}

- (void)testForwarding {
    id fred = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:42];
    [fred setDog:[[Dog alloc] init]];
    [fred bark];
    [[fred dog] bark];
}

@end
