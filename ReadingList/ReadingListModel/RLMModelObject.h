// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@interface RLMModelObject : NSObject

@property (class, readonly, nonatomic) NSArray *keys;
@property (readonly, nonatomic) NSDictionary *dictionaryRepresentation;

+ (id)modelObjectWithDictionary:(NSDictionary *)dictionary;
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
