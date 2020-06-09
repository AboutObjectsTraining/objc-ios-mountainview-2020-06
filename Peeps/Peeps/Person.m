// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

- (NSString *)firstName {
    return _firstName;
}

- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

@end
