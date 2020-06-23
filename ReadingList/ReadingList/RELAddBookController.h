// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <UIKit/UIKit.h>

@class RLMBook;

@interface RELAddBookController : UITableViewController

@property (copy, nonatomic) void (^addBook)(RLMBook *book);

@end
