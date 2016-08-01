//
//  ViewFactory.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBCircularProgressBarView, QuizOverviewView, QuizProgressView, QuizQuestionView, QuizResultView, QuizView;

@interface ViewFactory : NSObject

+ (QuizOverviewView *)quizOverviewView;
+ (QuizProgressView *)quizProgressView;
+ (QuizQuestionView *)quizQuestionView;
+ (QuizResultView *)quizResultView;
+ (QuizView *)quizView;

+ (UILabel *)quizQuestionLabel;
+ (UILabel *)quizTitleLabel;
+ (UILabel *)applauseLabel;

+ (UIImageView *)quizImageView;

+ (UITableView *)quizzesTableView;

+ (UIView *)quizTitleContainer;

+ (UIView *)horizontalHairline;

+ (UIView *)frame;

+ (MBCircularProgressBarView *)percentageResultView;
    
+ (UIButton *)button;

+ (UIView *)container;

@end
