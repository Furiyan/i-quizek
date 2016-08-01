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
    [self addTryAgainButton];
    [self addReturnToQuizzesButton];
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

- (void)addTryAgainButton {
    UIButton * tryAgainButton = [ViewFactory button];
    [tryAgainButton setTitle:@"Spróbuj ponownie" forState:UIControlStateNormal];
    [self addSubview:tryAgainButton];
    self.tryAgainButton = tryAgainButton;
}

- (void)addReturnToQuizzesButton {
    UIButton * returnToQuizzesButton = [ViewFactory button];
    [returnToQuizzesButton setTitle:@"Wróć do listy quizów" forState:UIControlStateNormal];
    [self addSubview:returnToQuizzesButton];
    self.returnToQuizzesButton = returnToQuizzesButton;
}

#pragma mark - Making Constraint(s)

- (void)makeConstraints {
    [self makeConstraintsForApplauseLabel];
    [self makeConstraintsForPercentageResultView];
    [self makeConstraintsForTryAgainButton];
    [self makeConstraintsForReturnToQuizzesButton];
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

- (void)makeConstraintsForTryAgainButton {
    [self.tryAgainButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.leading.equalTo(self.mas_leading).with.offset(SmallMargin);
        make.trailing.equalTo(self.returnToQuizzesButton.mas_leading).with.offset(-SmallMargin);
        make.bottom.equalTo(self.mas_bottom).with.offset(-MediumMargin);
        make.width.equalTo(self.returnToQuizzesButton.mas_width);
    }];
}

- (void)makeConstraintsForReturnToQuizzesButton {
    [self.returnToQuizzesButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.trailing.equalTo(self.mas_trailing).with.offset(-SmallMargin);
        make.bottom.equalTo(self.mas_bottom).with.offset(-MediumMargin);
    }];
}

@end
