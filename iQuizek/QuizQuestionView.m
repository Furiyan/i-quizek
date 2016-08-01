//
//  QuizQuestionView.m
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import "QuizQuestionView.h"

#import "QuizAnswer.h"
#import "QuizQuestion.h"
#import "UserInterfaceConstants.h"
#import "ViewFactory.h"

#import "Masonry.h"

@implementation QuizQuestionView

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

- (void)reloadWithQuizQuestion:(QuizQuestion *)quizQuestion {
    self.questionLabel.text = quizQuestion.text;
    [self reloadAnswerButtonsWithQuizQuestion:quizQuestion];
}

- (void)reloadAnswerButtonsWithQuizQuestion:(QuizQuestion *)quizQuestion {
    [self removeAnswerButtons];
    [self addAnswerButtonsWithTitles:[quizQuestion.answers valueForKey:@"text"]];
    [self makeConstraintsForAnswerButtons];
}

- (void)blurAnswerButtons {
    for (UIButton * answerButton in self.answerButtons) {
        answerButton.alpha = 0.25f;
    }
}

- (void)sharpenAnswerButtons {
    for (UIButton * answerButton in self.answerButtons) {
        answerButton.alpha = 1.0f;
    }
}

#pragma mark - Adding Subview(s)

- (void)addSubviews {
    [self addQuestionLabel];
}

- (void)addQuestionLabel {
    UILabel * questionLabel = [ViewFactory quizQuestionLabel];
    [self addSubview:questionLabel];
    self.questionLabel = questionLabel;
}

- (void)addAnswerButtonsWithTitles:(NSArray<NSString *> *)titles {
    NSMutableArray<UIButton *> * answerButtons = [self.answerButtons mutableCopy];
    for (NSString * title in titles) {
        UIButton * answerButton = [ViewFactory button];
        [answerButton setTitle:title forState:UIControlStateNormal];
        [self addSubview:answerButton];
        [answerButtons addObject:answerButton];
    }
    self.answerButtons = [answerButtons copy];
}

#pragma mark - Removing Subview(s)

- (void)removeAnswerButtons {
    for (UIButton * answerButton in self.answerButtons) {
        [answerButton removeFromSuperview];
    }
    self.answerButtons = @[];
}

#pragma mark - Making Constraint(s)

- (void)makeConstraints {
    [self makeConstraintsForQuestionLabel];
}

- (void)makeConstraintsForQuestionLabel {
    [self.questionLabel mas_makeConstraints:^(MASConstraintMaker * make) {
        make.leading.equalTo(self.mas_leading).with.offset(SmallMargin);
        make.top.equalTo(self.mas_top).with.offset(SmallMargin);
        make.trailing.equalTo(self.mas_trailing).with.offset(-SmallMargin);
    }];
}

- (void)makeConstraintsForAnswerButtons {
    UIButton * lowerButton;
    for (int buttonIndex = self.answerButtons.count - 1; buttonIndex >= 0; --buttonIndex) {
        UIButton * currentButton = self.answerButtons[buttonIndex];
        [self makeConstraintsForButton:currentButton aboveButton:lowerButton];
        lowerButton = currentButton;
    }
}

- (void)makeConstraintsForButton:(UIButton *)button
                     aboveButton:(UIButton *)lowerButton {
    [button mas_makeConstraints:^(MASConstraintMaker * make) {
        make.leading.equalTo(self.mas_leading).with.offset(SmallMargin);
        make.trailing.equalTo(self.mas_trailing).with.offset(-SmallMargin);
        if (lowerButton) {
            make.bottom.equalTo(lowerButton.mas_top).with.offset(-SmallMargin);
        } else {
            make.bottom.equalTo(self.mas_bottom).with.offset(-MediumMargin);
        }
    }];
}

@end
