//
//  QuizzesViewController.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizzesViewController.h"

#import "QuizCell.h"
#import "ViewFactory.h"

@interface QuizzesViewController () <UITableViewDataSource>

@end

@implementation QuizzesViewController

#pragma mark - UIViewController Override(s)

- (void)loadView {
    UITableView * quizzesTableView = [ViewFactory quizzesTableView];
    quizzesTableView.dataSource = self;
    self.view = self.quizzesTableView = quizzesTableView;
}

#pragma mark - UITableViewDataSource Method(s)

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuizCell * quizCell = [tableView dequeueReusableCellWithIdentifier:QuizCellIdentifier];
    return quizCell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return 10;
}

@end
