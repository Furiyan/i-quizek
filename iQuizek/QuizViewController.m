//
//  QuizViewController.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizViewController.h"

#import "QuizProgressView.h"
#import "QuizProvider.h"
#import "QuizQuestionViewController.h"
#import "QuizView.h"
#import "ViewFactory.h"

#import "Masonry.h"

@interface QuizViewController () <QuizQuestionViewControllerDelegate>

@property (weak, nonatomic) NSNumber * quizId;

@property (nonatomic) NSArray<QuizQuestion *> * questions;

@property (nonatomic) NSUInteger currentQuestionIndex;

@property (nonatomic) QuizQuestionViewController * quizQuestionViewCtrl;

@end

@implementation QuizViewController

#pragma mark - Creating

- (instancetype)initWithQuizId:(NSNumber *)quizId {
    if (self = [super init]) {
        self.quizId = quizId;
    }
    return self;
}

#pragma mark - UIViewController Override(s)

- (void)loadView {
    QuizView * quizView = [ViewFactory quizView];
    self.view = self.quizView = quizView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.quizQuestionViewCtrl = [[QuizQuestionViewController alloc] init];
    self.quizQuestionViewCtrl.delegate = self;
    [self addChildViewController:self.quizQuestionViewCtrl];
    [self.quizView.quizQuestionContainer addSubview:self.quizQuestionViewCtrl.view];
    [self.quizQuestionViewCtrl.view mas_makeConstraints:^(MASConstraintMaker * make) {
        make.edges.equalTo(self.quizView.quizQuestionContainer);
    }];
    [self.quizQuestionViewCtrl didMoveToParentViewController:self];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[[QuizProvider alloc] init] fetchQuestionsOfQuizWithId:self.quizId withCompletion:
        ^(NSArray<QuizQuestion *> * questions, NSError * error) {
            self.questions = questions;
            [self.quizView.quizProgressView reloadWithQuestionsInNumber:questions.count];
            [self.quizView.quizProgressView fillUpSegmentsInNumber:1];
            [self.quizQuestionViewCtrl reloadWithQuizQuestion:questions.firstObject];
        }];
}

#pragma mark - Quiz Navigation

- (void)goToNextQuestion {
    self.currentQuestionIndex++;
    [self.quizView.quizProgressView fillUpSegmentsInNumber:self.currentQuestionIndex + 1];
    [self.quizQuestionViewCtrl reloadWithQuizQuestion:self.questions[self.currentQuestionIndex]];
}

#pragma mark - QuizQuestionViewControllerDelegate Method(s)

- (void)userDidSelectAnswerAtIndex:(NSUInteger)answerIndex {
    if (self.currentQuestionIndex < self.questions.count - 1) {
        [self goToNextQuestion];
    }
}

@end
