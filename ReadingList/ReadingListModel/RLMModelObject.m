// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RLMModelObject.h"

@implementation RLMModelObject

+ (NSArray *)keys
{
    return @[];
}

+ (id)modelObjectWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (!(self = [super init])) return nil;
    [self setValuesForKeysWithDictionary:dictionary];
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    return [self dictionaryWithValuesForKeys:self.class.keys];
}

@end
