// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "NSArray+RLMObjectMapping.h"
#import "RLMModelObject.h"

@implementation NSArray (RLMObjectMapping)

- (NSArray <RLMModelObject *> *)mappedModelObjectsOfType:(Class)class
{
    NSMutableArray *modelObjs = [NSMutableArray arrayWithCapacity:self.count];
    
    for (NSDictionary *currDict in self) {
        [modelObjs addObject:[class modelObjectWithDictionary:currDict]];
    }
    
    return modelObjs;
}

@end

