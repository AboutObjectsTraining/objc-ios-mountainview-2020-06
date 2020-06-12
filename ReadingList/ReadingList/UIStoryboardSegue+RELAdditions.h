// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <UIKit/UIKit.h>

@interface UIStoryboardSegue (RELAdditions)

@property (readonly, nonatomic) __kindof UIViewController *rel_destinationViewController;

@end
