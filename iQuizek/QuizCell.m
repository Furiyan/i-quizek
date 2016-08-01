//
//  QuizCell.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizCell.h"

#import "QuizOverview.h"
#import "QuizOverviewView.h"
#import "ViewFactory.h"

#import "Masonry.h"

NSString * const QuizCellIdentifier = @"QuizCellIdentifier";

@interface QuizCell ()

#pragma mark - Subview(s)

@property (weak, nonatomic) QuizOverviewView * quizOverviewView;

@end

@implementation QuizCell

+ (CGFloat)preferredHeight {
    return QuizOverviewViewPreferredHeight;
}

- (void)removeSeparatorMargins {
    self.preservesSuperviewLayoutMargins = NO;
    self.layoutMargins = UIEdgeInsetsZero;
}

#pragma mark - UITableViewCell Override(s)

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self makeConstraints];
        [self style];
        [self removeSeparatorMargins];
    }
    return self;
}

#pragma mark - Reloading

- (void)reloadWithQuizOverview:(QuizOverview *)quizOverview {
    [self.quizOverviewView reloadWithQuizOverview:quizOverview];
}

#pragma mark - Adding Subview(s)

- (void)addSubviews {
    [self addQuizView];
}

- (void)addQuizView {
    QuizOverviewView * quizOverviewView = [ViewFactory quizOverviewView];
    [self.contentView addSubview:quizOverviewView];
    self.quizOverviewView = quizOverviewView;
}

#pragma mark - Making Constraint(s)

- (void)makeConstraints {
    [self makeConstraintsForQuizOverviewView];
}

- (void)makeConstraintsForQuizOverviewView {
    [self.quizOverviewView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.edges.equalTo(self.contentView);
    }];
}

#pragma mark - Styling

- (void)style {
    self.backgroundColor = [UIColor blackColor];
}

@end
