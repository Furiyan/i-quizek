//
//  QuizView.h
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizProgressView;

@interface QuizView : UIView

#pragma mark - Subview(s)

@property (weak, nonatomic) QuizProgressView * quizProgressView;

@property (nonatomic) UIView * quizQuestionContainer;

@end
