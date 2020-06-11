// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNAppDelegate.h"
#import "CLNCoolViewController.h"

@implementation CLNAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    NSLog(@"In %s", __func__);
    
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = UIColor.yellowColor;
    self.window.rootViewController = [[CLNCoolViewController alloc] initWithNibName:@"CoolStuff" bundle:nil];
    [self.window makeKeyAndVisible];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"In %s", __func__);
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = touches.anyObject;
//    CGPoint currLocation = [touch locationInView:nil];
//    CGPoint prevLocation = [touch previousLocationInView:nil];
//    
//    CGFloat deltaX = currLocation.x - prevLocation.x;
//    CGFloat deltaY = currLocation.y - prevLocation.y;
//    
//    touch.view.frame = CGRectOffset(touch.view.frame, deltaX, deltaY);
//}

@end
