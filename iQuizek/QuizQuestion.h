//
//  QuizQuestion.h
//  iQuizek
//
//  Created by Marcin Rainka on 01/08/16.
//  Copyright © 2016 Marcin Rainka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizAnswer;

@interface QuizQuestion : NSObject

@property (copy, nonatomic) NSNumber * order;
@property (copy, nonatomic) NSString * text;
@property (copy, nonatomic) NSArray<QuizAnswer *> * answers;

@end
