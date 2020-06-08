#import "Dog.h"

@implementation Dog

// PART 1

- (id)initWithName:(NSString *)name
{
    if (!(self = [super init])) return nil;
    
    _name = [name copy];
    
    return self;
}

- (NSString *)name
{
    return _name;
}

- (void)growl
{
    printf("%s: Grrrrrr!\n", [[self name] UTF8String]);
}

- (void)bark
{
    printf("%s: Woof! Woof! Woof!\n", [[self name] UTF8String]);
}

- (void)wagTail
{
    printf("%s: [Wags tail.]\n", [[self name] UTF8String]);
}

- (NSString *)description
{
    return [self name];
}

//- (void)doorbellDidRing
//{
//    [self growl];
//    [self bark];
//    [self wagTail];
//}

/////////



// PART 2

- (id<DogDelegate>)delegate
{
    return _delegate;
}

- (void)setDelegate:(id<DogDelegate>)delegate
{
    _delegate = delegate;
}

- (void)doorbellDidRing
{
    [self growl];
    
    [_delegate dogDidHearDoorbell:self];
    
    if (_delegate == nil || [_delegate dogShouldBark:self]) {
        [self bark];
    }
    
    if (_delegate == nil || [_delegate dogShouldWagTail:self]) {
        [self wagTail];
    }
}

- (void)sit
{
    printf("%s: [Sits.]\n", [[self name] UTF8String]);
}

////////

@end
