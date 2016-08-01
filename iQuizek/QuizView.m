//
//  QuizView.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizView.h"

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
    [self addTopHairline];
    [self addQuizQuestionContainer];
}

- (void)addTopHairline {
    UIView * topHairline = [ViewFactory horizontalHairline];
    [self addSubview:topHairline];
    self.topHairline = topHairline;
}

- (void)addQuizQuestionContainer {
    UIView * quizQuestionContainer = [ViewFactory container];
    [self addSubview:quizQuestionContainer];
    self.quizQuestionContainer = quizQuestionContainer;
}

#pragma mark - Making Constraint(s)

- (void)makeConstraints {
    [self makeConstraintsForTopHairline];
    [self makeConstraintsForQuizQuestionContainer];
}

- (void)makeConstraintsForTopHairline {
    [self.topHairline mas_makeConstraints:^(MASConstraintMaker * make) {
        make.leading.equalTo(self.mas_leading);
        make.top.equalTo(self.mas_top);
        make.trailing.equalTo(self.mas_trailing);
    }];
}

- (void)makeConstraintsForQuizQuestionContainer {
    [self.quizQuestionContainer mas_makeConstraints:^(MASConstraintMaker * make) {
        make.leading.equalTo(self.mas_leading);
        make.top.equalTo(self.topHairline.mas_bottom);
        make.trailing.equalTo(self.mas_trailing);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

@end
