//
//  QuizQuestionView.h
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizQuestion;

@interface QuizQuestionView : UIView

#pragma mark - Subview(s)

@property (weak, nonatomic) UILabel * questionLabel;

@property (nonatomic) NSArray<UIButton *> * answerButtons;

#pragma mark - Reloading

- (void)reloadWithQuizQuestion:(QuizQuestion *)quizQuestion;

- (void)blurAnswerButtons;
- (void)sharpenAnswerButtons;

@end
