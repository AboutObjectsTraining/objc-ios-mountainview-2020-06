//
//  Employee.h
//  Objective-C Labs
//
//  Created by Jonathan on 10/20/13.
//  Copyright (c) 2013 About Objects. All rights reserved.
//

#import "Person.h"

@interface Employee : Person
{
    NSNumber *_salary;
    NSString *_title;
}

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName
                    age:(int)age
                  title:(NSString *)title;

- (NSNumber *)salary;
- (void)setSalary:(NSNumber *)newValue;

- (NSString *)title;
- (void)setTitle:(NSString *)newValue;

@end
