// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface BlockLiteralTests : XCTestCase
@property (strong, nonatomic) NSString *text;
@end

void sayHello(void) {
    printf("Hello!\n");
}

void saySomethingNTimes(int count, void (*thingToSay)(void)) {
    for (int i = 0; i < count; i++) {
        printf("%d. ", i + 1);
        thingToSay();
    }
}

void saySomethingBlockishNTimes(int count, void (^thingToSay)(void)) {
    for (int i = 0; i < count; i++) {
        printf("%d. ", i + 1);
        thingToSay();
    }
}

@implementation BlockLiteralTests

- (void)setUp {
    self.text = @"The weather is fine!";
}

- (void)testFunctionPointer {
    void (*myPtr)(void) = NULL;
    
    myPtr = sayHello;
    
    myPtr();
    
    saySomethingNTimes(3, sayHello);
}

- (void)testBlockLiteral {
    void (^myBlock)(void) = nil;
    
    myBlock = ^{
        printf("Hello from my block!\n");
    };
    
    myBlock();
    
    saySomethingBlockishNTimes(3, ^{
        printf("Hello from my block!\n");
    });
}

- (void)testCapturingState {
    NSString *message = @"The weather is sunny.";
    
    saySomethingBlockishNTimes(3, ^{
        printf("Hello from my block! %s\n", message.UTF8String);
    });
}

- (void)testCapturingSelf {
    typeof(self) __weak weakSelf = self;
    saySomethingBlockishNTimes(3, ^{
        printf("Hello from my block! %s\n", weakSelf.text.UTF8String);
    });
}

@end
