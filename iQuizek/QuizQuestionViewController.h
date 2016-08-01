//
//  QuizQuestionViewController.h
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizQuestion, QuizQuestionView;

@protocol QuizQuestionViewControllerDelegate <NSObject>

- (void)userDidSelectAnswerAtIndex:(NSUInteger)answerIndex;

@end

@interface QuizQuestionViewController : UIViewController

@property (weak, nonatomic) id<QuizQuestionViewControllerDelegate> delegate;

#pragma mark - View

@property (weak, nonatomic) QuizQuestionView * quizQuestionView;

#pragma mark - Reloading

- (void)reloadWithQuizQuestion:(QuizQuestion *)quizQuestion;

@end
