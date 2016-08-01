//
//  QuizResultView.h
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBCircularProgressBarView;

@interface QuizResultView : UIView

#pragma mark - Subview(s)

@property (weak, nonatomic) UILabel * applauseLabel;
@property (weak, nonatomic) MBCircularProgressBarView * percentageResultView;

#pragma mark - Reloading

- (void)reloadWithPercentageResult:(CGFloat)percentageResult;

@end
