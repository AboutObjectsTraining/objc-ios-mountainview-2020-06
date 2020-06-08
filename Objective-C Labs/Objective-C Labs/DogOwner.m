#import "DogOwner.h"
#import "Dog.h"

@implementation DogOwner

// PART 1

- (NSArray *)dogs
{
    return [self mutableDogs];
}

- (NSMutableArray *)mutableDogs
{
    if (_dogs == nil) {
        _dogs = [NSMutableArray array];
    }
    
    return _dogs;
}

- (void)addDogs:(NSArray *)newDogs
{
    [[self mutableDogs] addObjectsFromArray:newDogs];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nOwner: %@\nDogs: %@",
            [self fullName], [self dogs]];
}

////////


// PART 2

- (void)dogDidHearDoorbell:(Dog *)dog
{
    if ([[dog name] isEqualToString:@"Bowser"] ||
        [[dog name] isEqualToString:@"Woofsie"])
    {
        [dog sit];
    }
}

- (BOOL)dogShouldBark:(Dog *)dog
{
    return NO;
}

- (BOOL)dogShouldWagTail:(Dog *)dog
{
    return NO;
}

////////

@end
