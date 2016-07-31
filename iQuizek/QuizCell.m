//
//  QuizCell.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizCell.h"

#import "QuizOverview.h"
#import "QuizView.h"
#import "ViewFactory.h"

#import "Masonry.h"

NSString * const QuizCellIdentifier = @"QuizCellIdentifier";

@interface QuizCell ()

#pragma mark - Subview(s)

@property (weak, nonatomic) QuizView * quizView;

@end

@implementation QuizCell

#pragma mark - UITableViewCell Override(s)

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self makeConstraints];
    }
    return self;
}

#pragma mark - Reloading

- (void)reloadWithQuizOverview:(QuizOverview *)quizOverview {
    [self.quizView reloadWithQuizOverview:quizOverview];
}

#pragma mark - Adding Subview(s)

- (void)addSubviews {
    [self addQuizView];
}

- (void)addQuizView {
    QuizView * quizView = [ViewFactory quizView];
    [self.contentView addSubview:quizView];
    self.quizView = quizView;
}

#pragma mark - Making Constraint(s)

- (void)makeConstraints {
    [self makeConstraintsForQuizView];
}

- (void)makeConstraintsForQuizView {
    [self.quizView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.edges.equalTo(self.contentView);
    }];
}

@end
