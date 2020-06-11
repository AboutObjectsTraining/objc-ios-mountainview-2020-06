// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@end

@implementation CLNCoolViewController

- (IBAction)addCell {
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    [self.contentView addSubview:newCell];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.systemBlueColor;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    CLNCoolViewCell *cell1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 200, 40)];
//    CLNCoolViewCell *cell2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 120, 200, 40)];
//    [self.contentView addSubview:cell1];
//    [self.contentView addSubview:cell2];
//    
//    cell1.text = @"Hello World! 🌎🌏🌍";
//    cell2.text = @"Cool View Cells Rock! 🎉🍾";
//    
//    cell1.backgroundColor = UIColor.systemPurpleColor;
//    cell2.backgroundColor = UIColor.systemOrangeColor;
//}
//
//- (void)loadView3 {
//    [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:self options:nil];
//}
//
//- (void)loadView2 {
//    NSArray *topLevelObjs = [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:nil options:nil];
//    self.view = topLevelObjs.firstObject;
//}

//- (void)loadView1 {
//    self.view = [[UIView alloc] init];
//    self.view.backgroundColor = UIColor.brownColor;
//
//    CGRect screenRect = UIScreen.mainScreen.bounds;
//    CGRect accessoryRect;
//    CGRect contentRect;
//    CGRectDivide(screenRect, &accessoryRect, &contentRect, 90, CGRectMinYEdge);
//
//    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
//    self.contentView = [[UIView alloc] initWithFrame:contentRect];
//
//    self.contentView.clipsToBounds = YES;
//
//    [self.view addSubview:accessoryView];
//    [self.view addSubview:self.contentView];
//
//    accessoryView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
//    self.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
//
//    // Controls
//
//    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 40, 240, 40)];
//    [accessoryView addSubview:self.textField];
//    self.textField.placeholder = @"Enter a label";
//    self.textField.borderStyle = UITextBorderStyleRoundedRect;
//    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//
//    self.textField.delegate = self;
//
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [accessoryView addSubview:button];
//    [button setTitle:@"Add Cell" forState:UIControlStateNormal];
//    [button sizeToFit];
//    button.frame = CGRectOffset(button.frame, 270, 50);
//
//    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
//
//    // Cool Cells
//    CLNCoolViewCell *cell1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 200, 40)];
//    CLNCoolViewCell *cell2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 120, 200, 40)];
//    [self.contentView addSubview:cell1];
//    [self.contentView addSubview:cell2];
//
//    cell1.text = @"Hello World! 🌎🌏🌍";
//    cell2.text = @"Cool View Cells Rock! 🎉🍾";
//
//    cell1.backgroundColor = UIColor.systemPurpleColor;
//    cell2.backgroundColor = UIColor.systemOrangeColor;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"In %s", __func__);
    [super touchesBegan:touches withEvent:event];
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
