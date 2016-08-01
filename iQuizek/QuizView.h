//
//  QuizView.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizOverview;

extern const CGFloat QuizViewPreferredHeight;

@interface QuizView : UIView

#pragma mark - Subview(s)

@property (weak, nonatomic) UILabel * titleLabel;
@property (weak, nonatomic) UIView * titleContainer;

@property (weak, nonatomic) UIImageView * imageView;

#pragma mark - Reloading

- (void)reloadWithQuizOverview:(QuizOverview *)quizOverview;

@end
