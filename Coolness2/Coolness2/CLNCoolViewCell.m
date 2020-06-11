// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

const UIEdgeInsets CLNTextInsets = {
    .top = 7,
    .bottom = 8,
    .left = 12,
    .right = 12,
};

IB_DESIGNABLE
@interface CLNCoolViewCell ()
@property (assign, getter=isHighlighted, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary *textAttributes;

@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@end

@implementation CLNCoolViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self == nil) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (void)configureLayer {
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapRecognizer];
}

+ (NSDictionary *)textAttributes {
    static NSDictionary *dict;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict = @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                  NSForegroundColorAttributeName : UIColor.whiteColor };
    });
    return dict;
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

// MARK: - Animation

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1 size:CGSizeMake(120, 240)];
}

- (void)configureAnimationWithSize:(CGSize)size {
    [UIView setAnimationRepeatCount:3];
    [UIView setAnimationRepeatAutoreverses:YES];
    CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
    self.transform = CGAffineTransformRotate(translation, M_PI_2);
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:duration
                     animations:^{ [weakSelf configureAnimationWithSize:size]; }
                     completion:^(BOOL finished) {
        weakSelf.transform = CGAffineTransformIdentity;
    }];
}

// MARK: - Drawing and resizing

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    [self.text drawAtPoint:CGPointMake(CLNTextInsets.left, CLNTextInsets.top) withAttributes:self.class.textAttributes];
}

// MARK: - UIResponder methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat deltaX = currLocation.x - prevLocation.x;
    CGFloat deltaY = currLocation.y - prevLocation.y;
    
    self.frame = CGRectOffset(self.frame, deltaX, deltaY);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end
