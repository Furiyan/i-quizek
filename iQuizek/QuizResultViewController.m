//
//  QuizResultViewController.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizResultViewController.h"

#import "QuizResultView.h"
#import "ViewFactory.h"

@interface QuizResultViewController ()

@property (nonatomic) CGFloat percentageResult;

@end

@implementation QuizResultViewController

#pragma mark - Creating

- (instancetype)initWithPercentageResult:(CGFloat)percentageResult {
    if (self = [super init]) {
        self.percentageResult = percentageResult;
    }
    return self;
}

#pragma mark - UIViewController Override(s)

- (void)loadView {
    QuizResultView * quizResultView = [ViewFactory quizResultView];
    self.view = self.quizResultView = quizResultView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpButtons];
    [self.quizResultView reloadWithPercentageResult:self.percentageResult];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Action(s)

- (void)restartQuiz {
    if (self.delegate) {
        [self.delegate userDidWantRestartQuiz];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)returnToQuizzes {
    if (self.delegate) {
        [self.delegate userDidWantReturnToQuizzes];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Setup

- (void)setUpButtons {
    [self.quizResultView.tryAgainButton addTarget:self
                                           action:@selector(restartQuiz)
                                 forControlEvents:UIControlEventTouchUpInside];
    [self.quizResultView.returnToQuizzesButton addTarget:self
                                                  action:@selector(returnToQuizzes)
                                        forControlEvents:UIControlEventTouchUpInside];
}

@end
