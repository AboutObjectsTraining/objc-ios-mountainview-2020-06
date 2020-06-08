#import "Person.h"

@implementation Person

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = [newValue copy];
}

- (int)age {
    return _age;
}
- (void)setAge:(int)newValue {
    _age = newValue;
}

//// Part 2
- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName
                    age:(int)age
{
    if (!(self = [super init])) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    _age = age;
    
    return self;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}
////


//// Part 3
+ (instancetype)personWithFirstName:(NSString *)firstName
                           lastName:(NSString *)lastName
                                age:(int)age
{
    return [[self alloc] initWithFirstName:firstName
                                  lastName:lastName
                                       age:age];
}

- (void)display
{
    printf("%s\n", [[self description] UTF8String]);
}
////

//// Part 4

const NSUInteger MaxRating = 5;

- (NSUInteger)rating {
    return _rating;
}
- (void)setRating:(NSUInteger)newValue {
    _rating = newValue > MaxRating ? MaxRating : newValue;
}

- (NSString *)ratingStars
{
    if ([self rating] == 0)  return @"-";

    return [@"*****" substringToIndex:[self rating]];
}

- (NSString *)description
{
    NSString *stars = [self ratingStars];
    stars = [stars stringByPaddingToLength:MaxRating
                                withString:@" "
                           startingAtIndex:0];
    
    return [NSString stringWithFormat:@"%@  %@", stars, [self fullName]];
}

////


@end
