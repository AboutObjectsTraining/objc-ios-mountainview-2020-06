// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELEditBookController.h"
#import <ReadingListModel/ReadingListModel.h>

@interface RELEditBookController ()

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

@end

@implementation RELEditBookController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.titleField.text = self.book.title;
    self.yearField.text = self.book.year;
    self.firstNameField.text = self.book.author.firstName;
    self.lastNameField.text = self.book.author.lastName;
}

- (void)updateBook {
    self.book.title = self.titleField.text;
    self.book.year = self.yearField.text;
    if (self.book.author == nil) {
        self.book.author = [[RLMAuthor alloc] init];
    }
    self.book.author.firstName = self.firstNameField.text;
    self.book.author.lastName = self.lastNameField.text;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Done"]) {
        [self updateBook];
    }
}

@end
