// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

NSString *RELPathForDocument(NSString *name, NSString *type);

@class RLMReadingList;

@interface RLMStoreController : NSObject

@property (nonatomic, readonly) RLMReadingList *fetchedReadingList;

- (void)saveReadingList:(RLMReadingList *)readingList;

@end
