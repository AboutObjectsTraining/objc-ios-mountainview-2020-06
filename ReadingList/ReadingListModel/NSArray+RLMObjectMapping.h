// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@class RLMModelObject;

@interface NSArray (RLMObjectMapping)

- (NSArray <RLMModelObject *> *)mappedModelObjectsOfType:(Class)class;

@end

