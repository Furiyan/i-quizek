//
//  QuizResultViewController.h
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizResultView;

@protocol QuizResultViewControllerDelegate <NSObject>

- (void)userDidWantRestartQuiz;
- (void)userDidWantReturnToQuizzes;

@end

@interface QuizResultViewController : UIViewController

@property (weak, nonatomic) id<QuizResultViewControllerDelegate> delegate;

#pragma mark - View

@property (weak, nonatomic) QuizResultView * quizResultView;

#pragma mark - Creating

- (instancetype)initWithPercentageResult:(CGFloat)percentageResult;

@end
