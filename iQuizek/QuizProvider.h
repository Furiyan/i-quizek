//
//  QuizProvider.h
//  iQuizek
//
//  Created by Marcin Rainka on 31/07/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizOverview;

@interface QuizProvider : NSObject

#pragma mark - Fetching the Data

- (void)fetchQuizOverviewsWithCompletion:(void (^)(NSArray<QuizOverview *> * quizzes, NSError * error))completion;

@end
