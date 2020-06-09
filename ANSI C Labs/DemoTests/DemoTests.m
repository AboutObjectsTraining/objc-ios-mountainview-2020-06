// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>


const char delta = 'a' - 'A';

void Capitalize(char *word) {
    word[0] -= delta;
}

@interface DemoTests : XCTestCase
@end

@implementation DemoTests

- (void)testPointerStuff {
    char name[] = "Fred Smith";
    char *charRef = name;
    // Prints: address is 0x7fff5fbff7dd, value is F
    printf("address is %p, value is %c\n", charRef, charRef[0]);
    printf("address is %p, value is %c\n", name, *name);
    
    // Prints: address is 0x7fff5fbff7de, value is r
    printf("address is %p, value is %c\n", &charRef[1], charRef[1]);
    printf("address is %p, value is %c\n", name + 1, *(name + 1));
    
    charRef += 5; // Moves the pointer past the substring “Fred “ // Prints: address is 0x7fff5fbff7e2, value is Smith
    
//    printf("address is %p, value is %s\n", charRef, charRef);
}

- (void)testCapitalize {
//    int s4[] = { 97, 98, 99, 0 };
//    printf("%s\n", s4);
    
    
    char s3[6] = "hello";
    char *s = "hello";
    char *s2 = "hello";
    Capitalize(s);
    printf("%s\n", s);
    printf("%s\n", s2);
    printf("%s\n", s3);
}

@end


void Capitalize3(char *word)
{
    static const char delta = 'a' - 'A'; // Here delta is static.
    
    {
        char delta = 'b';
        printf("%c\n", delta);
        {
            char delta = 'c';
            printf("%c\n", delta);
        }
    }
    
    printf("%c\n", delta);
    
    word[0] -= delta;
}

void Foo() {
    
}
