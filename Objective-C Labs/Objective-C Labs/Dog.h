#import <Foundation/Foundation.h>

// PART 2
@class Dog;

@protocol DogDelegate <NSObject>

- (void)dogDidHearDoorbell:(Dog *)dog;
- (BOOL)dogShouldBark:(Dog *)dog;
- (BOOL)dogShouldWagTail:(Dog *)dog;

@end
////////


@interface Dog : NSObject
{
    NSString *_name;
    
    id<DogDelegate> _delegate; // PART 2
}

- (id)initWithName:(NSString *)name;

- (NSString *)name;

- (void)doorbellDidRing;


// PART 2
- (id<DogDelegate>)delegate;
- (void)setDelegate:(id<DogDelegate>)delegate;

- (void)sit;
////////

@end
