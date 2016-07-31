//
//  QuizView.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizOverview;

@interface QuizView : UIView

#pragma mark - Subview(s)

@property (weak, nonatomic) UILabel * titleLabel;

#pragma mark - Reloading

- (void)reloadWithQuizOverview:(QuizOverview *)quizOverview;

@end
