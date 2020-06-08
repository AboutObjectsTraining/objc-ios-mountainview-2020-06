#import "NSArray+LABAdditions.h"

@implementation NSArray (LABAdditions)

- (NSString *)lab_fancyDescription
{
    NSMutableString *s = [NSMutableString stringWithFormat:
                          @"%@ of %ld elements (",
                          [self class], [self count]];
    
    for (id currObj in self) {
        [s appendFormat:@"\n    %@, %@", [currObj class], currObj];
    }
    
    [s appendString:@"\n)\n"];
    
    return s;
}

@end
