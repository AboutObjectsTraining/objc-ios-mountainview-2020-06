#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

@interface DogOwner : Person <DogDelegate>
{
    NSMutableArray *_dogs;
}

- (NSArray *)dogs;

- (void)addDogs:(NSArray *)newDogs;

@end
