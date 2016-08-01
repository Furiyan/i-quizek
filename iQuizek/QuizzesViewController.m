//
//  QuizzesViewController.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizzesViewController.h"

#import "QuizCell.h"
#import "QuizProvider.h"
#import "ViewFactory.h"

@interface QuizzesViewController () <UITableViewDataSource>

@property (nonatomic) NSArray<QuizOverview *> * quizzes;

@property (nonatomic) QuizProvider * quizProvider;

@end

@implementation QuizzesViewController

#pragma mark - UIViewController Override(s)

- (void)loadView {
    UITableView * quizzesTableView = [ViewFactory quizzesTableView];
    quizzesTableView.dataSource = self;
    self.view = self.quizzesTableView = quizzesTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.quizProvider fetchQuizOverviewsWithCompletion:^(NSArray<QuizOverview *> * quizzes, NSError * error) {
        self.quizzes = quizzes;
        [self.quizzesTableView reloadData];
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDataSource Method(s)

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuizCell * quizCell = [tableView dequeueReusableCellWithIdentifier:QuizCellIdentifier];
    [quizCell reloadWithQuizOverview:self.quizzes[indexPath.row]];
    return quizCell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.quizzes.count;
}

#pragma mark - Setup

- (void)setUp {
    self.quizzes = @[];
    self.quizProvider = [[QuizProvider alloc] init];
}

@end
