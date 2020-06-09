// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Dog.h"

@implementation Dog

- (void)bark {
    printf("\n*** Woof! Woof! ***\n\n");
}

- (id)copyWithZone:(NSZone *)zone {
    Dog *newDog = [[[self class] allocWithZone:zone] init];
    // Set the dog's ivars if necessary.
    return newDog;
}

@end
