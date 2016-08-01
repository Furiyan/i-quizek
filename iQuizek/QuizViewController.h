//
//  QuizViewController.h
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizView;

@interface QuizViewController : UIViewController

#pragma mark - View

@property (weak, nonatomic) QuizView * quizView;

#pragma mark - Creating

- (instancetype)initWithQuizId:(NSNumber *)quizId;

@end
