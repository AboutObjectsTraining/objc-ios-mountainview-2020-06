#import "RLMReadingList.h"
#import "RLMBook.h"
#import "NSArray+RLMObjectMapping.h"

const struct RLMReadingListKeys RLMReadingListKeys = {
    .title = @"title",
    .books = @"books"
};


@implementation NSIndexPath (RLMAdditions)
- (NSUInteger)section { return [self indexAtPosition:0]; }
- (NSUInteger)row     { return [self indexAtPosition:1]; }
@end

@implementation RLMReadingList

+ (NSArray *)keys
{
    return @[RLMReadingListKeys.title, RLMReadingListKeys.books];
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableValues = [[super dictionaryWithValuesForKeys:self.class.keys] mutableCopy];
    NSArray *books = mutableValues[RLMReadingListKeys.books];
    NSMutableArray *dicts = [NSMutableArray arrayWithCapacity:books.count];
    
    for (RLMBook *book in books) {
        [dicts addObject:book.dictionaryRepresentation];
    }
    
    mutableValues[RLMReadingListKeys.books] = dicts;
    
    return mutableValues;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:RLMReadingListKeys.books])
    {
        NSArray *values = (NSArray *) value;
        if ([values.firstObject isKindOfClass:NSDictionary.class]) {
            value = [values mappedModelObjectsOfType:RLMBook.class];
        }
    }
    
    [super setValue:value forKey:key];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nTitle: %@\nBooks: %@", self.title, self.books];
}

@end


@implementation RLMReadingList (RLMRelationshipAccessors)

- (NSMutableArray *)mutableBooks {
    return [self mutableArrayValueForKey:RLMReadingListKeys.books];
}

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath {
    return self.books[indexPath.row];
}

- (void)insertBook:(RLMBook *)book atIndexPath:(NSIndexPath *)indexPath {
    [self.mutableBooks insertObject:book atIndex:indexPath.row];
}

- (void)removeBookAtIndexPath:(NSIndexPath *)indexPath {
    [self.mutableBooks removeObjectAtIndex:indexPath.row];
}

- (void)moveBookAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    RLMBook *book = self.books[indexPath.row];
    [self removeBookAtIndexPath:indexPath];
    [self insertBook:book atIndexPath:destinationIndexPath];
}

@end
