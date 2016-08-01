//
//  QuizView.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizView.h"

#import "QuizProgressView.h"
#import "ViewFactory.h"

#import "Masonry.h"

@implementation QuizView

#pragma mark - UIView Override(s)

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstraints];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

#pragma mark - Adding Subview(s)

- (void)addSubviews {
    [self addQuizProgressView];
    [self addQuizQuestionContainer];
}

- (void)addQuizProgressView {
    QuizProgressView * quizProgressView = [ViewFactory quizProgressView];
    [self addSubview:quizProgressView];
    self.quizProgressView = quizProgressView;
}

- (void)addQuizQuestionContainer {
    UIView * quizQuestionContainer = [ViewFactory container];
    [self addSubview:quizQuestionContainer];
    self.quizQuestionContainer = quizQuestionContainer;
}

#pragma mark - Making Constraint(s)

- (void)makeConstraints {
    [self makeConstraintsForQuizProgressView];
    [self makeConstraintsForQuizQuestionContainer];
}

- (void)makeConstraintsForQuizProgressView {
    [self.quizProgressView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.leading.equalTo(self.mas_leading);
        make.top.equalTo(self.mas_top);
        make.trailing.equalTo(self.mas_trailing);
        make.height.equalTo(@(QuizProgressViewPreferredHeight));
    }];
}

- (void)makeConstraintsForQuizQuestionContainer {
    [self.quizQuestionContainer mas_makeConstraints:^(MASConstraintMaker * make) {
        make.leading.equalTo(self.mas_leading);
        make.top.equalTo(self.quizProgressView.mas_bottom);
        make.trailing.equalTo(self.mas_trailing);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

@end
