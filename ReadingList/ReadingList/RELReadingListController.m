// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELViewBookController.h"
#import "RELAddBookController.h"
#import <ReadingListModel/ReadingListModel.h>
#import "UIStoryboardSegue+RELAdditions.h"

@interface NSIndexPath (RELAdditions)
@property (class, readonly) NSIndexPath *zero;
@end

@implementation NSIndexPath (RELAdditions)
+ (NSIndexPath *)zero {
    return [NSIndexPath indexPathForRow:0 inSection:0];
}
@end

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RLMStoreController *storeController;
@property (strong, nonatomic) RLMReadingList *readingList;
@end

@implementation RELReadingListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.storeController.fetchedReadingList;
    }
    return _readingList;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"View Book"]) {
        RELViewBookController *controller = segue.rel_destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        controller.book = [self.readingList bookAtIndexPath:indexPath];
    } else {
        RELAddBookController *controller = segue.rel_destinationViewController;
        typeof(self) __weak weakSelf = self;
        controller.addBook = ^(RLMBook *book) {
            [weakSelf.readingList insertBook:book atIndexPath:NSIndexPath.zero];
        };
    }
}

// MARK: - Unwind segues

- (IBAction)done:(UIStoryboardSegue *)unwindSegue {
    [self.tableView reloadData];
    [self.storeController saveReadingList:self.readingList];
}

- (IBAction)cancel:(UIStoryboardSegue *)unwindSegue {
    
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.readingList.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Cell"];
    RLMBook *book = [self.readingList bookAtIndexPath:indexPath];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", book.year, book.author];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.readingList removeBookAtIndexPath:indexPath];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.storeController saveReadingList:self.readingList];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.readingList moveBookAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    [self.storeController saveReadingList:self.readingList];
}

@end
