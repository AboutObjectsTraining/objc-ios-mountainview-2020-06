#import "RLMAuthor.h"

const struct RLMAuthorKeys RLMAuthorKeys = {
    .firstName = @"firstName",
    .lastName = @"lastName"
};

@implementation RLMAuthor

+ (NSArray *)keys
{
    return @[RLMAuthorKeys.firstName, RLMAuthorKeys.lastName];
}

- (NSString *)fullName
{
    if (self.lastName == nil && self.firstName == nil) { return @"Unknown"; }
    if (self.lastName == nil)  { return self.firstName; }
    if (self.firstName == nil) { return self.lastName; }
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description
{
    return self.fullName;
}

@end
