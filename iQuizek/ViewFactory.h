//
//  ViewFactory.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizOverviewView, QuizProgressView, QuizQuestionView, QuizView;

@interface ViewFactory : NSObject

+ (QuizOverviewView *)quizOverviewView;
+ (QuizProgressView *)quizProgressView;
+ (QuizView *)quizView;
+ (QuizQuestionView *)quizQuestionView;
    
+ (UILabel *)quizQuestionLabel;
+ (UILabel *)quizTitleLabel;

+ (UIImageView *)quizImageView;

+ (UITableView *)quizzesTableView;

+ (UIView *)quizTitleContainer;

+ (UIView *)horizontalHairline;

+ (UIView *)frame;
    
+ (UIButton *)button;

+ (UIView *)container;

@end
