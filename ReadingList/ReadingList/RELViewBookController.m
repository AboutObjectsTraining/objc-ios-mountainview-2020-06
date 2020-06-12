// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELViewBookController.h"
#import "RELEditBookController.h"
#import <ReadingListModel/ReadingListModel.h>
#import "UIImage+RELAdditions.h"
#import "UIStoryboardSegue+RELAdditions.h"

@interface RELViewBookController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation RELViewBookController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.titleLabel.text = self.book.title;
    self.yearLabel.text = self.book.year;
    self.firstNameLabel.text = self.book.author.firstName;
    self.lastNameLabel.text = self.book.author.lastName;
    
    self.imageView.image = [UIImage rel_imageNamed:self.book.author.lastName];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RELEditBookController *controller = segue.rel_destinationViewController;
    controller.book = self.book;
}

- (IBAction)cancel:(UIStoryboardSegue *)unwindSegue {
    
}

@end
