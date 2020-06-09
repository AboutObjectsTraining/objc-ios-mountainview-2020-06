// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"
#import <Peeps/Peeps.h>

//Person *createPerson(void) {
//
//}

@implementation Person

+ (instancetype)personWithFirstName:(NSString *)aFirstName
                           lastName:(NSString *)aLastName
                                age:(NSInteger)anAge {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName age:anAge];
}

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName {
    return [self initWithFirstName:aFirstName lastName:aLastName age:0];
}

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName
                              age:(NSInteger)anAge {
    self = [super init];
    if (self == nil) return nil;
    
    // Initialize ivars
    _firstName = [aFirstName copy];
    _lastName = [aLastName copy];
    _age = anAge;
    
    // Call methods on self if necessary
    
    return self;
}

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = [newValue copy];
}

- (NSString *)fullName {
    return [[NSString alloc] initWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSInteger)age {
    return _age;
}
- (void)setAge:(NSInteger)newValue {
    _age = newValue;
}

- (Dog *)dog {
    return _dog;
}
- (void)setDog:(Dog *)newValue {
    // TODO: Should we copy the dog?
    _dog = [newValue copy];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@, age: %@", [self fullName], @([self age])];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"In %s", __func__);
    if ([[self dog] respondsToSelector:aSelector]) {
        return [self dog];
    }
    return nil;
}

@end
