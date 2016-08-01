//
//  QuizOverviewView.m
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizOverviewView.h"

#import "Photo.h"
#import "QuizOverview.h"
#import "UserInterfaceConstants.h"
#import "ViewFactory.h"

#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

const CGFloat QuizOverviewViewPreferredHeight = 150.0f;

@implementation QuizOverviewView

#pragma mark - UIView Override(s)

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstraints];
    }
    return self;
}

#pragma mark - Reloading

- (void)reloadWithQuizOverview:(QuizOverview *)quizOverview {
    self.titleLabel.text = quizOverview.title;
    [self.imageView sd_setImageWithURL:quizOverview.mainPhoto.url];
}

#pragma mark - Adding Subview(s)

- (void)addSubviews {
    [self addImageView];
    [self addTitleContainer];
    [self addTitleLabel];
}

- (void)addTitleLabel {
    UILabel * titleLabel = [ViewFactory quizTitleLabel];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)addTitleContainer {
    UIView * titleContainer = [ViewFactory quizTitleContainer];
    [self addSubview:titleContainer];
    self.titleContainer = titleContainer;
}

- (void)addImageView {
    UIImageView * imageView = [ViewFactory quizImageView];
    [self addSubview:imageView];
    self.imageView = imageView;
}

#pragma mark - Making Constraint(s)

- (void)makeConstraints {
    [self makeConstraintsForImageView];
    [self makeConstraintsForTitleContainer];
    [self makeConstraintsForTitleLabel];
}

- (void)makeConstraintsForTitleLabel {
    UIEdgeInsets padding = UIEdgeInsetsMake(SmallMargin, SmallMargin, SmallMargin, SmallMargin);
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.edges.equalTo(self.titleContainer).with.insets(padding);
    }];
}

- (void)makeConstraintsForTitleContainer {
    [self.titleContainer mas_makeConstraints:^(MASConstraintMaker * make) {
        make.leading.equalTo(self.mas_leading);
        make.trailing.equalTo(self.mas_trailing);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (void)makeConstraintsForImageView {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.leading.equalTo(self.mas_leading);
        make.top.equalTo(self.mas_top);
        make.trailing.equalTo(self.mas_trailing);
        make.bottom.equalTo(self.titleContainer.mas_top);
    }];
}

@end
