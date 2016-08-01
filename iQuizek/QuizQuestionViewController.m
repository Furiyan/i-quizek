//
//  QuizQuestionViewController.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizQuestionViewController.h"

#import "QuizQuestionView.h"
#import "ViewFactory.h"

@interface QuizQuestionViewController ()

@end

@implementation QuizQuestionViewController

#pragma mark - UIViewController Override(s)

- (void)loadView {
    QuizQuestionView * quizQuestionView = [ViewFactory quizQuestionView];
    self.view = self.quizQuestionView = quizQuestionView;
}

#pragma mark - Reloading

- (void)reloadWithQuizQuestion:(QuizQuestion *)quizQuestion {
    [self.quizQuestionView reloadWithQuizQuestion:quizQuestion];
    [self setUpAnswerButtons];
}

- (void)enableAnswerButtons {
    for (UIButton * answerButton in self.quizQuestionView.answerButtons) {
        answerButton.enabled = YES;
    }
    [self.quizQuestionView sharpenAnswerButtons];
}

- (void)disableAnswerButtons {
    for (UIButton * answerButton in self.quizQuestionView.answerButtons) {
        answerButton.enabled = NO;
    }
    [self.quizQuestionView blurAnswerButtons];
}

#pragma mark - Answer Selecting

- (void)selectAnswerWithButton:(UIButton *)button {
    if (self.delegate) {
        [self.delegate userDidSelectAnswerAtIndex:[self.quizQuestionView.answerButtons indexOfObject:button]];
    }
}

#pragma mark - Setup

- (void)setUpAnswerButtons {
    for (UIButton * answerButton in self.quizQuestionView.answerButtons) {
        [answerButton addTarget:self
                         action:@selector(selectAnswerWithButton:)
               forControlEvents:UIControlEventTouchUpInside];
    }
}

@end
