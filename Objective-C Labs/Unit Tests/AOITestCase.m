#import "AOITestCase.h"
#import "Person.h"
#import "Dog.h"

@implementation AOITestCase


- (void)invokeTest
{
    NSString *methodName = NSStringFromSelector([[self invocation] selector]);
    printf("\n******  %s  ******\n\n", [methodName UTF8String]);
    
    [super invokeTest];
    
    putchar('\n');
}

@end
