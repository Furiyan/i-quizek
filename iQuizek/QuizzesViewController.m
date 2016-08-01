//
//  QuizzesViewController.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizzesViewController.h"

#import "QuizCell.h"
#import "QuizOverview.h"
#import "QuizProvider.h"
#import "QuizViewController.h"
#import "ViewFactory.h"

@interface QuizzesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray<QuizOverview *> * quizzes;

@property (nonatomic) QuizProvider * quizProvider;

@end

@implementation QuizzesViewController

#pragma mark - UIViewController Override(s)

- (void)loadView {
    UITableView * quizzesTableView = [ViewFactory quizzesTableView];
    quizzesTableView.delegate = self;
    quizzesTableView.dataSource = self;
    self.view = self.quizzesTableView = quizzesTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
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

#pragma mark - UITableViewDelegate Method(s)

- (void)      tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    QuizViewController * quizViewCtrl = [[QuizViewController alloc] initWithQuizId:self.quizzes[indexPath.row].id];
    [self.navigationController pushViewController:quizViewCtrl animated:YES];
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
    self.title = @"Lista";
    self.quizzes = @[];
    self.quizProvider = [[QuizProvider alloc] init];
}

@end
