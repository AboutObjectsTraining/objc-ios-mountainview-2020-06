#import "AOITestCase.h"
#import "Person.h"

@interface PersonTests : AOITestCase
@end


@implementation PersonTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testPart01
{
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    [fred setAge:32];
    
    NSLog(@"\nfirst name: %@"
          @"\nlast name: %@"
          @"\nage: %d",
          [fred firstName],
          [fred lastName],
          [fred age]);
}

- (void)testPart02
{
    Person *fred = [[Person alloc] initWithFirstName:@"Fred"
                                            lastName:@"Smith"
                                                 age:32];
    NSLog(@"%@", [fred fullName]);
    
    NSLog(@"%@", [fred description]);
    
    NSLog(@"%@", fred);
}

- (void)testPart03
{
    NSArray *people = @[[Person personWithFirstName:@"Fred"
                                           lastName:@"Smith"
                                                age:32],
                        [Person personWithFirstName:@"Jill"
                                           lastName:@"Brown"
                                                age:27],
                        [Person personWithFirstName:@"Lee"
                                           lastName:@"Jones"
                                                age:41]];
    for (Person *currPerson in people) {
        [currPerson display];
    }
}

- (NSArray *)people
{
    return @[[Person personWithFirstName:@"Fred" lastName:@"Smith" age:32],
             [Person personWithFirstName:@"Jill" lastName:@"Brown" age:27],
             [Person personWithFirstName:@"Al" lastName:@"Smith" age:41],
             [Person personWithFirstName:@"Greg" lastName:@"Brown" age:25],
             [Person personWithFirstName:@"Sue" lastName:@"Davis" age:36]];
}

- (void)testPart04
{
    NSArray *people = [self people];
    
    [people[0] setRating:3];
    [people[1] setRating:999];
    [people[2] setRating:0];
    [people[3] setRating:3];
    [people[4] setRating:4];
    
    printf("\nPeople:\n-------\n");
    for (Person *currPerson in people) {
        [currPerson display];
    }
    
    NSSortDescriptor *sortDesc = [NSSortDescriptor
                                  sortDescriptorWithKey:@"rating"
                                  ascending:NO];
    NSArray *sortedPeeps = [people sortedArrayUsingDescriptors:@[sortDesc]];
    
    printf("\nSorted People:\n--------------\n");
    for (Person *currPerson in sortedPeeps) {
        [currPerson display];
    }
}

- (void)testPart05
{
    NSArray *people = [self people];
    
    [people[0] setRating:3];
    [people[1] setRating:2];
    [people[2] setRating:3];
    [people[3] setRating:2];
    [people[4] setRating:3];
    
    printf("\nPeople:\n-------\n");
    for (Person *currPerson in people) {
        [currPerson display];
    }
    
    NSArray *descriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"rating"
                                                           ascending:NO],
                             [NSSortDescriptor sortDescriptorWithKey:@"lastName"
                                                           ascending:YES],
                             [NSSortDescriptor sortDescriptorWithKey:@"firstName"
                                                           ascending:YES]];
    NSArray *sortedPeeps = [people sortedArrayUsingDescriptors:descriptors];
    
    printf("\nSorted People:\n--------------\n");
    [sortedPeeps makeObjectsPerformSelector:@selector(display)];
}

@end
