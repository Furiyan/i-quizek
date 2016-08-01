//
//  QuizProgressView.h
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const CGFloat QuizProgressViewPreferredHeight;

@interface QuizProgressView : UIView

#pragma mark - Subview(s)

@property (nonatomic) NSArray<UIView *> * segments;

#pragma mark - Reloading

- (void)reloadWithQuestionsInNumber:(NSUInteger)count;

- (void)fillUpSegmentsInNumber:(NSUInteger)count;

@end
