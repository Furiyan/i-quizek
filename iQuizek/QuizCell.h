//
//  QuizCell.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizOverview, QuizView;

extern NSString * const QuizCellIdentifier;

@interface QuizCell : UITableViewCell

+ (CGFloat)preferredHeight;

#pragma mark - Reloading

- (void)reloadWithQuizOverview:(QuizOverview *)quizOverview;

@end
