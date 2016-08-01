//
//  QuizResultView.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizResultView.h"

#import "UserInterfaceConstants.h"
#import "ViewFactory.h"

#import "Masonry.h"
#import <MBCircularProgressBar/MBCircularProgressBarView.h>

@implementation QuizResultView

#pragma mark - UIView Override(s)

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstraints];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

#pragma mark - Reloading

- (void)reloadWithPercentageResult:(CGFloat)percentageResult {
    [self.percentageResultView setValue:percentageResult];
}

#pragma mark - Adding Subview(s)

- (void)addSubviews {
    [self addApplauseLabel];
    [self addPercentageResultView];
}

- (void)addApplauseLabel {
    UILabel * applauseLabel = [ViewFactory applauseLabel];
    [self addSubview:applauseLabel];
    self.applauseLabel = applauseLabel;
}

- (void)addPercentageResultView {
    MBCircularProgressBarView * percentageResultView = [ViewFactory percentageResultView];
    [self addSubview:percentageResultView];
    self.percentageResultView = percentageResultView;
}

#pragma mark - Making Constraint(s)

- (void)makeConstraints {
    [self makeConstraintsForApplauseLabel];
    [self makeConstraintsForPercentageResultView];
}

- (void)makeConstraintsForApplauseLabel {
    [self.applauseLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.percentageResultView.mas_top);
    }];
}

- (void)makeConstraintsForPercentageResultView {
    [self.percentageResultView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
}

@end
