//
//  QuizView.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
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
    }
    
    return self;
}

#pragma mark - Adding Subview(s)

- (void)addSubviews {
    [self addTitleLabel];
}

- (void)addTitleLabel {
    UILabel * titleLabel = [ViewFactory quizTitleLabel];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

#pragma mark - Making Constraint(s)

- (void)makeConstraints {
    [self makeConstraintsForTitleLabel];
}

- (void)makeConstraintsForTitleLabel {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.edges.equalTo(self);
    }];
}

@end
