#import "AOITestCase.h"
#import "DogOwner.h"
#import "Dog.h"

#import "NSArray+LABAdditions.h"

@interface DogOwnerTests : AOITestCase

@end


@implementation DogOwnerTests
{
    DogOwner *_owner;
}

- (void)setUp
{
    [super setUp];
    
    _owner = [[DogOwner alloc] initWithFirstName:@"Fred"
                                        lastName:@"Smith"
                                             age:32];
    
    Dog *bowser = [[Dog alloc] initWithName:@"Bowser"];
    Dog *woofsie = [[Dog alloc] initWithName:@"Woofsie"];
    Dog *spot = [[Dog alloc] initWithName:@"Spot"];
    
    [_owner addDogs:@[bowser, woofsie, spot]];
}

- (void)testPart01
{
    NSLog(@"%@", _owner);
    
    [[_owner dogs] makeObjectsPerformSelector:@selector(doorbellDidRing)];
}

- (void)testPart02
{
    [[_owner dogs][0] setDelegate:_owner];
    [[_owner dogs][1] setDelegate:_owner];
    [[_owner dogs] makeObjectsPerformSelector:@selector(doorbellDidRing)];
}

- (void)testPart03
{
    NSLog(@"%@", [[_owner dogs] lab_fancyDescription]);
}


@end
