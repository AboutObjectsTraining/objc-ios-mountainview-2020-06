//
//  Employee.m
//  Objective-C Labs
//
//  Created by Jonathan on 10/20/13.
//  Copyright (c) 2013 About Objects. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    // TODO: Implement initWithDictionary: in Person class as well...
    
    if (!(self = [super init])) return nil;
    
    _salary = [dictionary objectForKey:@"salary"];
    _title = [dictionary objectForKey:@"title"];
    
    return self;
}


- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName
                    age:(int)age
                  title:(NSString *)title
{
    if (!(self = [super initWithFirstName:firstName lastName:lastName age:0])) return nil;
    
    _title = [title copy];
    
    return self;
}

+ (NSNumberFormatter *)currencyFormatter
{
    static NSNumberFormatter *_formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _formatter = [[NSNumberFormatter alloc] init];
        [_formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    });
    return _formatter;
}

- (NSString *)description
{
    NSNumberFormatter *formatter = [[self class] currencyFormatter];
    NSString *formattedSalary = [formatter stringFromNumber:[self salary]];
    return [NSString stringWithFormat:@"%@, Salary: %@",
            [super description], formattedSalary];
}

- (NSNumber *)salary {
    return _salary;
}
- (void)setSalary:(NSNumber *)newValue {
    _salary = newValue;
}

- (NSString *)title {
    return _title;
}
- (void)setTitle:(NSString *)newValue {
    _title = [newValue copy];
}

@end
