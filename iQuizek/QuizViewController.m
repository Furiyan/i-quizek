//
//  QuizViewController.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizViewController.h"

#import "QuizAnswer.h"
#import "QuizProgressView.h"
#import "QuizProvider.h"
#import "QuizQuestion.h"
#import "QuizQuestionViewController.h"
#import "QuizResultViewController.h"
#import "QuizView.h"
#import "ViewFactory.h"

#import "Masonry.h"

@interface QuizViewController () <QuizQuestionViewControllerDelegate, QuizResultViewControllerDelegate>

@property (weak, nonatomic) NSNumber * quizId;

@property (nonatomic) NSArray<QuizQuestion *> * questions;

@property (nonatomic) NSUInteger currentQuestionIndex;

@property (nonatomic) NSUInteger correctAnswers;

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
    if (self.questions.count) {
        return;
    }
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

- (void)finishQuiz {
    CGFloat percentageResult = (float)self.correctAnswers / self.questions.count * 100.0f;
    QuizResultViewController * resultViewCtrl
        = [[QuizResultViewController alloc] initWithPercentageResult:percentageResult];
    resultViewCtrl.delegate = self;
    resultViewCtrl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:resultViewCtrl animated:YES completion:nil];
}

- (void)restartQuiz {
    self.currentQuestionIndex = 0;
    self.correctAnswers = 0;
    [self.quizView.quizProgressView fillUpSegmentsInNumber:1];
    [self.quizQuestionViewCtrl reloadWithQuizQuestion:self.questions.firstObject];
}

#pragma mark - QuizQuestionViewControllerDelegate Method(s)

- (void)userDidSelectAnswerAtIndex:(NSUInteger)answerIndex {
    if (self.questions[self.currentQuestionIndex].answers[answerIndex].correct) {
        self.correctAnswers++;
    }
    if (self.currentQuestionIndex < self.questions.count - 1) {
        [self goToNextQuestion];
    } else {
        [self finishQuiz];
    }
}

#pragma mark - QuizResultViewControllerDelegate Method(s)

- (void)userDidWantRestartQuiz {
    [self restartQuiz];
}

- (void)userDidWantReturnToQuizzes {
    [self.navigationController popViewControllerAnimated:NO];
}

@end
